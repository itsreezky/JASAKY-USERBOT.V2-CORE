import sys
import json
import time
import random
import asyncio
import pymysql
from telethon import TelegramClient
from telethon.tl.functions.channels import JoinChannelRequest, GetParticipantsRequest
from telethon.tl.types import ChannelParticipantsSearch
from telethon.sessions import StringSession
from telethon.errors import (
    SessionPasswordNeededError,
    PhoneCodeInvalidError,
    PhoneCodeExpiredError,
    FloodWaitError
)

def log(msg):
    print(f"[LOGIN.PY] {msg}", file=sys.stderr, flush=True)

def connect_db_with_retry(db_conf, retries=3, delay=2):
    for i in range(retries):
        try:
            log(f"[LOGIN.PY] Attempting connection (try {i+1})...")
            conn = pymysql.connect(
                **db_conf,
                cursorclass=pymysql.cursors.DictCursor
            )
            log("[LOGIN.PY] Connected.")
            return conn
        except Exception as e:
            log(f"[LOGIN.PY] ❌ Connection failed: {str(e)}")
            if i == retries - 1:
                raise e
            time.sleep(delay)

def natural_delay(min_seconds=1.5, max_seconds=3.0):
    delay = round(random.uniform(min_seconds, max_seconds), 2)
    log(f"[LOGIN.PY] Sleeping for {delay} seconds...")
    time.sleep(delay)

def create_client(api_id, api_hash, session_str=None, ):
    return TelegramClient(
        StringSession(session_str) if session_str else StringSession(),
        api_id,
        api_hash,
        device_model="iPhone 14 Pro",
        system_version="iOS 17.0",
        app_version="9.7",
        lang_code="en",
        system_lang_code="en"
    )

async def join_and_verify_channel(client, channel_username):
    try:
        # Coba join channel
        log(f"[LOGIN.PY]  Mencoba join ke channel @{channel_username}")
        await asyncio.sleep(2)  # Delay alami
        await client(JoinChannelRequest(channel_username))
        log("[LOGIN.PY] ✅ JoinChannelRequest berhasil dikirim")

        # Verifikasi apakah akun benar-benar tergabung
        me = await client.get_me()
        entity = await client.get_entity(channel_username)

        participants = await client(GetParticipantsRequest(
            channel=entity,
            filter=ChannelParticipantsSearch(query=me.username or ""),
            offset=0,
            limit=1,
            hash=0
        ))

        user_ids = [u.id for u in participants.users]
        if me.id in user_ids:
            log(f"[LOGIN.PY] ✅ Verifikasi berhasil: akun kamu tergabung di @{channel_username}")
            return True
        else:
            log(f"[LOGIN.PY] ❌ Verifikasi gagal: akun tidak ditemukan dalam daftar channel")
            return False

    except FloodWaitError as e:
        log(f"[LOGIN.PY] ⏳ Flood wait: harus menunggu {e.seconds} detik")
        await asyncio.sleep(e.seconds)
        return False
    except Exception as e:
        log(f"[LOGIN.PY] ❌ Gagal join atau verifikasi channel: {str(e)}")
        return False

