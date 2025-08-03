import asyncio
import os
import pytz
import requests
import re
import pymysql
import gc
import psutil
import hashlib
import argparse
from datetime import datetime, timedelta
from telethon import TelegramClient
from telethon.sessions import StringSession
from telethon.tl.types import  InputPeerChannel
from telethon.errors import FloodWaitError, SessionPasswordNeededError


db_conf = {
    "host": '127.0.0.1',
    "user": 'root',
    "password": 'rizki21123',
    "database": 'jasaky_official',
    "port": 3306,
    "cursorclass": pymysql.cursors.DictCursor
}

# Batasan jumlah user yang diproses bersamaan
MAX_CONCURRENT_USERS = 20
sema = asyncio.Semaphore(MAX_CONCURRENT_USERS)

# Logger
def log(message, bot=None, user=None):
    now = datetime.now(pytz.timezone("Asia/Jakarta")).strftime("%Y-%m-%d %H:%M:%S")
    prefix = ""
    if bot and user:
        prefix = f"[{bot}|{user}]"
    elif bot:
        prefix = f"[{bot}]"
    elif user:
        prefix = f"[{user}]"
    print(f"{prefix}[{now}] {message}")

def log_ram_pengguna():
    process = psutil.Process(os.getpid())
    ram_mb = process.memory_info().rss / 1024 / 1024
    log(f"📎 RAM Digunakan Saat Ini: {ram_mb:.2f} MB")

def get_conn(db_name):
    return pymysql.connect(
        host='127.0.0.1',
        user='root',
        password='rizki21123',
        database=db_name,
        port=3306,
        cursorclass=pymysql.cursors.DictCursor
    )

def ambil_semua_bot():
    conn = get_conn('jasaky_official')
    try:
        with conn.cursor() as cursor:
            cursor.execute("SELECT username_bot, telegram_token, api_id, api_hash, db_name FROM data_userbot")
            return cursor.fetchall()
    finally:
        conn.close()

def generate_bot_config(bot):
    return {
        'api_id': bot['api_id'],
        'api_hash': bot['api_hash'],
        'bot_token': bot['telegram_token'],
        'db_name': bot['db_name'],
        'username_bot': bot['username_bot']
    }

async def scheduler_bot(bot_conf):
    task_map = {}
    while True:
        try:
            conn = get_conn(bot_conf['db_name'])
            try:
                with conn.cursor() as cursor:
                    cursor.execute("SELECT DISTINCT id_telegram FROM status_sebar_userbot WHERE status = 'aktif'")
                    semua_user = cursor.fetchall()
            finally:
                conn.close()

            for user_row in semua_user:
                id_telegram = user_row['id_telegram']
                if id_telegram not in task_map:
                    user = {
                        'id_telegram': id_telegram,
                        'api_id': bot_conf['api_id'],
                        'api_hash': bot_conf['api_hash'],
                        'bot_token': bot_conf['bot_token'],
                        'db_name': bot_conf['db_name']
                    }
                    task_map[id_telegram] = asyncio.create_task(scheduler_user(user))

        except Exception as e:
            log(f"🔥 [BOT {bot_conf['username_bot']}] Gagal load user: {e}")

        await asyncio.sleep(60)

# 🔄 PENJADWALAN UTAMA: MULTI-BOT
async def scheduler_semua_bot():
    bot_map = {}
    while True:
        semua_bot = ambil_semua_bot()
        for bot in semua_bot:
            uname = bot['username_bot']
            if uname not in bot_map:
                conf = generate_bot_config(bot)
                log(f"🚀 Menjadwalkan bot: @{uname}", bot=uname)
                await cek_masa_aktif_pengguna(conf['db_name'])
                await penjadwalan_pengguna(conf)
                bot_map[uname] = asyncio.create_task(scheduler_bot(conf))
            else:
                task = bot_map[uname]
                if task.done() or task.cancelled():
                    log(f"♻️ Restart task bot @{uname} karena sebelumnya berhenti.", bot=uname)
                    conf = generate_bot_config(bot)
                    bot_map[uname] = asyncio.create_task(scheduler_bot(conf))
        await asyncio.sleep(600)

