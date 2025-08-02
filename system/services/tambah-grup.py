import sys
import json
import asyncio
import pymysql
from telethon import TelegramClient
from telethon.sessions import StringSession
from telethon.tl.types import Channel, Chat, PeerChannel, InputPeerChannel
from telethon.tl.functions.channels import JoinChannelRequest
from telethon.tl.functions.messages import ImportChatInviteRequest
from telethon.errors import UserAlreadyParticipantError
import re

def log(msg):
    print(f"[TAMBAH-GRUP.PY] {msg}", file=sys.stderr, flush=True)

def connect_db(db_conf):
    return pymysql.connect(
        **db_conf,
        cursorclass=pymysql.cursors.DictCursor
    )


def create_client(session_str, api_id, api_hash):
    return TelegramClient(
        StringSession(session_str),
        api_id,
        api_hash,
        device_model="iPhone 14 Pro",
        system_version="iOS 17.0",
        app_version="9.7",
        lang_code="en",
        system_lang_code="en"
    )

async def list_groups(id_telegram, api_id, api_hash, db_conf):
    conn = connect_db(db_conf)
    try:
        with conn.cursor() as cursor:
            # Ambil session dari userbot
            cursor.execute("""
                SELECT string_session
                FROM riwayat_login_userbot
                WHERE id_telegram = %s AND status = 'LOGGED_IN'
                ORDER BY updated_at DESC LIMIT 1
            """, (id_telegram,))
            row = cursor.fetchone()
            if not row:
                return {"status": "ERROR", "message": "Session tidak ditemukan."}
            session_str = row["string_session"]

            # Ambil semua grup dari tabel grup_sebar
            cursor.execute("SELECT * FROM grup_sebar_userbot")
            grup_db = cursor.fetchall()

            db_groups = []
            existing_pairs = set()  # (id_telegram, id_grup)
            for r in grup_db:
                if r["id_telegram"] == id_telegram:
                    existing_pairs.add((r["id_telegram"], r["id_grup"]))
                    group_id = int(r["id_grup"])
                    db_groups.append({
                        "username": r["username_grup"],
                        "title": r["nama_grup"],
                        "id_grup": group_id,
                        "access_hash": r["access_hash"],
                        "type": "private" if r["username_grup"] is None else "public",
                        "source": "database"
                    })

            existing_ids = set([grup_id for _, grup_id in existing_pairs])

    finally:
        conn.close()

    client = create_client(session_str, api_id, api_hash)
    await client.connect()
    try:
        dialogs = await client.get_dialogs()
        groups = db_groups.copy()

        for dialog in dialogs:
            entity = dialog.entity
            if isinstance(entity, (Channel, Chat)) and getattr(entity, 'megagroup', True):
                entity_id = int(entity.id)
                if entity_id not in existing_ids:
                    groups.append({
                        "username": getattr(entity, 'username', None),
                        "title": getattr(entity, 'title', 'Unknown'),
                        "id_grup": entity_id,
                        "access_hash": getattr(entity, 'access_hash', None),
                        "type": "private" if getattr(entity, 'username', None) is None else "public",
                        "source": "userbot"
                    })
                    existing_ids.add(entity_id)

        return {"status": "OK", "groups": groups}
    finally:
        await client.disconnect()


async def add_group(id_telegram, api_id, api_hash, db_conf, username_grup, link_grup=None, id_grup=None, access_hash=None):
    conn = connect_db(db_conf)
    try:
        with conn.cursor() as cursor:
            cursor.execute("SELECT string_session FROM riwayat_login_userbot WHERE id_telegram = %s AND status = 'LOGGED_IN' ORDER BY updated_at DESC LIMIT 1", (id_telegram,))
            row = cursor.fetchone()
            if not row:
                return {"status": "ERROR", "message": "Session tidak ditemukan."}
            session_str = row["string_session"]
    finally:
        conn.close()

    client = create_client(session_str, api_id, api_hash)
    await client.connect()
    try:
        entity = None

        # Jika ada username grup (bisa public group atau private dengan username)
        if username_grup:
            try:
                entity = await client.get_entity(username_grup)
            except Exception as e:
                return {"status": "ERROR", "message": f"Gagal mendapatkan entitas grup: {e}"}

        # Jika ada ID dan access hash (biasanya untuk channel private)
        elif id_grup and access_hash:
            try:
                entity = await client.get_entity(InputPeerChannel(int(id_grup), int(access_hash)))
                username_grup = None
            except Exception as e:
                return {"status": "ERROR", "message": f"Gagal mendapatkan entitas berdasarkan ID + hash: {e}"}

        elif link_grup:
            # Jika diberikan link invite (t.me/+xxxxxx)
            try:
                invite_hash = re.search(r"(?:t\.me\/joinchat\/|\+)([a-zA-Z0-9_-]+)", link_grup)
                if invite_hash:
                    entity = await client(ImportChatInviteRequest(invite_hash.group(1)))
                else:
                    return {"status": "ERROR", "message": "Link grup tidak valid."}
            except Exception as e:
                return {"status": "ERROR", "message": f"Gagal join dari link: {e}"}

        else:
            return {"status": "ERROR", "message": "Diperlukan username_grup, id_grup + access_hash, atau link_grup"}

        # Join ke grup jika belum bergabung
        try:
            await client(JoinChannelRequest(entity))
        except UserAlreadyParticipantError:
            pass  # Sudah jadi anggota
        except Exception as e:
            return {"status": "ERROR", "message": f"Gagal join ke grup: {e}"}

        nama_grup = getattr(entity, "title", "Unknown")
        group_id = entity.id
        group_access_hash = getattr(entity, "access_hash", None)

        conn = connect_db(db_conf)
        try:
            with conn.cursor() as cursor:
                cursor.execute(
                    """
                    INSERT INTO grup_sebar_userbot (id_telegram, nama_grup, username_grup, link_grup, id_grup, access_hash)
                    VALUES (%s, %s, %s, %s, %s, %s)
                    """,
                    (id_telegram, nama_grup, username_grup, link_grup, group_id, group_access_hash)
                )
                conn.commit()
        finally:
            conn.close()

        return {"status": "OK", "title": nama_grup}
    except Exception as e:
        return {"status": "ERROR", "message": str(e)}
    finally:
        await client.disconnect()

async def main():
    try:
        input_data = sys.stdin.read().strip()
        if not input_data:
            raise ValueError("Input tidak ditemukan")
        data = json.loads(input_data)
        mode = data.get("mode")
        id_telegram = data.get("id_telegram")
        api_id = int(data.get("api_id"))
        api_hash = data.get("api_hash")
        db_conf = data.get("db_config", {})

        if mode == "LIST_GROUPS":
            result = await list_groups(id_telegram, api_id, api_hash, db_conf)
        elif mode == "ADD_GROUP":
           result = await add_group(
                id_telegram=id_telegram,
                api_id=api_id,
                api_hash=api_hash,
                db_conf=db_conf,
                username_grup=data.get("username_grup"),
                link_grup=data.get("link_grup"),
                id_grup=data.get("id_grup"),
                access_hash=data.get("access_hash")
            )
        else:
            raise ValueError("Mode tidak valid")

        print(json.dumps(result), flush=True)

    except Exception as e:
        print(json.dumps({"status": "ERROR", "message": str(e)}), flush=True)

if __name__ == "__main__":
    asyncio.run(main())