async def handle_send_code(data):
    log("[LOGIN.PY] Start")
    nomor_hp = data.get("phone")
    id_telegram = data.get("id_telegram")
    api_id = int(data.get("api_id"))
    api_hash = data.get("api_hash")
    db_conf = data.get("db_config")

    if not nomor_hp or not id_telegram:
        print(json.dumps({"status": "ERROR", "message": "Nomor HP atau id_telegram tidak ditemukan"}), flush=True)
        return

    if not nomor_hp.startswith("+"):
        print(json.dumps({"status": "ERROR", "message": "Nomor HP harus diawali dengan +"}), flush=True)
        return

    client = create_client(api_id, api_hash)
    await client.connect()

    try:
        log(f"[LOGIN.PY] Mengirim kode ke {nomor_hp}")
        sent = await client.send_code_request(nomor_hp)
        phone_code_hash = sent.phone_code_hash
        session_string = client.session.save()

        if not phone_code_hash:
            raise ValueError("phone_code_hash tidak tersedia")

        conn = connect_db_with_retry(db_conf)
        with conn.cursor() as cursor:
            cursor.execute("""
                INSERT INTO riwayat_login_userbot (id_telegram, nomor_hp, phone_code_hash, string_session, status)
                VALUES (%s, %s, %s, %s, 'WAITING_OTP')
                ON DUPLICATE KEY UPDATE
                    phone_code_hash = VALUES(phone_code_hash),
                    string_session = VALUES(string_session),
                    status = 'WAITING_OTP',
                    updated_at = NOW()
            """, (id_telegram, nomor_hp, phone_code_hash, session_string))
            cursor.execute("SELECT id FROM riwayat_login_userbot WHERE id_telegram = %s ORDER BY updated_at DESC LIMIT 1", (id_telegram,))
            row = cursor.fetchone()
            login_id = row['id'] if row else None
            conn.commit()
        conn.close()

        natural_delay()

        if login_id:
            print(json.dumps({"status": "WAITING_CODE", "id": login_id}), flush=True)
        else:
            print(json.dumps({"status": "ERROR", "message": "Gagal mendapatkan ID login"}), flush=True)

    except FloodWaitError as e:
        print(json.dumps({"status": "FLOOD_WAIT", "wait_seconds": e.seconds}), flush=True)
    except Exception as e:
        print(json.dumps({"status": "ERROR", "message": str(e)}), flush=True)
    finally:
        await client.disconnect()