# Wrapper untuk batasi concurrent user
async def proses_pengguna_terbatas(user):
    async with sema:
        start = datetime.now()
        user['_start_time'] = start  # simpan real start time
        log(f"🔓 {user['id_telegram']}-{user['id_sebar']} MASUK giliran Semaphore @ {start.strftime('%H:%M:%S')}")
        await proses_pengguna(user)

# Kirim notifikasi ke pengguna
async def kirim_notifikasi(id_telegram, daftar_grup_status, waktu, waktu_mulai_sebar_berikutnya, durasi, bot_token):
    try:
        total = len(daftar_grup_status)
        berhasil = sum(1 for g in daftar_grup_status if g.get("sukses"))
        gagal = total - berhasil

        pesan = (
            f"🔔 *Ringkasan Pengiriman Pesan* 🔔\n\n"
            f"🕒 Durasi: `{durasi}`\n"
            f"🕒 Waktu: `{waktu} WIB`\n"
            f"📦 Total: *{total}* pesan\n"
            f"✅ Berhasil: *{berhasil}*\n"
            f"❌ Gagal: *{gagal}*\n\n"
            f"⏳ Waktu sebar berikutnya: `{waktu_mulai_sebar_berikutnya} WIB`\n\n"
        )

        for i, grup in enumerate(daftar_grup_status, 1):
            nama = grup.get("nama_grup", "-")
            sukses = grup.get("sukses", False)
            error_msg = grup.get("error_msg", "")
            id_grup = str(grup.get("id_grup", ""))

            # Buat link jika id grup valid
            if id_grup.startswith("-100"):
                tme_link = f"https://t.me/c/{id_grup.replace('-100', '')}"
            else:
                tme_link = ""

            if sukses:
                grup_info = f"[{nama}]({tme_link})" if tme_link else nama
                pesan += f"{i}. {grup_info} — *Berhasil* ✅\n"
            else:
                pesan += f"{i}. {nama} — *Gagal* ❌\n`{error_msg}`\n"

        # Kirim notifikasi ke pengguna
        res = requests.post(
            f"https://api.telegram.org/bot{bot_token}/sendMessage",
            data={
                "chat_id": id_telegram,
                "text": pesan,
                "parse_mode": "Markdown",
                "disable_web_page_preview": True
            }
        )

        if res.status_code == 200:
            log(f"🔔 Notifikasi berhasil dikirim ke {id_telegram}")
        else:
            log(f"⚠️ Gagal kirim notifikasi: {res.text}")

    except Exception as e:
        log(f"⚠️ Exception saat kirim notifikasi ke {id_telegram}: {e}")

