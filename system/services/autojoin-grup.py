import sys
import json
import asyncio
import pymysql
from telethon import TelegramClient
from telethon.sessions import StringSession
from telethon.errors import UserAlreadyParticipantError, UsernameNotOccupiedError
from telethon.tl.functions.channels import JoinChannelRequest

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

def connect_db(db_conf):
    return pymysql.connect(
        **db_conf,
        cursorclass=pymysql.cursors.DictCursor
    )

async def validate_groups(id_telegram, usernames, api_id, api_hash, db_conf):
    conn = connect_db(db_conf)
    try:
        with conn.cursor() as cursor:
            cursor.execute("""
                SELECT string_session FROM riwayat_login_userbot
                WHERE id_telegram = %s AND status = 'LOGGED_IN'
                ORDER BY updated_at DESC LIMIT 1
            """, (id_telegram,))
            row = cursor.fetchone()
            if not row:
                return {"status": "ERROR", "message": "Session tidak ditemukan."}
            session_str = row["string_session"]
    finally:
        conn.close()

    client = create_client(session_str, api_id, api_hash)
    await client.connect()
    try:
        hasil = []
        for username in usernames:
            try:
                entity = await client.get_entity(username)
                if not hasattr(entity, "title"):
                    continue
                hasil.append({
                    "username": username,
                    "title": entity.title
                })
            except UsernameNotOccupiedError:
                continue
            except Exception:
                continue  # skip jika gagal
        return {"status": "OK", "groups": hasil}
    finally:
        await client.disconnect()

async def join_groups(id_telegram, groups, api_id, api_hash, db_conf):
    conn = connect_db(db_conf)
    try:
        with conn.cursor() as cursor:
            cursor.execute("""
                SELECT string_session FROM riwayat_login_userbot
                WHERE id_telegram = %s AND status = 'LOGGED_IN'
                ORDER BY updated_at DESC LIMIT 1
            """, (id_telegram,))
            row = cursor.fetchone()
            if not row:
                return {"status": "ERROR", "message": "Session tidak ditemukan."}
            session_str = row["string_session"]
    finally:
        conn.close()

    client = create_client(session_str, api_id, api_hash)
    await client.connect()
    hasil_join = []
    try:
        for grup in groups:
            username = grup.get("username")
            if not username:
                continue
            try:
                entity = await client.get_entity(username)
                await client(JoinChannelRequest(entity))
                nama_grup = getattr(entity, "title", "Unknown")
                id_grup = entity.id
                access_hash = getattr(entity, "access_hash", None)

                # Simpan ke database
                conn = connect_db(db_conf)
                try:
                    with conn.cursor() as cursor:
                        cursor.execute("""
                            INSERT INTO grup_sebar_userbot (id_telegram, nama_grup, username_grup, link_grup, id_grup, access_hash)
                            VALUES (%s, %s, %s, %s, %s, %s)
                            ON DUPLICATE KEY UPDATE nama_grup = VALUES(nama_grup)
                        """, (
                            id_telegram,
                            nama_grup,
                            username,
                            f"https://t.me/{username}",
                            id_grup,
                            access_hash
                        ))
                        conn.commit()
                finally:
                    conn.close()

                hasil_join.append({
                    "username": username,
                    "title": nama_grup
                })

            except UserAlreadyParticipantError:
                hasil_join.append({ "username": username, "title": "(Sudah Gabung)" })
            except Exception:
                continue

        return {"status": "OK", "joined": hasil_join}
    finally:
        await client.disconnect()

async def main():
    try:
        raw = sys.stdin.read()
        data = json.loads(raw)
        mode = data.get("mode")
        id_telegram = data.get("id_telegram")
        api_id = int(data.get("api_id"))
        api_hash = data.get("api_hash")
        db_conf = data.get("db_config", {})

        if mode == "VALIDATE_GROUPS":
            usernames = data.get("groups", [])
            result = await validate_groups(id_telegram, usernames, api_id, api_hash, db_conf)
        elif mode == "JOIN_GROUPS":
            groups = data.get("groups", [])
            result = await join_groups(id_telegram, groups, api_id, api_hash, db_conf)
        else:
            result = {"status": "ERROR", "message": "Mode tidak valid."}

        print(json.dumps(result), flush=True)
    except Exception as e:
        print(json.dumps({"status": "ERROR", "message": str(e)}), flush=True)

if __name__ == "__main__":
    asyncio.run(main())