async def handle_verify_code(data):
    log("[LOGIN.PY] Start")
    login_id = data.get("id")
    kode = data.get("kode")
    token = data.get("token")
    api_id = int(data.get("api_id"))
    api_hash = data.get("api_hash")
    db_conf = data.get("db_config")

    if not login_id or not kode or not token:
        print(json.dumps({"status": "ERROR", "message": "ID login, kode atau token tidak ditemukan"}), flush=True)
        return

    kode = kode.replace(" ", "")
    conn = connect_db_with_retry(db_conf)
    with conn.cursor() as cursor:
        cursor.execute("SELECT * FROM riwayat_login_userbot WHERE id = %s", (login_id,))
        row = cursor.fetchone()
    conn.close()

    if not row or not row['nomor_hp'] or not row['phone_code_hash']:
        print(json.dumps({"status": "ERROR", "message": "Data login tidak lengkap"}), flush=True)
        return

    nomor_hp = row['nomor_hp']
    phone_code_hash = row['phone_code_hash']
    session_string = row.get("string_session") or ""

    client = create_client(api_id, api_hash, session_string)
    await client.connect()

    try:
        log(f"[LOGIN.PY] is_user_authorized = {await client.is_user_authorized()}")
        user = None

        if not await client.is_user_authorized():
            try:
                log(f"[LOGIN.PY] sign_in({nomor_hp}, {kode}, {phone_code_hash})")
                user = await client.sign_in(
                    phone=nomor_hp,
                    code=kode,
                    phone_code_hash=phone_code_hash
                )
                log("[LOGIN.PY] sign_in berhasil")

                # Auto join ke channel
                log("[LOGIN.PY] 🔔 Join ke channel @JASAKY_ID")
                await join_and_verify_channel(client, "JASAKY_ID")

            except SessionPasswordNeededError:
                session_string = client.session.save()
                conn = connect_db_with_retry(db_conf)
                with conn.cursor() as cursor:
                    cursor.execute("""
                        UPDATE riwayat_login_userbot
                        SET string_session = %s, status = 'WAITING_PASSWORD', updated_at = NOW()
                        WHERE id = %s
                    """, (session_string, login_id))
                    conn.commit()
                conn.close()
                print(json.dumps({"status": "WAITING_PASSWORD", "string_session": session_string}), flush=True)
                return
            except PhoneCodeInvalidError:
                print(json.dumps({"status": "ERROR", "message": "Kode OTP salah"}), flush=True)
                return
            except PhoneCodeExpiredError:
                print(json.dumps({"status": "ERROR", "message": "Kode OTP kadaluarsa"}), flush=True)
                return
            except Exception as e:
                log(f"[LOGIN.PY] sign_in gagal: {str(e)}")
                print(json.dumps({"status": "ERROR", "message": str(e)}), flush=True)
                return
        else:
            user = await client.get_me()
            log("[LOGIN.PY] Sudah authorized, user diambil dari get_me()")

        session_string = client.session.save()

        # Cek token dari input di tabel token_login
        level = "MEMBER"
        saldo_coin = 0
        token_id = None

        conn = connect_db_with_retry(db_conf)
        with conn.cursor() as cursor:
            cursor.execute("SELECT * FROM token_login_userbot WHERE token = %s AND sudah_dipakai = 0", (token,))
            token_row = cursor.fetchone()
            if token_row:
                level = token_row.get("level") or "MEMBER"
                saldo_coin = token_row.get("coin") or 0
                token_id = token_row.get("id")

        if not token_id:
            print(json.dumps({"status": "ERROR", "message": "Token tidak valid atau sudah digunakan"}), flush=True)
            return

        # Simpan ke database
        with conn.cursor() as cursor:
            # Insert/update pengguna
            cursor.execute("""
                INSERT INTO pengguna_userbot (id_telegram, nomor_hp, nama_depan, nama_belakang, username, level, saldo_coin, dibuat_pada)
                VALUES (%s, %s, %s, %s, %s, %s, %s, CURRENT_TIMESTAMP())
                ON DUPLICATE KEY UPDATE
                    nomor_hp = VALUES(nomor_hp),
                    nama_depan = VALUES(nama_depan),
                    nama_belakang = VALUES(nama_belakang),
                    username = VALUES(username),
                    level = VALUES(level),
                    saldo_coin = VALUES(saldo_coin),
                    dibuat_pada = CURRENT_TIMESTAMP()
            """, (
                user.id,
                nomor_hp,
                user.first_name if user.first_name else None,
                user.last_name if user.last_name else None,
                user.username if user.username else None,
                level,
                saldo_coin
            ))

            # Update token_login
            cursor.execute("""
                UPDATE token_login_userbot
                SET id_telegram = %s, sudah_dipakai = 1
                WHERE id = %s
            """, (user.id, token_id))

            # Update riwayat login
            cursor.execute("""
                UPDATE riwayat_login_userbot
                SET session_data = %s, status = 'LOGGED_IN', updated_at = NOW()
                WHERE id = %s
            """, (session_string, login_id))

            conn.commit()
        conn.close()

        natural_delay()

        print(json.dumps({
            "status": "OK",
            "user": {
                "id": user.id,
                "first_name": user.first_name,
                "last_name": user.last_name,
                "username": user.username
            },
            "string_session": session_string
        }), flush=True)

    except Exception as e:
        log(f"[LOGIN.PY] ❌ Unexpected error: {str(e)}")
        print(json.dumps({"status": "ERROR", "message": str(e)}), flush=True)
    finally:
        await client.disconnect()