# proses pengguna
async def proses_pengguna(user):
    id_telegram = user['id_telegram']
    id_sebar = user['id_sebar']
    jeda_kirim_menit = float(user.get('jeda_kirim', 5))
    timer_aktif = user.get('timer_aktif') or ''
    now = datetime.now(pytz.timezone("Asia/Jakarta"))
    current_time = now.strftime("%H:%M")
    waktu_mulai = datetime.now(pytz.timezone("Asia/Jakarta"))

    client = None
    notif_aktif = True  # Default aktif
    daftar_status_grup = []  # Inisialisasi kosong
    total_pesan, terkirim, gagal = 0, 0, 0  # Untuk mencegah UnboundLocalError di finally

    log(f"\n🟢 Mulai proses untuk pengguna: {id_telegram}")
    log(f"🕒 Waktu saat ini: {current_time} | Timer aktif: {timer_aktif or 'Kosong'}")

    entity_cache = {}  # Cache entity untuk efisiensi

    try:
        conn = get_conn(user['db_name'])
        with conn.cursor(pymysql.cursors.DictCursor) as cursor:

            # Validasi waktu aktif (jika ada)
            if timer_aktif:
                waktu_valid = any(
                    start <= current_time <= end
                    for waktu in timer_aktif.split('/')
                    if '-' in waktu
                    for start, end in [waktu.split('-')]
                )
                if not waktu_valid:
                    log(f"⏰ Saat ini di luar jam aktif ({current_time}), pengguna dilewati.")
                    return
                else:
                    log(f"✅ Waktu aktif valid, lanjutkan pengiriman.")
            else:
                log(" Tidak ada batasan waktu aktif, lanjutkan.")

            # Ambil session & password 2FA dari database
            log("📥 Mengambil session terakhir pengguna dari database...")
            cursor.execute("""
                SELECT string_session, two_fa FROM riwayat_login_userbot
                WHERE id_telegram = %s
                ORDER BY updated_at DESC LIMIT 1
            """, (id_telegram,))
            session_row = cursor.fetchone()

            if not session_row:
                log(f"❌ Session tidak ditemukan untuk {id_telegram}, proses dihentikan.")
                return

            string_session = session_row['string_session']
            two_fa_password = session_row['two_fa']

            log(f"✅ Session berhasil didapatkan dari database: {string_session[:10]}... (disembunyikan sebagian)")

            client = TelegramClient(StringSession(string_session), user['api_id'], user['api_hash'])
            try:
                if two_fa_password:
                    await client.start(password=two_fa_password)
                else:
                    await client.start()

                if not await client.is_user_authorized():
                    log("⚠️ Session tidak authorize, kemungkinan session expired atau logout.", user=id_telegram)
                    await client.disconnect()
                    return

                log("✅ Client berhasil terkoneksi dan authorize.", user=id_telegram)


                # 🔄 Ambil level & watermark hanya sekali
                log("📥 Mengambil level dan watermark pengguna...")
                cursor.execute("SELECT level FROM pengguna_userbot WHERE id_telegram = %s", (id_telegram,))
                user_row = cursor.fetchone()
                level = user_row.get('level') if user_row else None
                id_watermark = 2 if level == 'JASEB' else 1

                cursor.execute("SELECT watermark FROM pengaturan_watermark_userbot WHERE id = %s", (id_watermark,))
                wm_row = cursor.fetchone()
                watermark = wm_row['watermark'] if wm_row and wm_row.get('watermark') else ''
                log(f"💧 Watermark default pengguna: {watermark or 'Tidak ada'}")

                # Cek apakah notifikasi aktif
                log("📥 Mengambil status notifikasi pengguna dari database...")
                cursor.execute("SELECT notifikasi FROM pengguna_userbot WHERE id_telegram = %s", (id_telegram,))
                notif_row = cursor.fetchone()
                notif_aktif = bool(notif_row['notifikasi']) if notif_row else True
                log(f"🔔 Status notifikasi dari DB: {notif_aktif}")

                # Ambil daftar pesan sebar
                log(f" Mengambil daftar pesan dari tabel `list_sebar` dengan id_sebar={id_sebar} dan id_telegram={id_telegram}...")
                BATCH_SIZE = 50
                offset = 0
                pesan_list = []
                daftar_status_grup = []

                while True:
                    log("────────────────────────────────────────────────────")
                    log(f"📋 Mengecek status sebar {id_telegram}-{id_sebar}...")
                    cursor.execute("""
                    SELECT status FROM status_sebar_userbot
                    WHERE id_telegram = %s AND id_sebar = %s
                    """, (id_telegram, id_sebar))
                    status_sebar_row = cursor.fetchone()

                    if not status_sebar_row or status_sebar_row['status'] != 'aktif':
                        log(f"🚫 Status sebar {id_telegram}-{id_sebar} sekarang NONAKTIF, proses dihentikan.")
                        log("────────────────────────────────────────────────────")
                        return

                    log(f"✅ Status sebar {id_telegram}-{id_sebar} AKTIF. Mulai ambil batch pesan...")

                    # 🔧 FIX: Ambil batch dari database
                    cursor.execute("""
                    SELECT * FROM list_sebar_userbot
                    WHERE id_telegram = %s AND id_sebar = %s
                    LIMIT %s OFFSET %s
                    """, (id_telegram, id_sebar, BATCH_SIZE, offset))
                    batch = cursor.fetchall()

                    if not batch:
                        break

                    pesan_list.extend(batch)
                    total_pesan = len(pesan_list)

                    for index, pesan in enumerate(batch, 1):
                        log(f"📨 Proses pesan ke-{index} dari {len(batch)} dalam batch offset {offset}")
                        # Tambahkan watermark jika watermark_text == 'ON'
                        if pesan.get('watermark_text') == 'ON' and watermark:
                            pesan['pesan'] = f"{pesan['pesan'].strip()}\n\n{watermark}"
                            log(f"💧 Watermark berhasil ditambahkan.")
                        else:
                            log(f"💧 Watermark tidak aktif untuk pesan ini.")

                        log(f"\n [Pesan {index}/{total_pesan}] ID Grup: {pesan['id_grup']}")
                        # ambil status watermark_text (ON/OFF) dari row
                        wm_status = pesan.get('watermark_text', 'OFF')
                        log(
                            " Detail pesan dari database:\n"
                            f"- Tipe: {pesan['tipe_pesan']}\n"
                            f"- Watermark: {wm_status}\n"
                            f"- Isi: {pesan['pesan'][:50]}...\n"
                            f"- File: {pesan['file_path']}"
                        )
                        cursor.execute("""
                            SELECT * FROM grup_sebar_userbot
                            WHERE id_telegram = %s AND id = %s
                        """, (id_telegram, pesan['id_grup']))
                        grup = cursor.fetchone()

                        if not grup:
                            log(f"❌ Grup dengan ID {pesan['id_grup']} tidak ditemukan di tabel `grup_sebar`. Dilewati.")
                            gagal += 1
                            continue

                        nama_grup = grup['nama_grup']
                        username = grup['username_grup']
                        id_grup = grup['id_grup']
                        access_hash = grup['access_hash']

                        log(f"✅ Data grup berhasil ditemukan dari DB:\n- Nama Grup: {grup['nama_grup']}\n- Username: @{grup['username_grup'] or 'N/A'}\n- ID: {grup['id_grup']}\n- Hash: {grup['access_hash']}")

                        try:
                            # Ambil entity
                            if username:
                                log(f"📡 Mendapatkan entity berdasarkan username: @{username}")
                                if username not in entity_cache:
                                    entity_cache[username] = await client.get_entity(username)
                                entity = entity_cache[username]
                            elif id_grup and access_hash:
                                log(f"📡 Mendapatkan entity berdasarkan ID: {id_grup}, Hash: {access_hash}")
                                key = f"{id_grup}:{access_hash}"
                                if key not in entity_cache:
                                    entity_cache[key] = InputPeerChannel(channel_id=int(id_grup), access_hash=int(access_hash))
                                entity = entity_cache[key]
                            else:
                                raise Exception("Entity tidak lengkap (username dan access_hash kosong)")

                            # Cek izin kirim pesan/media
                            allow_send_media = True
                            log(f"🔐 Memeriksa izin pengiriman ke grup: {nama_grup}")
                            try:
                                permissions = await client.get_permissions(entity, 'me')

                                if hasattr(permissions, 'send_messages') and not permissions.send_messages:
                                    raise Exception("🚫 Tidak punya izin kirim pesan")

                                if pesan['tipe_pesan'] in ['photo', 'document']:
                                    if hasattr(permissions, 'send_media') and not permissions.send_media:
                                        allow_send_media = False
                                        log("⚠️ Izin kirim media dibatasi oleh grup.")
                            except Exception as perm_error:
                                log(f"️ Gagal periksa izin: {perm_error}")
                                if pesan['tipe_pesan'] in ['photo', 'document']:
                                    allow_send_media = False
                                else:
                                    raise perm_error

                            # Pengiriman
                            berhasil_kirim = False
                            log(f"📨 Akan mengirim ke: {grup['nama_grup']} ({'@' + grup['username_grup'] if grup['username_grup'] else grup['id_grup']})")
                            log(f"📤 Konten yang dikirim:\n- Tipe: {pesan['tipe_pesan']}\n- Isi: {pesan['pesan'][:100]}...\n- Path File: {pesan['file_path']}")


                            if pesan['tipe_pesan'] == 'text':
                                await client.send_message(entity, pesan['pesan'], parse_mode='HTML')
                                berhasil_kirim = True

                            elif pesan['tipe_pesan'] in ['photo', 'document']:
                                    if allow_send_media:
                                        result = await client.send_file(entity, file=pesan['file_path'], caption=pesan['pesan'])
                                        if result:
                                            log(f"✅ File terkirim ke {nama_grup}")
                                            berhasil_kirim = True
                                        else:
                                            raise Exception("⚠️ Tidak ada respon dari `send_file`.")
                                    else:
                                        log(f"📎 Grup tidak mengizinkan media. Mengirim pesan teks sebagai alternatif.")
                                        await client.send_message(
                                            entity,
                                            pesan['pesan'] + "\n\n📎 *Media tidak dikirim karena dibatasi oleh grup*",
                                            parse_mode='HTML'
                                        )
                                        berhasil_kirim = True

                            elif pesan['tipe_pesan'] == 'forward':
                                try:
                                    link = pesan['pesan'].strip()
                                    link = link.split()[0]
                                    match = re.match(r'^https?://t\.me/([\w\d_]+)/(\d+)$', link)
                                    if not match:
                                        raise Exception("Link Telegram tidak valid. Format: https://t.me/username/123456")

                                    username_channel = match.group(1)
                                    message_id = int(match.group(2))

                                    log(f"🔗 Akan forward pesan dari https://t.me/{username_channel}/{message_id}")

                                    source_entity = await client.get_entity(username_channel)
                                    original_message = await client.get_messages(source_entity, ids=message_id)

                                    if not original_message:
                                        raise Exception(f"Pesan dengan ID {message_id} tidak ditemukan.")

                                    await client.forward_messages(entity, original_message)
                                    berhasil_kirim = True
                                    log(f" Pesan berhasil di-forward dari {username_channel} ke {nama_grup}")

                                except Exception as e:
                                    raise Exception(f"Gagal forward dari link: {e}")

                            # Update status
                            if berhasil_kirim:
                                terkirim += 1
                                daftar_status_grup.append({"nama_grup": nama_grup, "id_grup": id_grup, "sukses": True})
                                log(f"📥 Menyimpan log kirim berhasil ke database...")

                            else:
                                raise Exception("❌ Tidak ada pesan yang terkirim.")

                        except FloodWaitError as fw:
                            log(f"⏱ FloodWaitError: harus menunggu {fw.seconds} detik.")
                            await asyncio.sleep(fw.seconds)
                            gagal += 1
                            daftar_status_grup.append({"nama_grup": nama_grup, "id_grup": id_grup, "sukses": False, "error_msg": f"FloodWait {fw.seconds}s"})

                        except Exception as e:
                            log(f"❌ Gagal kirim ke {nama_grup}: {e}")
                            gagal += 1
                            daftar_status_grup.append({"nama_grup": nama_grup, "id_grup": id_grup, "sukses": False, "error_msg": str(e)})

                        await asyncio.sleep(0.1)

                    conn.commit()
                    log("✅ Commit database selesai.")

                    log_ram_pengguna()
                    log(f"📦 Batch {offset} → {offset + BATCH_SIZE} | Batch: {len(batch)} pesan | Total: {total_pesan} | ✅ {terkirim} | ❌ {gagal}")
                    offset += BATCH_SIZE
                    log("🔁 Selesai batch, menunggu jeda untuk sebar berikutnya...")
                    log("────────────────────────────────────────────────────")

            except Exception as e:
                log(f"🔥 Terjadi kesalahan saat login/kirim pesan untuk {id_telegram}: {e}")

    except Exception as e:
        log(f"🔥 Terjadi kesalahan fatal saat memproses pengguna {id_telegram}: {e}")

    finally:
        # Menghitung waktu mulai sebar berikutnya
        waktu_selesai = datetime.now(pytz.timezone("Asia/Jakarta"))
        durasi_detik = int((waktu_selesai - waktu_mulai).total_seconds())
        durasi_str = f"{durasi_detik} detik"
        waktu_mulai_sebar_berikutnya = waktu_selesai + timedelta(minutes=jeda_kirim_menit)
        waktu_mulai_sebar_berikutnya_str = waktu_mulai_sebar_berikutnya.strftime("%H:%M")
        user["_batch"] = total_pesan
        user["_berhasil"] = terkirim
        user["_gagal"] = gagal

        if notif_aktif and daftar_status_grup:
            log(f"🔔 Mengirim notifikasi hasil ke pengguna...")
            await kirim_notifikasi(id_telegram, daftar_status_grup, waktu_selesai.strftime('%H:%M:%S'), waktu_mulai_sebar_berikutnya_str, durasi_str, bot_token=user['bot_token'])

            log(f" Ringkasan Pengiriman:\n"
                f"🆔 ID Telegram: {id_telegram}\n"
                f"📬 ID Sebar: {id_sebar}\n"
                f"📌 Total pesan dari DB: {total_pesan}\n"
                f"✅ Pesan berhasil dikirim: {terkirim}\n"
                f"❌ Pesan gagal dikirim: {gagal}")

        if client:
            try:
                await client.disconnect()
                log(f"🔌 Client untuk {id_telegram} berhasil disconnect.")
            except Exception as e:
                log(f"⚠️ Gagal disconnect client untuk {id_telegram}: {e}")

        if conn:
            try:
                conn.close()
                log(f"🔌 Koneksi DB ditutup untuk {id_telegram}")
            except Exception as e:
                log(f"❌ Gagal menutup koneksi DB: {e}")

        gc.collect() # Bersihkan RAM