async def handle_verify_password(data):
    log("[LOGIN.PY] Start")
    password = data.get("password")
    string_session = data.get("string_session")
    token = data.get("token")
    api_id = int(data.get("api_id"))
    api_hash = data.get("api_hash")
    db_conf = data.get("db_config")

    if not password or not string_session:
        print(json.dumps({"status": "ERROR", "message": "Password atau session tidak ditemukan"}), flush=True)
        return

    client = create_client(api_id, api_hash, string_session)
    await client.connect()

    try:
        await client.sign_in(password=password)
        me = await client.get_me()
        session_string = client.session.save()

        # Auto join ke channel
        log("[LOGIN.PY] 🔔 Join ke channel @JASAKY_ID")
        await join_and_verify_channel(client, "JASAKY_ID")

        conn = connect_db_with_retry(db_conf)
        with conn.cursor() as cursor:
            # Ambil nomor HP dan login_id dari riwayat_login
            cursor.execute("SELECT nomor_hp, id FROM riwayat_login_userbot WHERE string_session = %s", (string_session,))
            row = cursor.fetchone()
            nomor_hp = row["nomor_hp"] if row else None
            login_id = row["id"] if row else None

            # Default level dan coin
            level = 'MEMBER'
            saldo_coin = 0
            token_id = None

            if token:
                # Ambil data dari token_login jika ada token yang diberikan
                cursor.execute("SELECT * FROM token_login_userbot WHERE token = %s AND sudah_dipakai = 0", (token,))
                token_data = cursor.fetchone()

                if token_data:
                    level = token_data.get("level") or "MEMBER"
                    saldo_coin = token_data.get("coin") or 0
                    token_id = token_data.get("id")

                    # Tandai token sebagai sudah dipakai
                    cursor.execute("""
                        UPDATE token_login_userbot
                        SET id_telegram = %s, sudah_dipakai = 1
                        WHERE id = %s
                    """, (me.id, token_id))

            # Simpan/Update ke tabel pengguna
            cursor.execute("""
                INSERT INTO pengguna_userbot (id_telegram, nomor_hp, nama_depan, nama_belakang, username, level, saldo_coin, dibuat_pada)
                VALUES (%s, %s, %s, %s, %s, %s, %s, CURRENT_TIMESTAMP())
                ON DUPLICATE KEY UPDATE
                    nomor_hp = VALUES(nomor_hp),
                    nama_depan = VALUES(nama_depan),
                    nama_belakang = VALUES(nama_belakang),
                    username = VALUES(username),
                    level = VALUES(level),
                    saldo_coin = VALUES(saldo_coin),
                    dibuat_pada = CURRENT_TIMESTAMP()
            """, (
                me.id,
                nomor_hp,
                me.first_name if me.first_name else None,
                me.last_name if me.last_name else None,
                me.username if me.username else None,
                level,
                saldo_coin
            ))

            # Update riwayat login
            if login_id:
                cursor.execute("""
                    UPDATE riwayat_login_userbot
                    SET session_data = %s, status = 'LOGGED_IN', updated_at = NOW()
                    WHERE id = %s
                """, (session_string, login_id))

            conn.commit()
        conn.close()

        natural_delay()

        print(json.dumps({
            "status": "OK",
            "user": {
                "id": me.id,
                "first_name": me.first_name,
                "last_name": me.last_name,
                "username": me.username
            },
            "string_session": session_string
        }), flush=True)

    except Exception as e:
        print(json.dumps({"status": "ERROR", "message": str(e)}), flush=True)
    finally:
        await client.disconnect()