# scheduler
async def scheduler_list_sebar(user, list_sebar):
    id_telegram = user['id_telegram']
    id_sebar = list_sebar['id_sebar']
    jeda_kirim_menit = float(list_sebar.get('jeda_kirim', 5))
    task_key = f"{id_telegram}-{id_sebar}"

    log(f"🕑 Memulai scheduler LIST {task_key} dengan jeda {jeda_kirim_menit} menit")

    while True:
        start_time = datetime.now()

        try:
            user_context = user.copy()
            user_context['id_sebar'] = id_sebar
            user_context['jeda_kirim'] = jeda_kirim_menit
            await asyncio.create_task(proses_pengguna_terbatas(user_context))
        except Exception as e:
            log(f"🔥 Error saat proses list_sebar {task_key}: {e}")

        next_run = start_time + timedelta(minutes=jeda_kirim_menit)
        delay = max(0, (next_run - datetime.now()).total_seconds())
        log(f"🕑 {task_key} → Delay hingga {next_run.strftime('%H:%M:%S')} ({delay:.2f}s)")
        await asyncio.sleep(delay)

# Menjadwalkan user
async def scheduler_user(user):
    id_telegram = user['id_telegram']
    log(f"🧩 Menjalankan scheduler dinamis untuk pengguna {id_telegram}", user=id_telegram)

    task_map = {}

    while True:
        try:
            conn = get_conn(user['db_name'])
            try:
                with conn.cursor() as cursor:
                    cursor.execute("SELECT * FROM status_sebar_userbot WHERE status = 'aktif' AND id_telegram = %s", (id_telegram,))
                    list_sebar_user = cursor.fetchall()
            finally:
                conn.close()

            for list_sebar in list_sebar_user:
                task_key = f"{id_telegram}-{list_sebar['id_sebar']}"
                task = task_map.get(task_key)

                if not task or task.done() or task.cancelled():
                    log(f"📌 (Re)Menjadwalkan LIST {task_key}", user=id_telegram)
                    task_map[task_key] = asyncio.create_task(scheduler_list_sebar(user, list_sebar))
                else:
                    log(f"🔁 List {task_key} sudah berjalan.", user=id_telegram)

        except Exception as e:
            log(f"🔥 Gagal load list_sebar untuk user {id_telegram}: {e}", user=id_telegram)

        await asyncio.sleep(60)

# Cek masa aktif
async def cek_masa_aktif_pengguna(db_name):
    try:
        log("🕒 Mengecek masa aktif semua pengguna...")

        conn = get_conn(db_name)
        try:
            with conn.cursor(pymysql.cursors.DictCursor) as cursor:

                # Ambil semua id_telegram dari tabel pengguna
                cursor.execute("SELECT id_telegram FROM pengguna_userbot")
                semua_pengguna = cursor.fetchall()

                zona = pytz.timezone("Asia/Jakarta")
                sekarang = datetime.now(zona)

                total_nonaktif = 0
                total_aktif = 0
                total_lifetime = 0

                for pengguna in semua_pengguna:
                    id_telegram = pengguna['id_telegram']

                    # Ambil data kadaluarsa dan lifetime dari token_login_userbot
                    cursor.execute("""
                        SELECT lifetime, kadaluarsa_pada FROM token_login_userbot
                        WHERE id_telegram = %s
                        ORDER BY kadaluarsa_pada DESC LIMIT 1
                    """, (id_telegram,))
                    row = cursor.fetchone()

                    if row:
                        lifetime = row.get("lifetime", 0)
                        kadaluarsa = row.get("kadaluarsa_pada")

                        # 🔒 Jika lifetime = 1 → tidak dicek kadaluarsa
                        if lifetime == 1:
                            total_lifetime += 1
                            log(f"♾️ Pengguna {id_telegram} memiliki akun LIFETIME → dilewati.")
                            continue

                        if kadaluarsa:
                            if kadaluarsa.tzinfo is None:
                                kadaluarsa = zona.localize(kadaluarsa)

                            if sekarang > kadaluarsa:
                                # Sudah kadaluarsa → ubah status list user jadi nonaktif
                                cursor.execute("""
                                    UPDATE status_sebar_userbot SET status = 'nonaktif'
                                    WHERE id_telegram = %s AND status = 'aktif'
                                """, (id_telegram,))
                                jumlah_diubah = cursor.rowcount
                                total_nonaktif += jumlah_diubah

                                log(f"⛔ Pengguna {id_telegram} EXPIRED pada {kadaluarsa.strftime('%Y-%m-%d %H:%M:%S')} → {jumlah_diubah} list dinonaktifkan.")
                            else:
                                total_aktif += 1
                                log(f"✅ Pengguna {id_telegram} MASIH AKTIF sampai {kadaluarsa.strftime('%Y-%m-%d %H:%M:%S')}")
                        else:
                            log(f"⚠️ Pengguna {id_telegram} tidak memiliki tanggal kadaluarsa.")
                    else:
                        log(f"⚠️ Pengguna {id_telegram} tidak memiliki data login di token_login_userbot.")

                conn.commit()
                log(f"📊 Ringkasan: {total_aktif} aktif, {total_nonaktif} dinonaktifkan, {total_lifetime} lifetime")
        finally:
            conn.close()

    except Exception as e:
        log(f"🔥 Gagal memproses masa aktif pengguna: {e}")