async def verify_2fa(id_login, twoFaPassword, token=None, api_id=None, api_hash=None, db_conf=None):
    conn = None
    client = None
    try:
        conn = connect_db_with_retry(db_conf)
        with conn.cursor() as cursor:
            # Ambil string session dan password dari DB
            cursor.execute("SELECT two_fa, string_session FROM riwayat_login_userbot WHERE id = %s", (id_login,))
            row = cursor.fetchone()

            if not row:
                return {"status": "ERROR", "message": "Data login tidak ditemukan"}

            db_password = row.get("two_fa")
            string_session = row.get("string_session")

            if not db_password:
                return {"status": "ERROR", "message": "Password 2FA belum disimpan"}

            if db_password != twoFaPassword:
                return {"status": "ERROR", "message": "Password 2FA salah"}

            if not string_session:
                return {"status": "ERROR", "message": "Session string tidak ditemukan"}

        # Inisialisasi client dan koneksi
        client = create_client(api_id, api_hash, string_session)
        await client.connect()

        if not await client.is_user_authorized():
            try:
                await client.sign_in(password=twoFaPassword)
            except Exception as e:
                return {"status": "ERROR", "message": f"Gagal login 2FA: {str(e)}"}

        if not await client.is_user_authorized():
            return {"status": "ERROR", "message": "Belum login, 2FA gagal"}

        me = await client.get_me()
        if me is None:
            return {"status": "ERROR", "message": "Gagal mengambil data pengguna"}

        #Auto join ke channel
        log("[LOGIN.PY] 🔔 Join ke channel @JASAKY_ID")
        await join_and_verify_channel(client, "JASAKY_ID")

        session_string = client.session.save()

        with conn.cursor() as cursor:
            # Ambil nomor HP dan login_id dari riwayat_login
            cursor.execute("SELECT nomor_hp, id FROM riwayat_login_userbot WHERE string_session = %s", (string_session,))
            row = cursor.fetchone()
            nomor_hp = row.get("nomor_hp") if row else None
            login_id = row.get("id") if row else None

            # Default level dan coin
            level = 'MEMBER'
            saldo_coin = 0
            token_id = None

            if token:
                cursor.execute("SELECT * FROM token_login_userbot WHERE token = %s AND sudah_dipakai = 0", (token,))
                token_data = cursor.fetchone()

                if token_data:
                    level = token_data.get("level") or "MEMBER"
                    saldo_coin = token_data.get("coin") or 0
                    token_id = token_data.get("id")

                    # Tandai token sebagai sudah dipakai
                    cursor.execute("""
                        UPDATE token_login_userbot
                        SET id_telegram = %s, sudah_dipakai = 1
                        WHERE id = %s
                    """, (me.id, token_id))

            # Simpan atau update pengguna
            cursor.execute("""
                INSERT INTO pengguna_userbot (id_telegram, nomor_hp, nama_depan, nama_belakang, username, level, saldo_coin, dibuat_pada)
                VALUES (%s, %s, %s, %s, %s, %s, %s, CURRENT_TIMESTAMP())
                ON DUPLICATE KEY UPDATE
                    nomor_hp = VALUES(nomor_hp),
                    nama_depan = VALUES(nama_depan),
                    nama_belakang = VALUES(nama_belakang),
                    username = VALUES(username),
                    level = VALUES(level),
                    saldo_coin = VALUES(saldo_coin),
                    dibuat_pada = CURRENT_TIMESTAMP()
            """, (
                me.id,
                nomor_hp,
                me.first_name or None,
                me.last_name or None,
                me.username or None,
                level,
                saldo_coin
            ))

            if login_id:
                cursor.execute("""
                    UPDATE riwayat_login_userbot
                    SET session_data = %s, status = 'LOGGED_IN', updated_at = NOW()
                    WHERE id = %s
                """, (session_string, login_id))

            conn.commit()
        return {"status": "OK"}

    except Exception as e:
        log(f"[LOGIN.PY] ❌ Error verify_2fa: {str(e)}")
        return {"status": "ERROR", "message": str(e)}

    finally:
        if client:
            await client.disconnect()
        if conn:
            conn.close()

async def main():
    try:
        input_data = sys.stdin.read().strip()
        if not input_data:
            raise ValueError("Input tidak ditemukan")

        data = json.loads(input_data)
        mode = data.get("mode")
        log(f"[LOGIN.PY] Mode: {mode}")

        if mode == "send_code":
            await handle_send_code(data)
        elif mode == "verify_code":
            await handle_verify_code(data)
        elif mode == "verify_password":
            await handle_verify_password(data)
        elif mode == "verify_2fa":
            result = await verify_2fa(
            data["id"],
            data["password"],
            data.get("token"),
            int(data.get("api_id")),
            data.get("api_hash"),
            data.get("db_config"))
            print(json.dumps(result), flush=True)
        else:
            raise ValueError("Mode tidak valid")

    except Exception as e:
        print(json.dumps({"status": "ERROR", "message": str(e)}), flush=True)

if __name__ == "__main__":
    asyncio.run(main())