# Penjadwal utama
async def penjadwalan_pengguna(bot_conf):
    task_map = {}
    while True:
        try:
            log("🔍 Mengecek pengguna aktif...")

            conn = get_conn(bot_conf['db_name'])
            try:
                with conn.cursor(pymysql.cursors.DictCursor) as cursor:
                    cursor.execute("SELECT DISTINCT id_telegram FROM status_sebar_userbot WHERE status = 'aktif'")
                    semua_user = cursor.fetchall()
            finally:
                conn.close()

            for u in semua_user:
                id_telegram = u['id_telegram']
                if id_telegram not in task_map:
                    log(f"📌 Menjadwalkan scheduler untuk user {id_telegram}")
                    user = {
                    'id_telegram': id_telegram,
                    'api_id': bot_conf['api_id'],
                    'api_hash': bot_conf['api_hash'],
                    'bot_token': bot_conf['bot_token'],
                    'db_name': bot_conf['db_name']
                    }
                    task_map[id_telegram] = asyncio.create_task(scheduler_user(user))
                else:
                    log(f"🔁 Scheduler user {id_telegram} sudah berjalan")

        except Exception as e:
            log(f"🔥 Gagal menjadwalkan pengguna: {e}")

        await asyncio.sleep(60)

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--mod", type=int, help="Nomor worker", default=None)
    parser.add_argument("--total", type=int, help="Total worker", default=None)
    args = parser.parse_args()

    if args.mod is not None and args.total:
        async def penjadwalan_worker_terbagi(modulo, total):
            semua_bot = ambil_semua_bot()
            log(f"👀 [Worker {modulo}] Total semua bot: {len(semua_bot)}")
            for index, bot in enumerate(semua_bot):
                if int(hashlib.md5(bot['username_bot'].encode()).hexdigest(), 16) % total == modulo:
                    log(f"📦 [Worker {modulo}] Akan memproses bot index {index}: @{bot['username_bot']}")

            task_map = {}
            bot_list = []

            for index, bot in enumerate(semua_bot):
                if int(hashlib.md5(bot['username_bot'].encode()).hexdigest(), 16) % total != modulo:
                    continue

                bot_conf = generate_bot_config(bot)
                log(f"✅ Bot config untuk @{bot['username_bot']} berhasil digenerate", bot=bot['username_bot'])
                bot_list.append(bot_conf)

            while True:
                for bot_conf in bot_list:
                    await cek_masa_aktif_pengguna(bot_conf['db_name'])

                    try:
                        log(f"🔍 [Worker {modulo}] Mengecek pengguna aktif pada bot @{bot_conf['username_bot']}...")

                        conn = get_conn(bot_conf['db_name'])
                        try:
                            with conn.cursor(pymysql.cursors.DictCursor) as cursor:
                                cursor.execute("SELECT DISTINCT id_telegram FROM status_sebar_userbot WHERE status = 'aktif'")
                                semua_user = cursor.fetchall()
                        finally:
                            conn.close()

                        for u in semua_user:
                            id_telegram = u['id_telegram']
                            if id_telegram not in task_map:
                                log(f"📌 [Worker {modulo}] Menjadwalkan scheduler untuk user {id_telegram} dari bot @{bot_conf['username_bot']}", bot=bot_conf['username_bot'], user=id_telegram)
                                task_map[id_telegram] = asyncio.create_task(scheduler_user({
                                    'id_telegram': id_telegram,
                                    'api_id': bot_conf['api_id'],
                                    'api_hash': bot_conf['api_hash'],
                                    'bot_token': bot_conf['bot_token'],
                                    'db_name': bot_conf['db_name']
                                }))
                            else:
                                log(f"🔁 [Worker {modulo}] User {id_telegram} sudah berjalan")

                    except Exception as e:
                        log(f"🔥 [Worker {modulo}] Gagal menjadwalkan pengguna: {e}")

                await asyncio.sleep(10)

        try:
            asyncio.run(penjadwalan_worker_terbagi(args.mod, args.total))
        except KeyboardInterrupt:
            log(f"🛑 Worker {args.mod} dihentikan.")
    else:
        try:
            asyncio.run(scheduler_semua_bot())
        except KeyboardInterrupt:
            log("🛑 Dihentikan oleh pengguna.")
