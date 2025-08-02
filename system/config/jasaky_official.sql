-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Waktu pembuatan: 14 Jul 2025 pada 05.44
-- Versi server: 10.11.13-MariaDB-ubu2204
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jasaky_official`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_autoresponder`
--

CREATE TABLE `admin_autoresponder` (
  `id` int(11) NOT NULL,
  `id_telegram` bigint(20) NOT NULL,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL,
  `status_aktif` tinyint(1) DEFAULT 1,
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin_autoresponder`
--

INSERT INTO `admin_autoresponder` (`id`, `id_telegram`, `username`, `password`, `nama_lengkap`, `status_aktif`, `dibuat_pada`) VALUES
(5, 5232338001, 'rlynchx', '$2b$10$XGXbBj969svFH6q0kXm38eDogxhLXu.LvFTEH7mpa0IJ62ltkzwv2', 'reezky', 1, '2025-07-05 07:16:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin_userbot`
--

CREATE TABLE `admin_userbot` (
  `id` int(11) NOT NULL,
  `id_telegram` bigint(20) NOT NULL,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL,
  `durasi` enum('30','Lifetime') NOT NULL DEFAULT '30',
  `maks_akun` int(11) NOT NULL,
  `status_aktif` tinyint(1) DEFAULT 1,
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp(),
  `kadaluarsa_pada` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin_userbot`
--

INSERT INTO `admin_userbot` (`id`, `id_telegram`, `username`, `password`, `nama_lengkap`, `durasi`, `maks_akun`, `status_aktif`, `dibuat_pada`, `kadaluarsa_pada`) VALUES
(1, 5232338001, 'rlynchx', '$2b$10$XGXbBj969svFH6q0kXm38eDogxhLXu.LvFTEH7mpa0IJ62ltkzwv2', 'reezky', 'Lifetime', 20, 1, '2025-04-12 13:48:56', '2025-07-10 05:04:41'),
(3, 7650408684, 'Najwanthabrani', '$2b$10$6dWtOoO0qebWSuk8eD/zUeQvdhZaEjhUy5nzqPgnuo7vesk4Rfq4i', 'Nazwan Dzimar', 'Lifetime', 20, 1, '2025-06-21 05:26:04', '2025-07-10 05:04:41'),
(4, 6331299232, 'Dddhjjjjo', '$2b$10$IyvMFEj4X9.kMrEbfz3XhuTFOtLnidQ.cgFX39okuhtCBAyHhbyT6', 'Asep', 'Lifetime', 20, 1, '2025-06-27 01:02:28', '2025-07-10 05:04:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `coin_tamu_userbot`
--

CREATE TABLE `coin_tamu_userbot` (
  `id` int(11) NOT NULL,
  `id_telegram` bigint(20) NOT NULL,
  `jumlah_coin` int(11) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `grup_sebar_userbot`
--

CREATE TABLE `grup_sebar_userbot` (
  `id` int(11) NOT NULL,
  `id_telegram` bigint(20) NOT NULL,
  `nama_grup` varchar(255) DEFAULT NULL,
  `username_grup` varchar(255) DEFAULT NULL,
  `id_grup` bigint(50) DEFAULT NULL,
  `access_hash` varchar(255) DEFAULT NULL,
  `link_grup` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kontrol_akun_userbot`
--

CREATE TABLE `kontrol_akun_userbot` (
  `id` int(11) NOT NULL,
  `id_telegram` bigint(20) NOT NULL,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL,
  `status_aktif` tinyint(1) DEFAULT 1,
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kontrol_akun_userbot`
--

INSERT INTO `kontrol_akun_userbot` (`id`, `id_telegram`, `username`, `password`, `nama_lengkap`, `status_aktif`, `dibuat_pada`) VALUES
(1, 5232338001, 'rlynchx', '$2b$10$FSpTSeIOa7bf9RUfxTbrPevYQRlcKFF.d72kk36K5Y1n3ZHRBCovu', 'reezky', 1, '2025-06-05 15:02:59'),
(19, 6331299232, 'Dddhjjjjo', '$2b$10$KZjAOvTJK0R5uR6b13/vE.A9gyFUcLkC4SH4mvrsE4Xs.8c/3G9P6', 'Asep', 1, '2025-06-28 06:01:28'),
(29, 7650408684, 'Najwanthabrani', '$2b$10$pAvd2ReWosNiPPxXaloooePXqWCMtZBgqQJpuhf.Aqf604z8vX7PW', 'Najwan dzimar', 1, '2025-07-08 08:15:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kontrol_sessions_userbot`
--

CREATE TABLE `kontrol_sessions_userbot` (
  `id` bigint(20) NOT NULL,
  `id_telegram_pengontrol` bigint(20) NOT NULL,
  `id_telegram_dikontrol` bigint(20) NOT NULL,
  `session_token` varchar(64) NOT NULL,
  `aktif` tinyint(1) DEFAULT 1,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_kontrol_userbot`
--

CREATE TABLE `list_kontrol_userbot` (
  `id` int(11) NOT NULL,
  `id_telegram` bigint(20) NOT NULL,
  `id_telegram_pemilik` bigint(20) NOT NULL,
  `username_akun` varchar(100) DEFAULT NULL,
  `nama_akun` varchar(150) DEFAULT NULL,
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_terakhir` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `list_kontrol_userbot`
--

INSERT INTO `list_kontrol_userbot` (`id`, `id_telegram`, `id_telegram_pemilik`, `username_akun`, `nama_akun`, `dibuat_pada`, `update_terakhir`) VALUES
(1, 1276582149, 5232338001, 'rvlynyyyy', 'rvlyn', '2025-06-05 15:02:59', '2025-07-10 14:53:26'),
(37, 6999164406, 6331299232, 'Rjshhshshw', '702', '2025-06-28 06:01:28', '2025-07-10 14:53:26'),
(86, 8192868417, 7650408684, 'Najwanthabraninew', '1 bot @najwanthabrani', '2025-07-08 08:15:36', '2025-07-10 14:53:26'),
(87, 6959371884, 7650408684, 'Jasebnajwan11', '11 jaseb @najwanthabrani', '2025-07-08 08:15:36', '2025-07-10 14:53:26'),
(88, 6133411111, 7650408684, 'Jasebnajwan12', '12 jaseb @najwanthabrani', '2025-07-08 08:15:36', '2025-07-10 14:53:26'),
(89, 6962189446, 7650408684, 'Jasebnajwan13', '13 jaseb @najwanthabrani', '2025-07-08 08:15:36', '2025-07-10 14:53:26'),
(90, 6029616535, 7650408684, '(tanpa username)', 'id 60', '2025-07-08 08:15:36', '2025-07-10 14:53:26'),
(91, 6864994300, 7650408684, 'Jasebnajwan15', '15 jaseb @najwanthabrani', '2025-07-08 08:15:36', '2025-07-10 14:53:26'),
(92, 6424289693, 7650408684, 'Jasebnajwan16', '16 Jaseb @najwanthabrani', '2025-07-08 08:15:36', '2025-07-10 14:53:26');

-- --------------------------------------------------------

--
-- Struktur dari tabel `list_sebar_userbot`
--

CREATE TABLE `list_sebar_userbot` (
  `id` int(11) NOT NULL,
  `id_telegram` bigint(20) NOT NULL,
  `id_grup` bigint(255) NOT NULL,
  `id_sebar` int(255) NOT NULL,
  `tipe_pesan` enum('text','photo','document','forward') DEFAULT 'text',
  `pesan` text DEFAULT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `watermark_text` varchar(255) DEFAULT 'ON',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `notifikasi_userbot`
--

CREATE TABLE `notifikasi_userbot` (
  `id` int(11) NOT NULL,
  `id_telegram` bigint(20) NOT NULL,
  `id_sebar` int(11) NOT NULL,
  `nama_grup` varchar(255) DEFAULT NULL,
  `id_grup` bigint(20) DEFAULT NULL,
  `pesan` text DEFAULT NULL,
  `tipe_pesan` enum('text','photo','document','forward') DEFAULT 'text',
  `file_path` varchar(255) DEFAULT NULL,
  `status_kirim` enum('berhasil','gagal') NOT NULL,
  `pesan_error` text DEFAULT NULL,
  `waktu_kirim` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `notifikasi_userbot`
--

INSERT INTO `notifikasi_userbot` (`id`, `id_telegram`, `id_sebar`, `nama_grup`, `id_grup`, `pesan`, `tipe_pesan`, `file_path`, `status_kirim`, `pesan_error`, `waktu_kirim`) VALUES
(1, 1276582149, 4788, 'LPM NIVEY', 2271952769, 'https://t.me/JASAKY_ID/18', 'forward', NULL, 'berhasil', NULL, '2025-06-05 22:33:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `owner_userbot`
--

CREATE TABLE `owner_userbot` (
  `id` int(11) NOT NULL,
  `id_telegram` bigint(20) NOT NULL,
  `username` varchar(64) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL,
  `status_aktif` tinyint(1) DEFAULT 1,
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `owner_userbot`
--

INSERT INTO `owner_userbot` (`id`, `id_telegram`, `username`, `password`, `nama_lengkap`, `status_aktif`, `dibuat_pada`) VALUES
(1, 5232338001, 'rlynchx', '$2b$10$XGXbBj969svFH6q0kXm38eDogxhLXu.LvFTEH7mpa0IJ62ltkzwv2', 'reezky', 1, '2025-07-09 12:18:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pending_kontrol_userbot`
--

CREATE TABLE `pending_kontrol_userbot` (
  `id` int(11) NOT NULL,
  `reference` varchar(100) NOT NULL,
  `id_telegram` bigint(20) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `nama_lengkap` varchar(100) DEFAULT NULL,
  `target_json` mediumtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaturan_watermark_autoresponder`
--

CREATE TABLE `pengaturan_watermark_autoresponder` (
  `id` int(11) NOT NULL,
  `watermark` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengaturan_watermark_autoresponder`
--

INSERT INTO `pengaturan_watermark_autoresponder` (`id`, `watermark`, `created_at`, `updated_at`) VALUES
(1, '🔄 Balasan Otomatis by @JASAKY_AUTORESPONBOT', '2025-07-05 08:31:55', '2025-07-05 09:10:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaturan_watermark_userbot`
--

CREATE TABLE `pengaturan_watermark_userbot` (
  `id` int(11) NOT NULL,
  `watermark` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengaturan_watermark_userbot`
--

INSERT INTO `pengaturan_watermark_userbot` (`id`, `watermark`, `created_at`, `updated_at`) VALUES
(1, '🔄 Promote Otomatis @JASAKY_UBOT', '2025-05-14 07:08:34', '2025-06-05 14:45:56'),
(2, '— JASEB by @JASAKY_UBOT —', '2025-05-14 07:08:34', '2025-06-05 14:46:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna_autoresponder`
--

CREATE TABLE `pengguna_autoresponder` (
  `id` int(11) NOT NULL,
  `id_telegram` bigint(20) NOT NULL,
  `nomor_hp` varchar(20) DEFAULT NULL,
  `nama_depan` varchar(100) DEFAULT NULL,
  `nama_belakang` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `adalah_bot` tinyint(1) DEFAULT 0,
  `url_foto` text DEFAULT NULL,
  `level` enum('Administrator','AUTORESPONDER JASAKY','VIP AUTORESPONDER JASAKY') DEFAULT 'AUTORESPONDER JASAKY',
  `email` varchar(100) DEFAULT NULL,
  `token_backup` text DEFAULT NULL,
  `notifikasi` tinyint(1) DEFAULT 0,
  `status_userbot` tinyint(1) DEFAULT 1,
  `saldo_coin` int(11) DEFAULT 0,
  `watermark` int(11) DEFAULT 1,
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengguna_autoresponder`
--

INSERT INTO `pengguna_autoresponder` (`id`, `id_telegram`, `nomor_hp`, `nama_depan`, `nama_belakang`, `username`, `adalah_bot`, `url_foto`, `level`, `email`, `token_backup`, `notifikasi`, `status_userbot`, `saldo_coin`, `watermark`, `dibuat_pada`) VALUES
(43, 5232338001, '+6282136561075', 'reezky.0x00', NULL, 'rlynchx', 0, NULL, 'AUTORESPONDER JASAKY', NULL, NULL, 0, 1, 0, 1, '2025-07-05 09:32:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna_userbot`
--

CREATE TABLE `pengguna_userbot` (
  `id` int(11) NOT NULL,
  `id_telegram` bigint(20) NOT NULL,
  `nomor_hp` varchar(20) DEFAULT NULL,
  `nama_depan` varchar(100) DEFAULT NULL,
  `nama_belakang` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `adalah_bot` tinyint(1) DEFAULT 0,
  `url_foto` text DEFAULT NULL,
  `level` enum('Administrator','MEMBER','JASEB','VIP') DEFAULT 'MEMBER',
  `email` varchar(100) DEFAULT NULL,
  `token_backup` text DEFAULT NULL,
  `notifikasi` tinyint(1) DEFAULT 0,
  `status_userbot` tinyint(1) DEFAULT 1,
  `saldo_coin` int(11) DEFAULT 0,
  `watermark` int(11) DEFAULT 1,
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengguna_userbot`
--

INSERT INTO `pengguna_userbot` (`id`, `id_telegram`, `nomor_hp`, `nama_depan`, `nama_belakang`, `username`, `adalah_bot`, `url_foto`, `level`, `email`, `token_backup`, `notifikasi`, `status_userbot`, `saldo_coin`, `watermark`, `dibuat_pada`) VALUES
(1, 1276582149, '+6289655084027', 'rvlyn', NULL, 'rvlynyyyy', 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-06-05 14:47:50'),
(2, 6547014546, '+6285706601995', 'leiraa', NULL, 'sofietblue', 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-06-13 12:18:21'),
(3, 7805357777, '+6285198616457', 'nanaa', NULL, 'lluvlynaa', 0, NULL, 'MEMBER', NULL, NULL, 0, 1, 0, 1, '2025-06-14 01:32:40'),
(5, 6520896223, '+6285603224351', 'ayriee', NULL, 'ayririee', 0, NULL, 'VIP', NULL, NULL, 1, 1, 0, 1, '2025-06-14 10:19:42'),
(8, 8192868417, '+6282295956504', '1 bot', '@najwanthabrani', 'Najwanthabraninew', 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-06-21 05:42:43'),
(10, 6652995912, '+6289526592018', '2 bot', '@najwanthabrani', 'Botnajwan1', 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-06-21 15:04:51'),
(11, 6881366874, '+62895622284560', '4 bot', '@najwanthabrani', 'Botnajwan3', 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-06-22 01:47:51'),
(12, 6988431552, '+6285211019986', '3 bot', '@najwanthabrani', 'Botnajwan2', 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-06-22 01:49:58'),
(13, 6390088412, '+6285847404183', 'OFFLINE.', NULL, 'stunningC', 0, NULL, 'MEMBER', NULL, NULL, 0, 1, 0, 1, '2025-06-22 15:30:25'),
(14, 8032949049, '+6283116096896', '6 bot', '@najwanthabrani', 'Quark15', 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-06-23 05:48:55'),
(15, 7922721952, '+6282181484960', '5 bot', '@najwanthabrani', 'kuchiyosse', 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-06-23 05:51:11'),
(16, 7885854625, '+6281216760211', '2 bot', '@najwanthabrani', 'zohrahx', 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-06-24 02:35:04'),
(17, 7878068373, '+6281216734916', '3 bot', '@najwanthabrani', 'Quark910', 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-06-24 02:37:18'),
(19, 6608403305, '+6281248062633', '😎 BANDEL - ELITE', NULL, 'Bandel_Elite', 0, NULL, 'MEMBER', NULL, NULL, 0, 1, 0, 1, '2025-06-26 17:47:32'),
(20, 6999164406, '+6283190662432', '702', NULL, 'Rjshhshshw', 0, NULL, 'VIP', NULL, NULL, 1, 1, 0, 1, '2025-06-27 08:33:59'),
(22, 6810495656, '+6285861070884', '604', NULL, 'gehejekehhs', 0, NULL, 'VIP', NULL, NULL, 1, 1, 0, 1, '2025-06-28 03:00:31'),
(23, 6215162920, '+62895326416403', '605', NULL, 'Tadvnc', 0, NULL, 'VIP', NULL, NULL, 1, 1, 0, 1, '2025-06-28 06:11:54'),
(24, 6959810084, '+6282199933325', '802', NULL, 'apajaom', 0, NULL, 'VIP', NULL, NULL, 1, 1, 0, 1, '2025-06-28 08:56:49'),
(25, 6959527987, '+6283846280891', 'Ayakaa | Sebar Account', NULL, 'Ayakaaatq', 0, NULL, 'MEMBER', NULL, NULL, 0, 1, 0, 1, '2025-06-28 12:33:59'),
(26, 6877496761, '+6285330770146', '803', NULL, 'apanallap', 0, NULL, 'VIP', NULL, NULL, 1, 1, 0, 1, '2025-06-28 13:48:51'),
(27, 6705361013, '+6285800691649', '802', NULL, 'Tdzdv', 0, NULL, 'VIP', NULL, NULL, 1, 1, 0, 1, '2025-06-29 14:37:27'),
(28, 6579026716, '+6285659068851', '803', NULL, 'apanajao', 0, NULL, 'VIP', NULL, NULL, 1, 1, 0, 1, '2025-06-29 14:56:15'),
(30, 7688276810, '+6285641561984', 'Marthinus', 'Tulehu', 'Vgszx', 0, NULL, 'VIP', NULL, NULL, 1, 1, 0, 1, '2025-06-30 13:49:13'),
(31, 6856151865, '+6283877537634', '2 bot', '@najwanthabrani', NULL, 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-07-01 04:37:05'),
(32, 6725059513, '+6283195930151', '3 bot @najwanthabrani', NULL, 'Jasebnajwan4', 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-07-01 14:37:30'),
(33, 6593529004, '+6285755597849', '4 bot @najwanthabrani', NULL, 'Sinta3321', 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-07-01 14:40:55'),
(34, 6718097405, '+62882022658392', '5 bot @najwanthabrani', NULL, 'Jasebnajwan5', 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-07-01 14:42:45'),
(35, 6738790516, '+6282126392797', '6 bot @najwanthabrani', NULL, 'Jasebnajwan6', 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-07-01 14:44:24'),
(36, 6319563004, '+6288706911293', '7 bot @najwanthabrani', NULL, 'Jasebnajwan7', 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-07-01 14:47:02'),
(37, 6774207833, '+6288707021518', '8 bot @najwanthabrani', NULL, 'Jasebnajwan8', 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-07-01 14:48:27'),
(38, 6393742408, '+6288707021139', '9 bot @najwanthabrani', NULL, 'Jasebnajwan9', 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-07-01 14:50:12'),
(39, 6370259418, '+6288286969640', '10 bot @najwanthabrani', NULL, 'Jasebnajwan10', 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-07-01 15:02:49'),
(40, 6959371884, '+6281362142068', '11 jaseb @najwanthabrani', NULL, 'Jasebnajwan11', 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-07-04 10:32:50'),
(41, 6442416571, '+6283157297427', '1002', NULL, 'Qdschf', 0, NULL, 'VIP', NULL, NULL, 1, 1, 0, 1, '2025-07-05 03:12:13'),
(42, 6956727460, '+6281934074709', '1101', NULL, 'aodhbwlqidhwbkaksbsj', 0, NULL, 'VIP', NULL, NULL, 1, 1, 0, 1, '2025-07-05 05:42:13'),
(43, 8025389090, '+628892902280', 'X', '𝐖𝐞𝐥𝐳𝐝𝐨𝐧𝐞', 'KACUNG77', 0, NULL, 'MEMBER', NULL, NULL, 0, 0, 0, 1, '2025-07-05 12:05:10'),
(44, 5516649446, '+6282279478527', 'Pengusaha Sukses', NULL, 'Meledakkuyy', 0, NULL, 'MEMBER', NULL, NULL, 0, 1, 0, 1, '2025-07-05 14:25:07'),
(45, 5573206266, '+6285642163390', 'Yoona', NULL, 'Spekk_Idamanmu', 0, NULL, 'MEMBER', NULL, NULL, 1, 1, 0, 1, '2025-07-05 17:54:11'),
(46, 6133411111, '+6283875277345', '12 jaseb @najwanthabrani', NULL, 'Jasebnajwan12', 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-07-06 02:46:52'),
(47, 6962189446, '+6282296670458', '13 jaseb @najwanthabrani', NULL, 'Jasebnajwan13', 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-07-06 02:51:46'),
(49, 6029616535, '+6285602468736', 'id 60', NULL, NULL, 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-07-07 09:29:09'),
(50, 1465113347, '+6287877077382', '1003', NULL, 'Asxvfx', 0, NULL, 'VIP', NULL, NULL, 1, 1, 0, 1, '2025-07-07 15:13:23'),
(51, 6864994300, '+6281573292499', '15 jaseb @najwanthabrani', NULL, 'Jasebnajwan15', 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-07-08 08:07:14'),
(52, 6424289693, '+6285882100833', '16 Jaseb @najwanthabrani', NULL, 'Jasebnajwan16', 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-07-08 08:10:34'),
(53, 1634488893, '+6283897485954', '1103', NULL, 'Dsshct', 0, NULL, 'VIP', NULL, NULL, 0, 1, 0, 1, '2025-07-08 14:03:56'),
(54, 6850067621, '+6283867433082', '1102', NULL, 'Tonjuks', 0, NULL, 'VIP', NULL, NULL, 1, 1, 0, 1, '2025-07-09 02:37:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengunjung`
--

CREATE TABLE `pengunjung` (
  `id` int(11) NOT NULL,
  `id_telegram` bigint(20) NOT NULL,
  `nama_depan` varchar(100) DEFAULT NULL,
  `nama_belakang` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `pertama_kali` datetime DEFAULT current_timestamp(),
  `terakhir_dikunjungi` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengunjung`
--

INSERT INTO `pengunjung` (`id`, `id_telegram`, `nama_depan`, `nama_belakang`, `username`, `pertama_kali`, `terakhir_dikunjungi`) VALUES
(1, 5232338001, 'reezky.0x00', NULL, 'rlynchx', '2025-07-05 21:00:49', '2025-07-08 16:23:57'),
(2, 6667990534, 'ʄǟʀɛʟʟʟ', NULL, 'farell27', '2025-07-05 21:00:50', '2025-07-05 21:48:16'),
(3, 7710482938, 'Deep', NULL, 'Sakithativ', '2025-07-05 21:11:47', '2025-07-05 21:16:14'),
(4, 5516649446, 'Pengusaha Sukses', NULL, 'Meledakkuyy', '2025-07-05 21:22:03', '2025-07-05 21:28:02'),
(5, 7782608325, 'IGGHUSN', 'NormaAMC', NULL, '2025-07-05 23:31:50', '2025-07-05 23:31:50'),
(6, 7352747225, 'aulll⚜️', NULL, 'HAHAHAHAHAHAHAHAHAHHAHA', '2025-07-05 23:42:59', '2025-07-06 00:57:55'),
(7, 881327295, 'ϟ Renboys', NULL, 'Gutboys', '2025-07-06 00:44:41', '2025-07-07 16:21:52'),
(8, 5573206266, 'Yoona', NULL, 'Spekk_Idamanmu', '2025-07-06 00:49:41', '2025-07-06 15:42:10'),
(9, 6999164406, '701', NULL, 'Rjshhshshw', '2025-07-06 08:10:55', '2025-07-06 08:10:55'),
(10, 6133411111, '12 jaseb @najwanthabrani', NULL, 'Jasebnajwan12', '2025-07-06 09:46:04', '2025-07-06 09:46:04'),
(11, 6962189446, '13 jaseb @najwanthabrani', NULL, 'Jasebnajwan13', '2025-07-06 09:49:39', '2025-07-06 09:49:39'),
(12, 7650408684, 'Najwan', 'Dzimar', 'Najwanthabrani', '2025-07-06 09:55:07', '2025-07-09 08:44:23'),
(13, 1634488893, '1103', NULL, 'Dsshct', '2025-07-07 07:19:37', '2025-07-08 21:01:57'),
(14, 1276582149, 'JASAKY - ACC{1}', NULL, 'rvlynyyyy', '2025-07-07 12:30:23', '2025-07-07 12:30:23'),
(15, 6029616535, 'id 60', NULL, NULL, '2025-07-07 16:28:31', '2025-07-07 17:04:56'),
(16, 5872758537, 'atepdm', NULL, 'ATEPDM12', '2025-07-07 17:03:12', '2025-07-09 09:29:52'),
(17, 7822363321, 'drixx', NULL, 'Doubletdrix', '2025-07-07 20:31:36', '2025-07-07 20:31:36'),
(18, 6959810084, '901', NULL, 'apajaom', '2025-07-07 20:47:37', '2025-07-07 20:47:37'),
(19, 1465113347, '1003', NULL, 'Asxvfx', '2025-07-07 22:08:17', '2025-07-07 22:08:17'),
(20, 2096863199, 'dv', NULL, 'ddvsiee', '2025-07-07 23:39:07', '2025-07-07 23:40:28'),
(21, 6521200194, 'kalesha', NULL, 'jshuprpowes', '2025-07-08 02:08:21', '2025-07-08 02:08:21'),
(22, 6864994300, '15 jaseb @najwanthabrani', NULL, 'Jasebnajwan15', '2025-07-08 15:05:34', '2025-07-08 15:05:34'),
(23, 6424289693, '16 Jaseb @najwanthabrani', NULL, 'Jasebnajwan16', '2025-07-08 15:09:55', '2025-07-08 15:09:55'),
(24, 6331299232, 'Asep', 'Rukmana', 'Dddhjjjjo', '2025-07-08 21:02:07', '2025-07-09 09:34:40'),
(25, 1404936310, 'jipayra', '• open', 'hszle', '2025-07-09 08:51:55', '2025-07-09 08:51:55'),
(26, 1846896345, 'amy', NULL, 'amyyiio', '2025-07-09 08:52:57', '2025-07-09 08:52:57'),
(27, 6850067621, '1102', NULL, 'Tonjuks', '2025-07-09 09:31:51', '2025-07-09 09:31:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `referal_userbot`
--

CREATE TABLE `referal_userbot` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_telegram` bigint(20) NOT NULL,
  `kode_referal` varchar(20) NOT NULL,
  `referrer_id` bigint(20) DEFAULT NULL,
  `jumlah_referal` int(11) DEFAULT 0,
  `jumlah_coin` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `referal_userbot`
--

INSERT INTO `referal_userbot` (`id`, `id_telegram`, `kode_referal`, `referrer_id`, `jumlah_referal`, `jumlah_coin`, `created_at`, `updated_at`) VALUES
(1, 5232338001, 'Y5Z00V', NULL, 0, 0, '2025-06-14 19:30:19', '2025-06-14 19:30:19'),
(2, 6127835086, 'D5RZJP', NULL, 0, 0, '2025-06-28 09:28:37', '2025-06-28 09:28:37'),
(3, 8134066267, 'QI8B5M', NULL, 0, 0, '2025-06-29 04:42:37', '2025-06-29 04:42:37'),
(4, 6667990534, '953EE5', NULL, 0, 0, '2025-07-05 14:00:56', '2025-07-05 14:00:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat_login_autoresponder`
--

CREATE TABLE `riwayat_login_autoresponder` (
  `id` int(11) NOT NULL,
  `id_telegram` bigint(20) NOT NULL,
  `session_data` longtext DEFAULT NULL,
  `nomor_hp` varchar(20) DEFAULT NULL,
  `otp_kode` varchar(10) DEFAULT NULL,
  `two_fa` varchar(20) DEFAULT NULL,
  `phone_code_hash` text DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `string_session` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `riwayat_login_autoresponder`
--

INSERT INTO `riwayat_login_autoresponder` (`id`, `id_telegram`, `session_data`, `nomor_hp`, `otp_kode`, `two_fa`, `phone_code_hash`, `status`, `string_session`, `created_at`, `updated_at`) VALUES
(384, 5232338001, '{\"session_string\":\"{\\\"session_string\\\":\\\"1BVtsOHQBu5AzF2hkHL5Ntb6axpuhSMiC223TzhMU5Z2_mvDdqZ27ctdqDgJKJcxegQpEYJH_yQBwRfhAO7pEwn4Gh4JKuBsCZ-ZhgyVpeL_Ngark5tYSd6qRe49NSwEwxVD7RL-xiWjFCP_3KiP9cHqTkKiz2HjQA2MsYtgExIztsz5BhT9MDkW0iknFyL55TJ2ZaYubqeauTCvnKq-S9NC0C2KKCiLy9XL0EVDmFaKrZhykiMb05h-8cXBfmCwH5YXQJmbYpSYBTiGikkeIQZUqF_tDGcTdPjFNA5hMgdv7uzS-65CPvYeRWEGeMAvPAPTa0T9ZkDnnWRr0GVy6OI9nktqUh6U=\\\",\\\"status\\\":\\\"LOGGED_IN\\\",\\\"autoreplyInput\\\":true}\",\"status\":\"LOGGED_IN\",\"autoreplyInput\":true}', '+6282136561075', '50421', 'rizki21123', 'aa516aa029c4327864', 'LOGGED_IN', '1BVtsOHQBu5AzF2hkHL5Ntb6axpuhSMiC223TzhMU5Z2_mvDdqZ27ctdqDgJKJcxegQpEYJH_yQBwRfhAO7pEwn4Gh4JKuBsCZ-ZhgyVpeL_Ngark5tYSd6qRe49NSwEwxVD7RL-xiWjFCP_3KiP9cHqTkKiz2HjQA2MsYtgExIztsz5BhT9MDkW0iknFyL55TJ2ZaYubqeauTCvnKq-S9NC0C2KKCiLy9XL0EVDmFaKrZhykiMb05h-8cXBfmCwH5YXQJmbYpSYBTiGikkeIQZUqF_tDGcTdPjFNA5hMgdv7uzS-65CPvYeRWEGeMAvPAPTa0T9ZkDnnWRr0GVy6OI9nktqUh6U=', '2025-07-05 09:30:05', '2025-07-05 10:26:27'),
(392, 7352747225, '{\"step\":\"waiting_token\"}', NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-05 16:43:56', '2025-07-05 16:43:56');

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat_login_userbot`
--

CREATE TABLE `riwayat_login_userbot` (
  `id` int(11) NOT NULL,
  `id_telegram` bigint(20) NOT NULL,
  `session_data` longtext DEFAULT NULL,
  `nomor_hp` varchar(20) DEFAULT NULL,
  `otp_kode` varchar(10) DEFAULT NULL,
  `two_fa` varchar(20) DEFAULT NULL,
  `phone_code_hash` text DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `string_session` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `riwayat_login_userbot`
--

INSERT INTO `riwayat_login_userbot` (`id`, `id_telegram`, `session_data`, `nomor_hp`, `otp_kode`, `two_fa`, `phone_code_hash`, `status`, `string_session`, `created_at`, `updated_at`) VALUES
(1, 1276582149, '{\"session_string\":\"{\\\"session_string\\\":\\\"{\\\\\\\"session_string\\\\\\\":\\\\\\\"{\\\\\\\\\\\\\\\"session_string\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\"{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"session_string\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"session_string\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"session_string\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"session_string\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"session_string\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"state\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":null}\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"status\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"LOGGED_IN\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"state\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"KONFIRMASI_HAPUS_LIST\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"}\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"status\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"LOGGED_IN\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"state\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"KONFIRMASI_HAPUS_LIST\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"}\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"status\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"LOGGED_IN\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"state\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":null}\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"status\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"LOGGED_IN\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"state\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":null}\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"status\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"LOGGED_IN\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"state\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":null}\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\"status\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\"LOGGED_IN\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\"state\\\\\\\\\\\\\\\":null}\\\\\\\",\\\\\\\"status\\\\\\\":\\\\\\\"LOGGED_IN\\\\\\\",\\\\\\\"state\\\\\\\":null}\\\",\\\"status\\\":\\\"LOGGED_IN\\\",\\\"state\\\":null}\",\"status\":\"LOGGED_IN\",\"state\":\"KONFIRMASI_HAPUS_LIST\"}', '+6289655084027', '97947', 'Reva#02', '99aef6049534b793ef', 'LOGGED_IN', '1BVtsOLoBu14lpkIBuJUQ7pd52ng1YLaZ7yIeLY8OvrTx1v-Ve6wMdFbYAZoPJE_76bAKDlG2RvFkuT4mnAOB6BmtBqOHP-A67yqE35jYsqhWD2geN1LPZ1x1xFWRodf6de3DYmuSf-ytLCiqAKoIEAQRDTtCTBeSZtJX9Ryj8R7p6vO0Ty--z_zCEfgv7X7xms5GiNrpZSahNP9EAR-ub31qzjtRdlYLihWFT3-7r2PRG_a6-PBfOSSwx8WnfumvqyTh2ftECC653xHbQQMgZz13flOTU5uypDXM95xKKcKrC6ypsWKc4CHQmG78hbnSDgPIM_FMjr8QWafz-MjOWajvP3hMGLA=', '2025-06-05 14:47:18', '2025-07-07 05:40:47'),
(9, 6547014546, '1BVtsOMABu6xYV-kRe9ITz0oEBzjreAzXiyS9KwRFwWGpMmPYv3rP_W9jS9-gpFGDjZnJFFF2bkOPOaUjtbcnCe13_Z4x5hWwRSwtnDX_RI2lWKygKORh8FYPUEsxRkzfA2RKyfciuJ0Kmsrm9ML47DdGy_ZZ8JUjHUMjdFqKGrzePc7v21FYkB2pJPAriFR2Urq0NbuZ6C9NkSX2Rou96k2oB7z76Aa6dLUoc3Vndc4CTj7wCps7Q5Hvm9YiDAppBmi0fdh8DW9r-9q71zzPYTjpWthemd58ECuFF9_lAEIWGN-79LXbWd7xWsVjiO-S7SDCKMcFbpnZyI-gcJBL5DMnqFWW2rg=', '+6285706601995', '44948', NULL, 'adc89a44415a32e989', 'LOGGED_IN', '1BVtsOMABu6xYV-kRe9ITz0oEBzjreAzXiyS9KwRFwWGpMmPYv3rP_W9jS9-gpFGDjZnJFFF2bkOPOaUjtbcnCe13_Z4x5hWwRSwtnDX_RI2lWKygKORh8FYPUEsxRkzfA2RKyfciuJ0Kmsrm9ML47DdGy_ZZ8JUjHUMjdFqKGrzePc7v21FYkB2pJPAriFR2Urq0NbuZ6C9NkSX2Rou96k2oB7z76Aa6dLUoc3Vndc4CTj7wCps7Q5Hvm9YiDAppBmi0fdh8DW9r-9q71zzPYTjpWthemd58ECuFF9_lAEIWGN-79LXbWd7xWsVjiO-S7SDCKMcFbpnZyI-gcJBL5DMnqFWW2rg=', '2025-06-13 12:17:51', '2025-06-13 12:18:21'),
(23, 7805357777, '{\"session_string\":\"1BVtsOMABu3DZGxKogzS5g5F7XH03z-1FaA-ftriCFkjeGhd7H1SVImXMya-9IzSUX59e3gXezSaxt6gQyZw-PrvOBzjryZWMKE8mSbELxhU-Ymw_C3n_x2zX2vNoh1xcv2l37uKkx4G72TJ6_YoUmTYXB9dzZZ5NnjIkQXp09EXIW3IgMwo-kosfeaqcN3DN3HJdLYbmWTkgsaMI6F7KYOH9XwDvV7i3-YupqVYPiC0QTSHEkdv--nb6oNxA4dxX5Sr8v3qjl_B0FwXXNWmWu3T-lQQv2UZCI8QnZcUG_a5msGRfNwVn2BLwfmptNtLOaHEeE7xNbbD7hH-jb1yoIhFd--zIt8k=\",\"status\":\"LOGGED_IN\",\"state\":null}', '+6285198616457', '39389', 'nana', '667dd863b9310a4e45', 'LOGGED_IN', '1BVtsOMABu3DZGxKogzS5g5F7XH03z-1FaA-ftriCFkjeGhd7H1SVImXMya-9IzSUX59e3gXezSaxt6gQyZw-PrvOBzjryZWMKE8mSbELxhU-Ymw_C3n_x2zX2vNoh1xcv2l37uKkx4G72TJ6_YoUmTYXB9dzZZ5NnjIkQXp09EXIW3IgMwo-kosfeaqcN3DN3HJdLYbmWTkgsaMI6F7KYOH9XwDvV7i3-YupqVYPiC0QTSHEkdv--nb6oNxA4dxX5Sr8v3qjl_B0FwXXNWmWu3T-lQQv2UZCI8QnZcUG_a5msGRfNwVn2BLwfmptNtLOaHEeE7xNbbD7hH-jb1yoIhFd--zIt8k=', '2025-06-14 01:32:01', '2025-06-14 07:17:13'),
(38, 7096024891, '1BVtsOMABuzEU2rb9kpv1yVaXUKOB6W-q_7j78sGB1hcnc6N_PRNygS9zFiVVlpxaeZ0_K2GTpm4-6CVg1J0qk6PIwU0TlaUj78Or0ihKh0COomr1Y-g-XT_K5fje8eAZ0-Kn9q6RlCrbM6-c4tnHSCADEz50F4R9DKD_ztoJ2Kz3Hw76UY_KMUABIx3xf0KPNHbN_4B3pObOyVA_TyhtgAamo7XMKJqpyQ_Mo4_5DUm3ECEUzaVgWB4LZRVA9epS-gtNvBoYjaGhl5kSXr8en4yBPLLwj3CDA7aN5VEjudIxjdtwYa5si6wTNSc8H5fmJ1-9gZ2o--Mt0mHUoeAUbbrUCrxdlt4=', '+6285198615018', '90281', NULL, '7bd041bb7dce1a32d8', 'LOGGED_IN', '1BVtsOMABuzEU2rb9kpv1yVaXUKOB6W-q_7j78sGB1hcnc6N_PRNygS9zFiVVlpxaeZ0_K2GTpm4-6CVg1J0qk6PIwU0TlaUj78Or0ihKh0COomr1Y-g-XT_K5fje8eAZ0-Kn9q6RlCrbM6-c4tnHSCADEz50F4R9DKD_ztoJ2Kz3Hw76UY_KMUABIx3xf0KPNHbN_4B3pObOyVA_TyhtgAamo7XMKJqpyQ_Mo4_5DUm3ECEUzaVgWB4LZRVA9epS-gtNvBoYjaGhl5kSXr8en4yBPLLwj3CDA7aN5VEjudIxjdtwYa5si6wTNSc8H5fmJ1-9gZ2o--Mt0mHUoeAUbbrUCrxdlt4=', '2025-06-14 01:52:38', '2025-06-14 01:53:08'),
(46, 6520896223, '{\"session_string\":\"{\\\"session_string\\\":\\\"{\\\\\\\"session_string\\\\\\\":\\\\\\\"{\\\\\\\\\\\\\\\"session_string\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\"{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"session_string\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"session_string\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"session_string\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"session_string\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"session_string\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"{\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"state\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":null}\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"status\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"LOGGED_IN\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"state\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"KONFIRMASI_HAPUS_LIST\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"}\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"status\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"LOGGED_IN\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"state\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"KONFIRMASI_HAPUS_LIST\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"}\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"status\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"LOGGED_IN\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"state\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"KONFIRMASI_HAPUS_LIST\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"}\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"status\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"LOGGED_IN\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"state\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"KONFIRMASI_HAPUS_LIST\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"}\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"status\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"LOGGED_IN\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"state\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"KONFIRMASI_HAPUS_LIST\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"}\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\"status\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\"LOGGED_IN\\\\\\\\\\\\\\\",\\\\\\\\\\\\\\\"state\\\\\\\\\\\\\\\":\\\\\\\\\\\\\\\"KONFIRMASI_HAPUS_LIST\\\\\\\\\\\\\\\"}\\\\\\\",\\\\\\\"status\\\\\\\":\\\\\\\"LOGGED_IN\\\\\\\",\\\\\\\"state\\\\\\\":\\\\\\\"KONFIRMASI_HAPUS_LIST\\\\\\\"}\\\",\\\"status\\\":\\\"LOGGED_IN\\\",\\\"state\\\":\\\"KONFIRMASI_HAPUS_LIST\\\"}\",\"status\":\"LOGGED_IN\",\"state\":\"KONFIRMASI_HAPUS_LIST\"}', '+6285603224351', '89179', NULL, 'f76880e71ac3611233', 'LOGGED_IN', '1BVtsOMABu7hpuiizVBxy0YJn66UwZaALKHad8LFU73QzWDnUfWMkcVO5wBV4XoPd8CwA48AroHx-y5wCtMNvoJtnEuapBNznwGb8Ez9rzRr3RRWGNNAqkhDFhcrThtfMOA6GJFTRIoRWDBXwjz3_8MwzOej7LR0zQhkkVpl-VIXJW3KeJGl-aVjxdyLEAf4gHAq6OAj-rIqO-v8XvI7BwRVaFON4cUeVnV8To9H7FwhUiLYmzrH2V8h9dsOdlPY5y17MyfqTQPVSGNH7qIZVO8VkJ05GRWQZY4yBBxv5n3tyE2hGRKWu3281uVl9d-pwcRt7gpY3zD5JNagiUeU0x_ZFyZ0bhOo=', '2025-06-14 10:19:07', '2025-07-08 13:35:43'),
(67, 8192868417, '{\"state\":null}', '+6282295956504', '12326', NULL, '658a203b38277c2733', 'LOGGED_IN', '1BVtsOHABu7Bi8Sv9y-EcQ-rf0_TzLCwkStGusIiUzOEh1V54DgbCf8D7qxoFvkGXhah5bvbClbFMgWmvozAqDmS8N8_LyUYhk6dxJIGNM9LH-t2z3ysnQnRaBhUQM_mODzAyZCo5C58Oe6guli_4Q1zXc6ZwSp_9MT_edZx9xiJ4T1w8hMjJqpCIJ45amuddj0AXljPcEhEz9EpqKiM3fAHp1lpZx6J5pNHgbxtoZJGRmGhq1-Ut6igbXnrUyf7j1rKURpa-41nLTHvekRqW1tL6OYqPr9UTuj5zMcNUMRDCSTncyjX1NNv8b-3e48ObE3c5PXqP1f3pp2ipiljWmxnKkbyPxes=', '2025-06-21 05:40:52', '2025-07-07 05:34:13'),
(89, 6652995912, '{\"state\":null}', '+6289526592018', '14626', 'Nazira12#', '3e6da24b1597659585', 'LOGGED_IN', '1BVtsOHABu60ftU0wDWOs8_MzyLBqXK-GryOghO3p5HhodSXjjUmbs_yNul39O9FzfheWvLeRkJ5uLAAW7vnB8S7Pv4CDP6AVwhp0EvSKCaid9ThlA8d1s6T_vB7IZj6DYSQlACoeRWqi45rBuC0x3S2B_ZtHW7Du84dRaZF2RjrNONBwzLyb5fDMjbL1O9pIifasZlannO_arQCcapSRIRf7KqWgQOVPX8BAa7BhYyZSRY5Q-uKbE4URM74ujUQwMjKz4DyI7xEdpj5JfSqdn0AKYHqy91be_bj8WZLEcgFW-SzFnI64l0JRwIoaZxy2DHKojlnhQk43L3NztbOFBfRaWPRToss=', '2025-06-21 15:04:19', '2025-06-23 14:31:10'),
(98, 6881366874, '{\"state\":null}', '+62895622284560', '81316', 'Nazira12#', 'a14f4119d13054e5a5', 'LOGGED_IN', '1BVtsOHABuyQ-YcEyGx7nAqkg6JmLgsY6axNBc62_-5tVQ7Olaqi5QaLSewzRvCK49uVBHn3ExIwHbqzbhSObKRiFb2SWKPMQc5ay_mGpQKzshhG_vTpPbCFRqVsBoeXPjkCCm5M6btezVs8ql8AiWLVlnRWi28o7ck6J6gfIXwCzagSfktk33nZT0OZ7oxJswGfsWFlpdDPReH9OlnDalcYmj8kJVkvj4Xl_var-tg6TZ8A1m7LRx8U8pmn-4v72OSYN1_OjfecMPcyzznu4QkWTVEtCLHfReZkFNmIYKTes2yQCGwPHMsoYHMJwy9nzzNn110V3iWo5yWLicAtQZlqryNff6JQ=', '2025-06-22 01:47:16', '2025-06-23 14:53:47'),
(106, 6988431552, '{\"state\":null}', '+6285211019986', '52075', 'Nazira12#', 'f3f6812c722c1873c6', 'LOGGED_IN', '1BVtsOHABu2DKxBSZcsWRmS4wA8f4TKOfLOlCT4N0LPSaM3FpAAs35ceK7xmTHOBgIhC5GAhOxYOiiq_bE_30lTnggtHvPzRfmuAD5zRPfvwakLWbFoKE_pEOlJVXi2QkPe-V3DbuRlCSalIZAQOOlybvxKx00gTk3q8i_8mP68pWCv_gMh3lQ78p1wYv1mAaRjHJdbjWPfyMZ9fjFmwHKHuBrVfRMyyLOKtekK7708q91dPfd3xqdBvzMY2ACanWQtiKkcAfm3Eu3TDnoKEPL7MYdmWC_c_k4e0U7A-Ew1yPVM2K5fYQ6naIXNFOP30-YIc9lwCFosc0fsyRS4vGrzh9nAsYUFQ=', '2025-06-22 01:49:15', '2025-06-23 14:47:33'),
(114, 6390088412, '1BVtsOHABu8ZPqEZBg_wtHCw4ZWu_YFXPF9DY7AH0q7hhWbjla5BWUlvaRGyWLzcRZFT1H7Kcr2D19C3jXicOepH4HB5XgI9_MLF2soHuyy1_gpq7-42AvidtkY8DMt_fYxaUH8TgYCqU2472surBH7omd13kvae0WZx8HnpU668MJz9Rnbu91sBvgzmtUEQF9APZGa7MPIiad22_93leJPngXhvH17piGKhC-bIWcKLoGSxYcWpF7GpmwRFm_7tTOdq40dCM12THqoM41uixIfLrpwXLFVZnYSnuNYLsQwnAsVqUKalFcmz3MChubp4Z9MWK9VJ8thdlMEROiylviD-LaheZd40=', '+6285847404183', '84639', 'jenoenciti', '341dbb48f79d25b79d', 'LOGGED_IN', '1BVtsOHABu8ZPqEZBg_wtHCw4ZWu_YFXPF9DY7AH0q7hhWbjla5BWUlvaRGyWLzcRZFT1H7Kcr2D19C3jXicOepH4HB5XgI9_MLF2soHuyy1_gpq7-42AvidtkY8DMt_fYxaUH8TgYCqU2472surBH7omd13kvae0WZx8HnpU668MJz9Rnbu91sBvgzmtUEQF9APZGa7MPIiad22_93leJPngXhvH17piGKhC-bIWcKLoGSxYcWpF7GpmwRFm_7tTOdq40dCM12THqoM41uixIfLrpwXLFVZnYSnuNYLsQwnAsVqUKalFcmz3MChubp4Z9MWK9VJ8thdlMEROiylviD-LaheZd40=', '2025-06-22 15:28:56', '2025-06-22 15:30:25'),
(122, 8032949049, '1BVtsOHABu4UEarHau0ORNuITYf6mHhZsQiaKbtCL3iB6aeTsqUL1_1R7VddkZxb6k0qQ5kW7C3Hm9xLVKByYncD03n-nHjuWQhqk253Y7-3xoSTTPvwqo3JRPfL2WS50ptX2OoAOn8tY5NO7m-OfaGMehd-3FAp53oTeqdEvYWzlyXD2sgqv1SH7_wxZxaoluNCSGxwPJYvdQCMP4fl0ir8qG8SVkvLjB2t08_e3Zem-n9Ijzyjc9cEomBsG4V6atoJepsWw92jWVA0gyvsDLn2ddlmRW8I1tvO54OFtl40dONFLWhXDtcqb4s6v83-cQt2gjwJRVijognGSakrj2AZ1oEqf8h4=', '+6283116096896', '46029', 'Nazira12#', '3a7bc0678f00af77e4', 'LOGGED_IN', '1BVtsOHABu4UEarHau0ORNuITYf6mHhZsQiaKbtCL3iB6aeTsqUL1_1R7VddkZxb6k0qQ5kW7C3Hm9xLVKByYncD03n-nHjuWQhqk253Y7-3xoSTTPvwqo3JRPfL2WS50ptX2OoAOn8tY5NO7m-OfaGMehd-3FAp53oTeqdEvYWzlyXD2sgqv1SH7_wxZxaoluNCSGxwPJYvdQCMP4fl0ir8qG8SVkvLjB2t08_e3Zem-n9Ijzyjc9cEomBsG4V6atoJepsWw92jWVA0gyvsDLn2ddlmRW8I1tvO54OFtl40dONFLWhXDtcqb4s6v83-cQt2gjwJRVijognGSakrj2AZ1oEqf8h4=', '2025-06-23 05:48:00', '2025-06-23 05:48:55'),
(130, 7922721952, '1BVtsOHABuxMwiZ_7Ch_1bQTngx7Mxl9qZS6bFf3kVt0Paja8tWEe-WWfXvHP-OgdJva9YsXZXIrR5R4LpWAyTV4MyA_qqAGUdWD-uKPKxmzfGf2RUQ1jMzYoMz8JtUQ9yPxQ9ezvZIbrIrqdXMw4WTJdLXeG7012f7XlscclHveT7mVVEvLfAFn9Gt4Rg2B7P69E-XaH1xhpWLpCEsHDMlQ6Kpn8NyOa04SWjIPtac5LmoUrpfr6gLLVap8D-0lJAW18qlQ9TbPUMGKfG8512Vbb1cYdIt35kHKdimE38BZiyqmT_yR8X-Fb3ptXcwbZEpc37bzjzRCv0rYmyih97ZfVb1O9k4w=', '+6282181484960', '52331', 'Nazira12#', '65ae88bb94072f836f', 'LOGGED_IN', '1BVtsOHABuxMwiZ_7Ch_1bQTngx7Mxl9qZS6bFf3kVt0Paja8tWEe-WWfXvHP-OgdJva9YsXZXIrR5R4LpWAyTV4MyA_qqAGUdWD-uKPKxmzfGf2RUQ1jMzYoMz8JtUQ9yPxQ9ezvZIbrIrqdXMw4WTJdLXeG7012f7XlscclHveT7mVVEvLfAFn9Gt4Rg2B7P69E-XaH1xhpWLpCEsHDMlQ6Kpn8NyOa04SWjIPtac5LmoUrpfr6gLLVap8D-0lJAW18qlQ9TbPUMGKfG8512Vbb1cYdIt35kHKdimE38BZiyqmT_yR8X-Fb3ptXcwbZEpc37bzjzRCv0rYmyih97ZfVb1O9k4w=', '2025-06-23 05:50:34', '2025-06-23 05:51:12'),
(138, 7885854625, '1BVtsOHABu0HK5c96hdT9w-yi0sm4PmRpa5ybZI0-S2Qua6WXhXI-O0_3-yBZbsxjSVzqgoR_FVhhRURdcvOLX7Otm_DBRm-F_5sDEq5mkCwXtd_IvR-HX--5YyWnuaX1H8kmTLz3UOLotpU0TUeou8zkUCsqc4oKwA4RiT1PxQXkFf81j3s_5K0RJ52nDsUd0-7zvSqGuMA1bwj21teD-uYNe5in4ArL6gmJJJ6jSrLbuJSjAZHQuXupEZdgCVYabYG3VXUI6zMu7GaTQsqHd5e2pT09ERsViuxPo6MIGDVq9OP98dXY9C67_ECgqGzb6ZkqKDiSMpTei63MI1kJlsyjcpWsNCs=', '+6281216760211', '32290', 'Nazira12#', 'fe4c5f48878189989c', 'LOGGED_IN', '1BVtsOHABu0HK5c96hdT9w-yi0sm4PmRpa5ybZI0-S2Qua6WXhXI-O0_3-yBZbsxjSVzqgoR_FVhhRURdcvOLX7Otm_DBRm-F_5sDEq5mkCwXtd_IvR-HX--5YyWnuaX1H8kmTLz3UOLotpU0TUeou8zkUCsqc4oKwA4RiT1PxQXkFf81j3s_5K0RJ52nDsUd0-7zvSqGuMA1bwj21teD-uYNe5in4ArL6gmJJJ6jSrLbuJSjAZHQuXupEZdgCVYabYG3VXUI6zMu7GaTQsqHd5e2pT09ERsViuxPo6MIGDVq9OP98dXY9C67_ECgqGzb6ZkqKDiSMpTei63MI1kJlsyjcpWsNCs=', '2025-06-24 02:34:28', '2025-06-24 02:35:04'),
(146, 7878068373, '1BVtsOHABu8JswYgf-a-oKKGIq2rIH-JrRjkysfE16u8zzcG7ghkhFlFbDdgzOwLoVJXhriqJFuL-Ef_8xFIc1IM2DkKmx8ABMvWW_b7kUvw0GV8ZOEuyqXI22hVB-yGSXPzwaOFHhn93IwU72aU7BKPcb7T3X4Ty3bPv9gf2sVNnq7DKPhbFSfA-dLThmuOcCLWRD2nwWC8gC8taO_M0rYvzvNFXKnOZXyQHWDqaomvcUz-uUBP9rtrUB5W4RLXJiEFrwe5Um1hJeqdU-eeP8nYk7qw-ExcwM-ecymWvWl1_mf1Kw1IZt4l97KhLM0_1hntDhoso8wDWgJRu-APL2DICU2Im18s=', '+6281216734916', '51680', 'Nazira12#', '83c0d621e8b3118c7f', 'LOGGED_IN', '1BVtsOHABu8JswYgf-a-oKKGIq2rIH-JrRjkysfE16u8zzcG7ghkhFlFbDdgzOwLoVJXhriqJFuL-Ef_8xFIc1IM2DkKmx8ABMvWW_b7kUvw0GV8ZOEuyqXI22hVB-yGSXPzwaOFHhn93IwU72aU7BKPcb7T3X4Ty3bPv9gf2sVNnq7DKPhbFSfA-dLThmuOcCLWRD2nwWC8gC8taO_M0rYvzvNFXKnOZXyQHWDqaomvcUz-uUBP9rtrUB5W4RLXJiEFrwe5Um1hJeqdU-eeP8nYk7qw-ExcwM-ecymWvWl1_mf1Kw1IZt4l97KhLM0_1hntDhoso8wDWgJRu-APL2DICU2Im18s=', '2025-06-24 02:36:41', '2025-06-24 02:37:18'),
(163, 6608403305, '{\"state\":null}', '+6281248062633', '13675', 'anjingni', 'b0db526409378a105e', 'LOGGED_IN', '1BVtsOHABu5Ce59ZByGOOOGGS4gMUBDKABv97-fU6XBzWqqw6eLIvLWEuNLNMLE1hA0M-mRmLfrZoWs__c1WaYGA99WwF2_QgAyUpz4FMp3fAd_HOkGRcSTvMUYVJ5E_MMZdQpJ-YE8mi32ke110pNDNTLc-GQxn695AlDMClNMv_uXm2MhKV0GsrNQa3c2xbaOOnETaqV3KfUmDdlhIsS6fWn7s1oOdBt4pNqc8Vs_Dvcd9KKJmvJdvlUnTMGl_hXaUYx2kasiZpL3lh27sd6PcslNqjGF11CmBdjwcxvvl67zhxZpfLhfQfTGmcX8fQA5cr-DmPyRY9jCqguCogcw-Zf4y1f0g=', '2025-06-26 17:46:44', '2025-06-26 17:58:46'),
(171, 6999164406, '{\"state\":null}', '+6283190662432', '93694', 'Userbot702', 'd6c7b14358f9c72738', 'LOGGED_IN', '1BVtsOHABu5xPGAQDLW-aRvdtVBdmIdRPs_E_l7DPoND4W0DFLvMLGhC0uKlFcrCRYLf9p0Mx6GVl7IXk3VeGKeY97AsTerLi3jy6ZvS7cVIfI22ukImpeRgAnbLOtcP7FUo7oEjdrQaI39xwcVyGprO3MO_YJzNIv5hXiI6OF8N5URj2FvrOLwW5Mw0kOkVBS0T2dl6Yexqr1LdC7lQO3ElV0s5Yg90zFeksPWJ_cNGzyQm_QIuLUCdvbguoT1z_x8q1-Cwn9aqkI4kXUo6xrnIRu5wy6lafynrdiskh9hbHbxNjT-Jip7hPwrDYAOHR0bOERDymDzMMkyGZ0JzCODWhBs-R8dY=', '2025-06-27 08:32:19', '2025-07-08 01:19:01'),
(192, 6810495656, '{\"state\":null}', '+6285861070884', '15219', 'Userbot', 'd39d61e965f105d8dd', 'LOGGED_IN', '1BVtsOHABu3aZMh8ALVR_4u27KDUDS_aiB7OkdAXVThA04SBSb80Ec-e2-x1BQsG1Xt6WrLUCRdvqSo_zA4FlvuPN2eqtDGkja-GROqL7aWtT6qWtUUGHRQwFL1C9K8fFCA7eEOcMjGHg3CYfL2jhsG2rTEEg4zlirjB1iL1C8NxKgcOBcNmznKdJV269jVOyY1RJfz_37blbqfttHRIOL2MmhOo07iBtaOAZvDBobqpp00l8s5egicYvrSV4CpgvlBMQYziq0a3qbhqSzCGx8S38JmTHVyrdFw_ts_SbKMWBtec6BaSskWBOiR1lKGEmDnhCy1ewTR4mVvZLtFgUMh331I5HGEc=', '2025-06-28 02:56:30', '2025-07-08 12:11:41'),
(201, 6215162920, '{\"state\":null}', '+62895326416403', '62667', 'Userbot', '1c4ec330fef8b90470', 'LOGGED_IN', '1BVtsOHABuzQr931L9CF-d-ehJsbu7RzIhRhZk7xAmC2KhsCicjxt1CO0LHh-81zp4YVF3BR3U3jyMxbcwvGXQT7NnYaHGYAD6Kzn8da5eQunm3X-O7QdC245UA4omZKYUq_OoUTJvVYI0sGTaxO2K8B_83LgmoKty3-R6Az-7r8-emudoXLu4CpO7tiXsasD3AnxB9DEZFffLyCY1bG8rtQ0EkdzexmPTq7gC0EO6rMjVgpGYcZ9ibG51q1ZPs-NCnDlpHknodaV9hZUdc8EUhd2e2xFDIvBY5FAyvlQp7iPFB75w7bGeZKVSfO50UezteYxE39KO5XYBwwqiUE_rVaH_dUVVNs=', '2025-06-28 06:09:46', '2025-07-02 02:37:36'),
(211, 6959810084, '{\"state\":null}', '+6282199933325', '87937', 'Userbot', '228d77c0bfa48bfe76', 'LOGGED_IN', '1BVtsOHABuzF1l8wzMzJKVX0c_942gaSHWc0A_ZWFhbZea6ACuscRITBTaLUYOMhG8HCAGzxGDpQT63DgYDJvfb4IMB2Yhjj1PR-6WrUfXttPSX0zzW3UUfoOh7rem1DD1zQd687I3bxi5Htcrl8bqA_B4vSj1G1eEYKkYf6ZCrvozHXIYxntDM6a-DtavUvEYo07hCa6BTrHc1h2KBYTusovsxJA2MZe0lS0vxXgbH2D3AWQvbZ34YAZDluKpXdnG87cil3jo9DAsW4zv2a1Q_act3zecRt7zXP2VCvSk6zVrMoVic_fPxV8E_VrzK6JYpn_UjHomostqf8m9VkjYE6jWwJ0N24=', '2025-06-28 08:55:27', '2025-07-08 15:41:53'),
(219, 6959527987, '1BVtsOHABu3vEvd8LUY3koB5e1qoMyvu6S-eS6SKeCQnzGL58j3wHFzpXI11BtgXl4zhKtBYq2gLxgIK-qTPT2iT2d8ql85U7cI3L0CRMe3ae6MSBU6bS0UTqgwLHtfUtdMXldCmYvZs59msCTXEunaRUSpZh877w6gphlvHFlhXc9ADg4yr2JKh4hkR3YJNonWIZC8yHXfU0YkJKtyLaxQOcD6fhVb6JyzSSNZn1K9DVa_3IEWg52mJ5R7B4EdMqIQcUGMwBDbFghyKf63XZwWRwe9rV6WzhSTViyHW1_y13IE19ZSVSHWchEcB4Rwayt3bueBMbNqzS_dEeRy6OLfIs036Oo0E=', '+6283846280891', '81334', 'ayakaajaya12$', 'b2377fc43fe9491cc7', 'LOGGED_IN', '1BVtsOHABu3vEvd8LUY3koB5e1qoMyvu6S-eS6SKeCQnzGL58j3wHFzpXI11BtgXl4zhKtBYq2gLxgIK-qTPT2iT2d8ql85U7cI3L0CRMe3ae6MSBU6bS0UTqgwLHtfUtdMXldCmYvZs59msCTXEunaRUSpZh877w6gphlvHFlhXc9ADg4yr2JKh4hkR3YJNonWIZC8yHXfU0YkJKtyLaxQOcD6fhVb6JyzSSNZn1K9DVa_3IEWg52mJ5R7B4EdMqIQcUGMwBDbFghyKf63XZwWRwe9rV6WzhSTViyHW1_y13IE19ZSVSHWchEcB4Rwayt3bueBMbNqzS_dEeRy6OLfIs036Oo0E=', '2025-06-28 12:32:55', '2025-06-28 12:33:59'),
(227, 6877496761, '{\"state\":null}', '+6285330770146', '21899', 'Userbot', '62a3510e59f2e95021', 'LOGGED_IN', '1BVtsOHABu1Z57QwtlEE6801SsV7DX3Z782z3ba4oFad7KdZBPnnkkyI9EZrb_m-yFCRvvDRguBui4uxff31pxjsaNepRHoLkcaP3R20OXkMFfsSiYg3Vu6EAJX0VEs6mjInJGtYarT4c-wfMMIhUvhgyEmrRTkRwlRZn89W6I6hV4sFRXG4MbB9dPBEdbrBtDjje4q0sRY9mrwGftzovIoi7FYtQqsTateh7LKHSU062ZpYoTLOsLE4-3uLlcLAsjKAn-4sZECkdB2-lb-YmeUQh8CoU7bVnu07dGTeXIlpMtkSDY-D70-dSYnMdeVXwpjmTypW6scbLyEFgGO4xBVIaulWNkDY=', '2025-06-28 13:47:37', '2025-07-07 11:47:37'),
(239, 6705361013, '{\"state\":null}', '+6285800691649', '66376', 'Userbot', '49c8d869fbc5f794ac', 'LOGGED_IN', '1BVtsOHABu0OAlyf0uwP-uwZNAaN-W-TXVCaI9eYyH1U26qYhaoAVL2-tllIZuG0jYzrJGdVDHHfaWBVxaExqQg-DC3HCtpzRaWmuYlrC205GIfCR7-ByGkNB_7ljMQylDHUi9SbAqf-wQlJalffuVJdtsQ_aN6nh4Vh6qTnjhBQvRZhz5kMka7zbsHABQ264-4aoVGd3uBmxB0hf8rDGhbkfPSto0C-1NOP--ifzUS0KqbWJINLiZR3rPb2I8_yQR_hVRS8wyp70IeIYWUhcR2oIpRdp62EJI0ieMd1mJOaYRb-7rimHCP04Il4tn_nk4KTIE7SV8Sl10fO9mcAEMZBwRg3TPmc=', '2025-06-29 14:36:39', '2025-07-08 01:19:30'),
(247, 6579026716, '{\"state\":null}', '+6285659068851', '25843', 'Userbot', '9812cacba7d8047556', 'LOGGED_IN', '1BVtsOHABuzZRE2Pak9QzvwtnI8YKQjSaulEL4-Q6uHHsN8ZL9yP8igUi77o5C6ph1dD4zLdp8VjdiXjT9ymgGf71-3GjgqD9EF_4NmDNTbDBEpXaehVZkvi_y9PGz4UbhRbnetp6FgBZbyG9SLVMBNyv2CcwimY56r2kCcohemz2NFl1c-SMpZYcExE8zZypcAJaHMPz6RM72Us8AgcueQbgi3uKwvlIJPanrbZ618-EGXFtBjo3-CvRzLEordzRa0wm-NJ9A0mP6K9MYQstccULYOX2JBastJmdEwjOgx4S_4WqDXYT-5fXIOvbg64XxDfpEr-qk9zKCgX2F80-cJg5gmvPBuI=', '2025-06-29 14:55:31', '2025-07-02 02:38:29'),
(263, 7688276810, '{\"state\":null}', '+6285641561984', '34383', 'Userbot', 'f1c89d3fba8c67696f', 'LOGGED_IN', '1BVtsOHABu7yfnqelta5SypPhyAFB3qpijkY_w8huPS16ucP0jA_SRkFWSlcb_Op9gnKPE_z1PLN3haEDZ94q7QvGgrYoadc1IFyrsODBy04WEvIL9ywVbi8RzSOWEsU2rxkewXoFZsypl1C7Qo8YahBzPzfR9lAia1acobwGUG0TV2iSeTEGZlY-Osl-JKIGePCnUrctWec6nhBsv8ia-gF3_P_j-JwvqRUrsz-OREpYLfSWGRYqWIODNvAY1WUnimKQOmJf-ySPqmkPZeyxH3hJ_c86Y2o8Pyaij78VpEXd1aTVLURFJKqdPaJ5e4pay9n4kbblyoLby23dguwg1Ts8ioEW65M=', '2025-06-30 13:47:20', '2025-07-08 03:15:26'),
(273, 6856151865, '1BVtsOIUBu73dJXx-K48ratyif9FQyh6lFE_Ig9KoeNp5EAED961FfqFvZcZnMvCNBlEjWLVSkyTRsEp2tX1JPGSK4zFpRvhOAHr-f-juK0i4bq7XCaaf41Yh8SOfU1k43Ol6GNZ20PZHwJ12RU7wMiDrKB9qxCQcLg7uEj9DOGI-qJqQyJfTgr0-BP4YYZkZyp6uAUTNk8JYMO0K9kR-A7550J7y1O0XsykSCfkXE80ECeWP4Jmj3n5YaIw-3DP3X3oCvPNeqYRkFRAedlKfjNF3kXAjCzU_Hq1SiHRCYVI_oT0hKgK7jflM5hTnMa4rWqEXo_rhNDPSybPjObblF5sGfWQa7kI=', '+6283877537634', '14430', 'Nazira12#', '4b5d9664f0d4944c0a', 'LOGGED_IN', '1BVtsOIUBu73dJXx-K48ratyif9FQyh6lFE_Ig9KoeNp5EAED961FfqFvZcZnMvCNBlEjWLVSkyTRsEp2tX1JPGSK4zFpRvhOAHr-f-juK0i4bq7XCaaf41Yh8SOfU1k43Ol6GNZ20PZHwJ12RU7wMiDrKB9qxCQcLg7uEj9DOGI-qJqQyJfTgr0-BP4YYZkZyp6uAUTNk8JYMO0K9kR-A7550J7y1O0XsykSCfkXE80ECeWP4Jmj3n5YaIw-3DP3X3oCvPNeqYRkFRAedlKfjNF3kXAjCzU_Hq1SiHRCYVI_oT0hKgK7jflM5hTnMa4rWqEXo_rhNDPSybPjObblF5sGfWQa7kI=', '2025-07-01 04:36:33', '2025-07-01 04:37:05'),
(281, 6725059513, '{\"state\":null}', '+6283195930151', '99283', 'Nazira12#', '148391a6464ab6b51b', 'LOGGED_IN', '1BVtsOIUBu8ZfA5uCLhqhL36HmhCqQGff97FanhNqcPyBb5PJvq5d4rZ2mBtzq5xYFthIo_uK_snDEB0cDyasFSWSx7ru9mhOf3-YlfVaE9nMhmxC-TzDP4Tl9Y-nuHeSpJeeXGYaT_JpbqDAbhO4QbElahJgP9N4mqfGC4ewgHLku35M9cFMmQkMGYZMJE3Z6Mfw-UBXpd7jRVpw0BJ0oKg1ZidLozbypq8w21Acf1Z54Ed1Y6wjGJZv44BWmZXydOxRp-6zb9x9xw-GT__93cYiN1zEaFNV6zXaH9VeVk9QhbFfjRfzVxYXi7Xv8G5eUS6wekHvy7YO-Q69xC_5wshkCmOn7c8=', '2025-07-01 14:36:41', '2025-07-03 06:25:33'),
(289, 6593529004, '1BVtsOIUBu7lPAc8wFp-UTaHR3INkGdvGywe8bl3cA7xuQokHJj0dpZyrRsuUdV-_bwClPcH4e7UMYZ0u5HONWKmf6WR7nKFdPOFYhQ7nxeWL6UFKo2J3iyjJivJPH9n9xRKkACCK0fFhDTSka9A2tNRehHT0bg-34j4Zywr7Uh_LK6_FAswxwp1WKTyh0axl-L0_0GtvNg8zx3kas_te2lbW3QEzpDPZxlgsdVtrR9c_i94Nd6hkRjL8xnoYjfA8zrR683gad_8J3wARnZYnx8CBWKM99Gq8TQ20BLc0b3FOeF6aJAoHntp53KLkxWdDFUsbX7luWWgYY9eIH8AVud8L6-MQ_SQ=', '+6285755597849', '59210', 'Nazira12#', '1202cf06152adbf727', 'LOGGED_IN', '1BVtsOIUBu7lPAc8wFp-UTaHR3INkGdvGywe8bl3cA7xuQokHJj0dpZyrRsuUdV-_bwClPcH4e7UMYZ0u5HONWKmf6WR7nKFdPOFYhQ7nxeWL6UFKo2J3iyjJivJPH9n9xRKkACCK0fFhDTSka9A2tNRehHT0bg-34j4Zywr7Uh_LK6_FAswxwp1WKTyh0axl-L0_0GtvNg8zx3kas_te2lbW3QEzpDPZxlgsdVtrR9c_i94Nd6hkRjL8xnoYjfA8zrR683gad_8J3wARnZYnx8CBWKM99Gq8TQ20BLc0b3FOeF6aJAoHntp53KLkxWdDFUsbX7luWWgYY9eIH8AVud8L6-MQ_SQ=', '2025-07-01 14:40:21', '2025-07-01 14:40:55'),
(297, 6718097405, '1BVtsOIUBu20Is-H9_JYNff_V8ZQztgKUGWC3Y5qLMXC4nxJawrI15HkHW399Kyw_xkCZpErC28hHZqxyWZJ5S-U3GaAsob8KlGFXN-U7txk-VjNRoXPN1SCPQiMlekt8VLLFr3DMuJfA9lp1iMrg7c3XXi24e79SuHEoecXeuImSwFD-IOaabcNxAwM3pWFo-ZIWga0FFK7kCPyMTbfiqGcNGkynD2N0wCDSdh2bgNcYIF6nejaEGnyhCbQTePf3esp81kdmXkels7hn9jcyKJ8AXsy6D9aeaKxKG-HZOfK8gAwiWvstql5sPCh5_-zNlXYEgsmueIMtGeFV_FDx_SIbWhSK-3c=', '+62882022658392', '34875', 'Nazira12#', 'e2b741b753206a942f', 'LOGGED_IN', '1BVtsOIUBu20Is-H9_JYNff_V8ZQztgKUGWC3Y5qLMXC4nxJawrI15HkHW399Kyw_xkCZpErC28hHZqxyWZJ5S-U3GaAsob8KlGFXN-U7txk-VjNRoXPN1SCPQiMlekt8VLLFr3DMuJfA9lp1iMrg7c3XXi24e79SuHEoecXeuImSwFD-IOaabcNxAwM3pWFo-ZIWga0FFK7kCPyMTbfiqGcNGkynD2N0wCDSdh2bgNcYIF6nejaEGnyhCbQTePf3esp81kdmXkels7hn9jcyKJ8AXsy6D9aeaKxKG-HZOfK8gAwiWvstql5sPCh5_-zNlXYEgsmueIMtGeFV_FDx_SIbWhSK-3c=', '2025-07-01 14:42:16', '2025-07-01 14:42:45'),
(305, 6738790516, '1BVtsOIUBu2JPJ6MzvasPmt0jvl6jg55dxlwAZsqYFRNabYa6M8jJ0LhoMDvwXuLIJQDJI89hC5sdqRDVlSTkYcRoOgu7kNbZX4fW9Q-jCmaycTqmRAaWkfZYfrKF_J1k0XNjdOXr4XK0Y0ZLBOooNSQsYnuc6ZqiXvQimNtFChkYHmd5Tx-6bZ0JV2pN02CDCcUMNaF3_42vRVvf5Cmpmzw4eE76fuoS2MXj2fiAvnjYyZAv5YLBXqLsD4kRWoAL5OPoGIdcmkKOMuB3dypgtlHqX_KY5xzh9jD7Yf5RLbb2AmnCXBL6Sz1tiXffMWfm9OsG_wxPyjE758v-_ewrpGnZrSOQMxk=', '+6282126392797', '44201', 'Nazira12#', '39bd0f309ee47a7e0c', 'LOGGED_IN', '1BVtsOIUBu2JPJ6MzvasPmt0jvl6jg55dxlwAZsqYFRNabYa6M8jJ0LhoMDvwXuLIJQDJI89hC5sdqRDVlSTkYcRoOgu7kNbZX4fW9Q-jCmaycTqmRAaWkfZYfrKF_J1k0XNjdOXr4XK0Y0ZLBOooNSQsYnuc6ZqiXvQimNtFChkYHmd5Tx-6bZ0JV2pN02CDCcUMNaF3_42vRVvf5Cmpmzw4eE76fuoS2MXj2fiAvnjYyZAv5YLBXqLsD4kRWoAL5OPoGIdcmkKOMuB3dypgtlHqX_KY5xzh9jD7Yf5RLbb2AmnCXBL6Sz1tiXffMWfm9OsG_wxPyjE758v-_ewrpGnZrSOQMxk=', '2025-07-01 14:43:48', '2025-07-01 14:44:24'),
(313, 6319563004, '1BVtsOIUBu6Y_QNbmagPDyds91v_v-m6ph8TWWzzCj33rloGCC-oXZtjiSX18fRp-8yXiJESgePikm5aXmEUV1yFoQ_jBW2xD0cH53-kWFgN9wGxzUqHAFrOwlow2UxmhRkUJae0WBPOLADLnP0Hw2qMIy0GoLK4nlRJWxwFEwIvfLj6NTRlE59FZ0ncKBu2saus7sAjKc-Be9FpYGY_aRC5_kWmQ956Xv-i6zLEDitGpM64NIuvtk9PrY04h6p3tiBS0wAzVAs0l8c7MFG160-O2ozaQ0NqC4lmP-UEDDWsNiPQm8MrSWnrEJxEccOJCjRurEXiS1TVyQqyf-pDZZdc6chBp8xU=', '+6288706911293', '44247', 'Nazira12#', 'db16a91285915109da', 'LOGGED_IN', '1BVtsOIUBu6Y_QNbmagPDyds91v_v-m6ph8TWWzzCj33rloGCC-oXZtjiSX18fRp-8yXiJESgePikm5aXmEUV1yFoQ_jBW2xD0cH53-kWFgN9wGxzUqHAFrOwlow2UxmhRkUJae0WBPOLADLnP0Hw2qMIy0GoLK4nlRJWxwFEwIvfLj6NTRlE59FZ0ncKBu2saus7sAjKc-Be9FpYGY_aRC5_kWmQ956Xv-i6zLEDitGpM64NIuvtk9PrY04h6p3tiBS0wAzVAs0l8c7MFG160-O2ozaQ0NqC4lmP-UEDDWsNiPQm8MrSWnrEJxEccOJCjRurEXiS1TVyQqyf-pDZZdc6chBp8xU=', '2025-07-01 14:46:30', '2025-07-01 14:47:02');
INSERT INTO `riwayat_login_userbot` (`id`, `id_telegram`, `session_data`, `nomor_hp`, `otp_kode`, `two_fa`, `phone_code_hash`, `status`, `string_session`, `created_at`, `updated_at`) VALUES
(321, 6774207833, '{\"state\":null}', '+6288707021518', '36717', 'Nazira12#', '088e145f1e72369e8d', 'LOGGED_IN', '1BVtsOIUBu1fn-8IzWPoOMj_7wsGy4g7bir9h1jcc3H-xyG5zBRw-WQAnJlZrzEK22C5au92QTTcwqO8THKpmiFrSB2WFONd4-CaC86qi2QVh-v1SHr527qCjo_dfbLdAaVxXS9AihGnb5bUJzXF6yZ9FisTdZRqNK9q1WVr4qA67_-NF0vQU9mhhuhB5Nn3kdfFr-NrxDZiV6Ay-Eh8-SChWkI1gTptW-ZqsayAIlhmKTZJwMva6wUkTvhSVpJFeJs2GP2cHlF0BA8Ilq7D2VxHNsNDclgNnUfaQ5HyZ19ZYBFibpqM-VSUw_ok3QKZkcICcNN1kWsp8gZGVIIV7G0605YKAzT0=', '2025-07-01 14:48:00', '2025-07-04 12:57:57'),
(329, 6393742408, '{\"state\":null}', '+6288707021139', '58987', 'Nazira12#', 'cf75a7a5501ec18a55', 'LOGGED_IN', '1BVtsOIUBuyryKL36Nfp-U6WPymIFX6Y4-HTdBhDVy1VMC_8l2KVK7xOhEmNZS42QSoZlHE5_sDUjwROPCVIT8pv81fM6_PurwiNdbe-NS2fd5tld8GwJe4hr5KLnUA4J_5RzVX7BBpGp94nimqtFEXbQC3gD_Y8GyHea1M6egH1ws6PcEHTDNMXpefdWZ4M82brgxxKiIW4tio1nIVStXejVWewLrxknisZ-02gR9IGctSoxYYwORvHQN52q_SXmDYTTk1H2W2VTGUOaT8eWEDj56UG9C35idbBOvhBhTdwgAxNCSo7qqUjF-rudA7c64B2fXZCveuykqhgzjsGqYTp3BLRvEDQ=', '2025-07-01 14:49:38', '2025-07-04 15:48:56'),
(337, 6370259418, '{\"state\":null}', '+6288286969640', '34607', 'Nazira12#', '1696a14589b66b790d', 'LOGGED_IN', '1BVtsOIUBu6-meKFSYEiRXE18uHB1tDYt3SS2PJHxsnr0D9LRw04Jr7d6j2sh6K2jMO_SUKBhM1Vie3tpTDRspAdGEwojKIpzkghMgKv24Gfodqtg_zI_FGMDe2WAQbQIHnHqxn0dNdv-2DfWL0WNRHAlJkDYO2NQYtldPF3AaCF2E7mkrkRZjTnrjgu1lcXdoaemzdQmbx_nYfW2ho39RASgzCTmIx00921Jcsu75cQ5HRwXQhqUjpvy9Q8QqUdk0j4UO5ba_gH414OsWvSbzEkTudz4L2m3Xdn6nDyWUBUtbM5-M0PQwh6o-xMqTiKEfuBR3L8kAk1-lMJvBLbKSvzO3C_Ncc4=', '2025-07-01 15:01:17', '2025-07-04 12:18:19'),
(345, 6959371884, '{\"state\":\"KONFIRMASI_HAPUS_LIST\"}', '+6281362142068', '97850', 'Nazira12#', '2780305a07fd3caf94', 'LOGGED_IN', '1BVtsOHQBu7giHs9kcXbpR2jEm31rudVBh3QeW_nv26jhPb5YwQ9aahD5lzUPPwRWbb8XJfEwhUCw8h57fHHIhHXY4NgldCgLHKRgkcBcm0E-fQIYbgKepynVSbnqeJ9KNsCO5z4XvULzVyvkIUi9qKWjNtOpOOzrLP1nOrpc_fWbNjXbDjKitg83viKAEHOD-33k1UGgxvW3HSvPsTwuudNb2pTRfzGckFRl70NaZUXfpG3nNduOJ_APXStCvsUjJuK61xsKkzfxZTVP2t6ACR2ympnwLPcvh368ulleFJavkWjLp_s_-GnSYI604Lhiv3Zd_Hg8WyDjJXBw5DoB6L6Abm0vkbI=', '2025-07-04 10:31:51', '2025-07-08 01:31:55'),
(353, 6442416571, '{\"state\":null}', '+6283157297427', '27526', 'Userbot', 'ebd10237d83926d2fe', 'LOGGED_IN', '1BVtsOHQBu5NIlhin-eAvsbOlXtQ3NIDjrn2GvdL1bxNYGYq21EEQVs6PDGqTnZ6UrtH8mlKt2eTwqi3PBZKP6LrmRRHY0rSjG2uNg5E0P7msFp9I0BOBeKG-c6a6td1Q5fwqaR7ZkcZM3EK3ZcoVPPbEV4TqG6AkmLihhpPtJYo-R2TA6ZSSH99nL7nfv6nlthL6z54JSYINMGh-KGohC_52H1cqCDOqyPccLrMnBhSAcq0GK0d1D_WUYC4D3dNfSyyu6I9Z2qj1QVOJtlYDs_AM4seFcwBQZVRYfLID5Y9pA7JRzC6z3Q1lpWyc0KTgqk0pIrK_RzqU0yrqq235TONGkaluWe8=', '2025-07-05 03:11:08', '2025-07-05 03:17:35'),
(361, 6956727460, '{\"state\":null}', '+6281934074709', '58576', 'Userbot', '0ce51d93bb748b536a', 'LOGGED_IN', '1BVtsOHQBu8FYDtPuYDy_1UXCQ2Qdr4X_WpHIwiE__V-6qZ2PSBNPWAs6fbeAcJCzl4Pi_8xnMLJtDpOsGAeA9guSzhI8d1bk7xDRmc3rXeWG1-YRG9iq4yJ0vxr2lYBZZ6rjWy8EaEl0PY1RVa8YRdLUDmYQHxF76DGUXLEiebu7PR0OMEVA8qmjQPADb3e187w3MdCYIQWA8xO7KKUU_Kz4v3Z1DmW_g2WiWytD9qLhdqh0-jfyRlfJUii3rZPqPZzxc_BZhB7fTP2A6HLtaugatOII4DX2_K-NSS38Bn0vFMTP2f0ilEG8P9T78as-JAv63ZTfExxq1zg-AZEQ4rW4YdeWeOM=', '2025-07-05 05:41:27', '2025-07-09 02:01:10'),
(369, 8025389090, '{\"state\":null}', '+628892902280', '66360', NULL, '7c44e547f50b495122', 'LOGGED_IN', '1BVtsOHQBuxeLiY59M4-4yPJMAXuyRuudE1Rk05oGrXcOEAdBOflVyouZ5xikEtd2cb4NpHLm_PPXKNSrM1nmXr0WRVc0MWsAgVX_eEHOuQK5D0dG-DwjoDuD8p0WkNjyDhaOcUcqVj1Xx4dw_EF6KOPhwWqaHUHI2lEmxIZwFYmfQ8glinYGDvmGXHlF3_LhSxmWleibvzSTAKvvgmRwV3jx7Klao5-76pBki-PgQWu1lDxOUSRE7sLo11tVUIG3GgK3DqfU8VHG4mGyfoh5wRkuQLWzdz7Z90Za810VToT15QP72ISpSAFJ9D0x0iMybxNXM9NmZ0Bz7vkXP3uZyn__KwzGTyQ=', '2025-07-05 12:03:17', '2025-07-05 15:09:28'),
(376, 7710482938, '{\"step\":\"waiting_contact\",\"token\":\"TRIAL-7710482938\"}', NULL, NULL, NULL, NULL, NULL, NULL, '2025-07-05 14:16:59', '2025-07-05 14:17:02'),
(386, 5516649446, '1BVtsOHQBu7ZN6oUadJ1jH_og6mGfMMa6wTn1uy8dnM-M26o5J4WQUSYAM6b6xDj371FJqe77CFAcSbqwPlRtqUrZ-et50cM-GL58oLvHlbSmFvp2x1Ihwe-94desfS0eXiCe_wUPVb_O9fCdoTdMa3rXtRauXCW9vzgq0IocSUK-0WlD2cHxlTLvLUh3hfWFrI3tjFf5tqtXtRFFU2ogjYc6orOmQ880AAtbwejJrTXY6zu3eTKtbJLsgDxEcfoMJKZ-NY9sc1Zhha-Wwl9QfTgctfMNoLqiqxQdgCAbi8dLLWniJncRIfUITrxB3gA_e3dMC1cFB8YsouzSF4dlglWHYE9N3aI=', '+6282279478527', '95412', 'wann123', 'e4fc574e4c50ee928a', 'LOGGED_IN', '1BVtsOHQBu7ZN6oUadJ1jH_og6mGfMMa6wTn1uy8dnM-M26o5J4WQUSYAM6b6xDj371FJqe77CFAcSbqwPlRtqUrZ-et50cM-GL58oLvHlbSmFvp2x1Ihwe-94desfS0eXiCe_wUPVb_O9fCdoTdMa3rXtRauXCW9vzgq0IocSUK-0WlD2cHxlTLvLUh3hfWFrI3tjFf5tqtXtRFFU2ogjYc6orOmQ880AAtbwejJrTXY6zu3eTKtbJLsgDxEcfoMJKZ-NY9sc1Zhha-Wwl9QfTgctfMNoLqiqxQdgCAbi8dLLWniJncRIfUITrxB3gA_e3dMC1cFB8YsouzSF4dlglWHYE9N3aI=', '2025-07-05 14:23:57', '2025-07-05 14:25:08'),
(394, 5573206266, '1BVtsOHQBu61xpciTmlMUyXdcudA7wQ8aiyrRCAkqYFDNQaxPWTjR-5RYUeXdOL1mOdB4Mke5khf6AyGQ3jtH42EFDTcZtt_Nkj3Jp0z2h_t7XE5HyM4gFvOhOdYIfRN8ie6VDm0yAy-HlnkzV-NCvPC5t_zGkDeDYjjecSW6CmAjRnPxBHAvmvWA039boyu41Ua1rn2R0P6WyPSV7GTl97lJzwfX4Pvxoq1OYtTIDf8iK4KaSwQPurTeLN_oK4FJ0R5r7SmnW04xpdP-1MEGW8_kvvqD9Nzr7-NIdXgLJRFXECGnG3nsk8xF4cewdrJ91qgvrX04PwNwlrhJqmhUfaqqcLmWKMQ=', '+6285642163390', '43990', 'Magfira303030', 'da7e2f015024fe92f5', 'LOGGED_IN', '1BVtsOHQBu61xpciTmlMUyXdcudA7wQ8aiyrRCAkqYFDNQaxPWTjR-5RYUeXdOL1mOdB4Mke5khf6AyGQ3jtH42EFDTcZtt_Nkj3Jp0z2h_t7XE5HyM4gFvOhOdYIfRN8ie6VDm0yAy-HlnkzV-NCvPC5t_zGkDeDYjjecSW6CmAjRnPxBHAvmvWA039boyu41Ua1rn2R0P6WyPSV7GTl97lJzwfX4Pvxoq1OYtTIDf8iK4KaSwQPurTeLN_oK4FJ0R5r7SmnW04xpdP-1MEGW8_kvvqD9Nzr7-NIdXgLJRFXECGnG3nsk8xF4cewdrJ91qgvrX04PwNwlrhJqmhUfaqqcLmWKMQ=', '2025-07-05 17:51:28', '2025-07-05 17:54:11'),
(403, 6133411111, '{\"state\":\"KONFIRMASI_HAPUS_LIST\"}', '+6283875277345', '68373', 'Nazira12#', 'c26774003aadb8468b', 'LOGGED_IN', '1BVtsOHQBuzYSVKs35bHlKiZcINxYx67TBr6EriCFPy0E-NUQKF0z_Z6BtS_sZuxaTIEDk_qrtEIGfT4GBBdXfvEhgW7crJvtP5J6L6Yq8unZirig9AczsHMY9KG-VwnFQiNGaU8bKbkEzeWdtWglNfQvCtQMCmheQrjyei8k31fat_1DKSf9RHMCK-24XcSCt37mpe5NMYVRWSv42c8NXfSBTfw5JukbDz7p0qR8X7Bhb6nmz9Lo-6zlpN3oEFXUbdlUr3aefSbc9UVwODVjl9UvxbNdQqbUgB5-uyMFD8VqfLH3lkOKdGAmSv5hztj1kuYinQ7Y021pHTaUnGr7oaPlZcYhH3o=', '2025-07-06 02:46:09', '2025-07-07 05:49:28'),
(411, 6962189446, '1BVtsOHQBuw74fkgMeT561-mQsENR0ZQijZerLGqeQ0vcoARf1e42-PT2O5XxENIMOs13YPOCQCmAr492JCnF4o-PmJ2tIo3AAxpqrK3CormXAp8IdMlMoNtDwxIxm-tVtgbSEh8wHwEnE6-RprOTihg0flz-oS-F33zD1-yq8170sRkuXsM03nn2OC0jTwyqoK9K6n7mTuB6J0gbENXzOPyAYir6k95fRipDDC7HUBiLHonlEx_OhIVzLyvdNi3pfM5XEHi9I8KOcZKWsezjwoT5kqixLXC6Nh2ysX5sOfZWsKJ19_OzRSwpsdcROjHS8ZBi_wPEJRZTzBBz7NGuh1_B6jFwFdU=', '+6282296670458', '83460', 'Nazira12#', 'abc26f3ec45a91a0aa', 'LOGGED_IN', '1BVtsOHQBuw74fkgMeT561-mQsENR0ZQijZerLGqeQ0vcoARf1e42-PT2O5XxENIMOs13YPOCQCmAr492JCnF4o-PmJ2tIo3AAxpqrK3CormXAp8IdMlMoNtDwxIxm-tVtgbSEh8wHwEnE6-RprOTihg0flz-oS-F33zD1-yq8170sRkuXsM03nn2OC0jTwyqoK9K6n7mTuB6J0gbENXzOPyAYir6k95fRipDDC7HUBiLHonlEx_OhIVzLyvdNi3pfM5XEHi9I8KOcZKWsezjwoT5kqixLXC6Nh2ysX5sOfZWsKJ19_OzRSwpsdcROjHS8ZBi_wPEJRZTzBBz7NGuh1_B6jFwFdU=', '2025-07-06 02:49:41', '2025-07-06 02:51:46'),
(427, 6029616535, '1BVtsOHQBu5wKbPsq-yvq9dyO_WwxBvW9-xUiJ3_yiLQP0k2Ij_jGDotyf3D9BlB-DupeKFsOS3CIXDthxQEA-CrXJDqZ_Pja7iEmPKO0FxqV37VX9afEqJ1IrNSepp05r1EGU4t_AkeQOyK9zD4E3pNm3Uu3nUyzWqKIEUvEHQ7a6E4TUR74OI4X7-oPLIwga3prDrk6_Jn1U5qPDg-xmME4hjpObnpCT6SGeyIVXUPCqnvcaFDdfnni6KPt7FrFc_0FMtQMXFSwHcDCk6zVR1XGdpT5YKmZnEEbGr9Ir59yDRCfgCl67qkFmY28ZeDANZZZaUBu67cszPjFf73AlrSMjynwbjI=', '+6285602468736', '18263', 'Nazira12#', 'e17ae8f4cae0b5228a', 'LOGGED_IN', '1BVtsOHQBu5wKbPsq-yvq9dyO_WwxBvW9-xUiJ3_yiLQP0k2Ij_jGDotyf3D9BlB-DupeKFsOS3CIXDthxQEA-CrXJDqZ_Pja7iEmPKO0FxqV37VX9afEqJ1IrNSepp05r1EGU4t_AkeQOyK9zD4E3pNm3Uu3nUyzWqKIEUvEHQ7a6E4TUR74OI4X7-oPLIwga3prDrk6_Jn1U5qPDg-xmME4hjpObnpCT6SGeyIVXUPCqnvcaFDdfnni6KPt7FrFc_0FMtQMXFSwHcDCk6zVR1XGdpT5YKmZnEEbGr9Ir59yDRCfgCl67qkFmY28ZeDANZZZaUBu67cszPjFf73AlrSMjynwbjI=', '2025-07-07 09:28:35', '2025-07-07 09:29:09'),
(435, 1465113347, '{\"state\":null}', '+6287877077382', '81773', 'Userbot', '0997816e8c553c699f', 'LOGGED_IN', '1BVtsOHQBuxZwrbzSmQKbEI2W4ZAGGfY8Wk5AQTxo2wQslWU3a7OTm6Zg19mkAsDS1h-S2nIJyeP2ot9swybUZBcywyrUvo5I5LJI_sjZGqqQYdpNQ1LVlX5sIRyI7W0sych8qry4cd2tdyBiCh6FMRb7St4zt5QpveAtyaOT8GogmiklD4L8kR1CqLfeu8NzK2sd9s8m2HLAnpq4ZG49RHwGp_vTvVWODmb-qehhwMImilvQNrBLy0XvWghWWC78TAgihRLNjRfTmtCx4KS6HkbLiVQE4-0Uk2eNdFEF2FDnawIeosiDUXGWJyBhk55boPBZ8hbO8LegxGU8dg4KZaI8kC8SytA=', '2025-07-07 15:12:42', '2025-07-07 15:31:30'),
(443, 6864994300, '1BVtsOHMBu2cJLeSWSMHwoCyG9FHtN0wU4BnPR1PsHRx5nTMaVFuXhH8jkW4PUkAIlBmPXnqXaYBWWHkRwYl3OAXZzSeFUZBaRbv7TSFIKxKu89QmFdI5YmTy-SOV2gfv2LKfA5gv6p9OO-hbXhX-3Pg2lD6_GkFVoqmKsvVxxE4EJ6Z1a_SZxdZiUIkcCUiW5gZIoEFZEeA5avfFwLLajCZlsSgs8CC8jYYA8pspaU3ypOkkAfcu5lpua47gQ1YbPUSVIG_WNHdN7bpOttJJFNbmIZ_CEguz5wgxmUT2YU15lDxFS667RQeamsb87xCZjNJz7zt29uKZo9OFuj2xnV_8a30-jXs=', '+6281573292499', '22940', 'Nazira12#', '56d4daccf395e639cc', 'LOGGED_IN', '1BVtsOHMBu2cJLeSWSMHwoCyG9FHtN0wU4BnPR1PsHRx5nTMaVFuXhH8jkW4PUkAIlBmPXnqXaYBWWHkRwYl3OAXZzSeFUZBaRbv7TSFIKxKu89QmFdI5YmTy-SOV2gfv2LKfA5gv6p9OO-hbXhX-3Pg2lD6_GkFVoqmKsvVxxE4EJ6Z1a_SZxdZiUIkcCUiW5gZIoEFZEeA5avfFwLLajCZlsSgs8CC8jYYA8pspaU3ypOkkAfcu5lpua47gQ1YbPUSVIG_WNHdN7bpOttJJFNbmIZ_CEguz5wgxmUT2YU15lDxFS667RQeamsb87xCZjNJz7zt29uKZo9OFuj2xnV_8a30-jXs=', '2025-07-08 08:05:36', '2025-07-08 08:07:14'),
(451, 6424289693, '1BVtsOHMBuwvyNUoXX-1WQQLmR6z-1y8g4zn282c6fhz49iaBncFEDSZ1FGAlWB8LdENLP6r8EuP1gCayWs08pOaXySYwu7rkFzhACJYKE2vJ2oaxzrImQt-F_qp2WfJRfGnc5thnMJnomRZO0vVD_mewixaqj4KsHXz0URlZjxo_dQG70HLG0hpfoR7nU3Q7xi_1kksUhXj6YhJqb-fScJaDNYXN5W8HRyy80ucLPzTo9qC9srm8YYM55yFmP6QPglSM77Pqfk1n8WamWd_mNyXGDcoFSR38Ga7n3SgTMwFOD0Giv13JogGUzrBnPLCoXucpBxL8o_mr0FYYPDrpt75l7AU5ebU=', '+6285882100833', '12527', 'Nazira12#', 'e9b095c4f7d4e5d9e4', 'LOGGED_IN', '1BVtsOHMBuwvyNUoXX-1WQQLmR6z-1y8g4zn282c6fhz49iaBncFEDSZ1FGAlWB8LdENLP6r8EuP1gCayWs08pOaXySYwu7rkFzhACJYKE2vJ2oaxzrImQt-F_qp2WfJRfGnc5thnMJnomRZO0vVD_mewixaqj4KsHXz0URlZjxo_dQG70HLG0hpfoR7nU3Q7xi_1kksUhXj6YhJqb-fScJaDNYXN5W8HRyy80ucLPzTo9qC9srm8YYM55yFmP6QPglSM77Pqfk1n8WamWd_mNyXGDcoFSR38Ga7n3SgTMwFOD0Giv13JogGUzrBnPLCoXucpBxL8o_mr0FYYPDrpt75l7AU5ebU=', '2025-07-08 08:09:59', '2025-07-08 08:10:34'),
(459, 1634488893, '1BVtsOHMBuz20qBssPuEEVH8diHn-h_PGswyMLQ_8RuKUD2j3FdbwLtE-88asNiYm_gdVAQJdPFCrsARaMtF02eGsm80DCGKZMoc2OuZVGc5gZgAVxDePqTTRuwfCR41yYHsKLSND49QdlNzlp4Kfd1RXyufm2SmofSpQBtZIGnbVn51cZfeuWHsxZ6REVadaLWhwp5Bnbu6nGxdjIavJXdxa_vtd0RcdC61OXpHZk2cBwmN8nQRFIyRb9f8TfidOmF4LvOfhJYKigG4xD__M5dz8LBqA6JjGFVE71-fFzgxMf8bniOqlMfF0iCq28IICD3itA0yvNs98PJ7Hv05IpJx4_7AphNs=', '+6283897485954', '73308', 'Userbot', '2dfaa2ab3219cc28db', 'LOGGED_IN', '1BVtsOHMBuz20qBssPuEEVH8diHn-h_PGswyMLQ_8RuKUD2j3FdbwLtE-88asNiYm_gdVAQJdPFCrsARaMtF02eGsm80DCGKZMoc2OuZVGc5gZgAVxDePqTTRuwfCR41yYHsKLSND49QdlNzlp4Kfd1RXyufm2SmofSpQBtZIGnbVn51cZfeuWHsxZ6REVadaLWhwp5Bnbu6nGxdjIavJXdxa_vtd0RcdC61OXpHZk2cBwmN8nQRFIyRb9f8TfidOmF4LvOfhJYKigG4xD__M5dz8LBqA6JjGFVE71-fFzgxMf8bniOqlMfF0iCq28IICD3itA0yvNs98PJ7Hv05IpJx4_7AphNs=', '2025-07-08 14:03:16', '2025-07-08 14:03:56'),
(467, 6850067621, '{\"state\":null}', '+6283867433082', '62235', 'Userbot', 'a43b58f77417dd9167', 'LOGGED_IN', '1BVtsOHMBuwbnF2XfZr0udVCwLdHatlr7EgeqiQvYAOotX0wy4jcXWt7cm9u-LlAQ_C9P4LNdRGK1NUjDfVtMVqMDV1c-h9RkxKtHsMEOwuOWiqI9Gsliazna1l4g1aBelD88BD4tDvGkrIARcayn-p2Im86gSRmMU3txFPFnIZP3tXwbdNl8IjnLADCzrGHh6-m-AiBB2tGbvH8n0pFcQ7tRrzEqk-J44-LAx2cLDZIhzA6Wi1BwsxL88qJS3THmRornbylBxNc7Vo3DmpKtZ56LGPPgF0ffsf2hOVYbIYH9iIkJfR-UwFarzpWC4okcoeCd_Y-huRvBabta5UBZsS-D47iMOe4=', '2025-07-09 02:35:55', '2025-07-09 02:55:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `riwayat_trial_userbot`
--

CREATE TABLE `riwayat_trial_userbot` (
  `id` int(11) NOT NULL,
  `id_telegram` bigint(20) NOT NULL,
  `waktu_trial` datetime NOT NULL,
  `akhir_trial` datetime NOT NULL,
  `status_trial` enum('aktif','nonaktif') NOT NULL DEFAULT 'aktif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `riwayat_trial_userbot`
--

INSERT INTO `riwayat_trial_userbot` (`id`, `id_telegram`, `waktu_trial`, `akhir_trial`, `status_trial`) VALUES
(1, 7805357777, '2025-06-14 08:29:37', '2025-06-15 08:29:37', 'aktif'),
(2, 7096024891, '2025-06-14 08:49:03', '2025-06-15 08:49:03', 'aktif'),
(3, 6153847250, '2025-06-14 12:05:52', '2025-06-15 12:05:52', 'aktif'),
(4, 8192868417, '2025-06-19 20:52:06', '2025-06-20 20:52:06', 'aktif'),
(5, 7883986243, '2025-06-21 15:29:06', '2025-06-22 15:29:06', 'aktif'),
(6, 6390088412, '2025-06-22 22:28:19', '2025-06-23 22:28:19', 'aktif'),
(8, 6608403305, '2025-06-27 00:46:30', '2025-06-28 00:46:30', 'aktif'),
(9, 7871476158, '2025-06-27 22:08:05', '2025-06-28 22:08:05', 'aktif'),
(10, 1831828481, '2025-06-28 13:14:22', '2025-06-29 13:14:22', 'aktif'),
(11, 6127835086, '2025-06-28 19:32:19', '2025-06-29 19:32:19', 'aktif'),
(12, 8134066267, '2025-06-29 11:40:22', '2025-06-30 11:40:22', 'aktif'),
(13, 8025389090, '2025-07-05 19:01:35', '2025-07-06 19:01:35', 'aktif'),
(14, 7710482938, '2025-07-05 21:16:21', '2025-07-06 21:16:21', 'aktif'),
(15, 5516649446, '2025-07-05 21:22:24', '2025-07-06 21:22:24', 'aktif'),
(16, 5573206266, '2025-07-06 00:49:49', '2025-07-07 00:49:49', 'aktif'),
(17, 7352747225, '2025-07-06 00:57:21', '2025-07-07 00:57:21', 'aktif');

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings_autoresponder`
--

CREATE TABLE `settings_autoresponder` (
  `id` int(11) NOT NULL,
  `id_telegram` bigint(20) NOT NULL,
  `teks_balasan` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 0,
  `jadwal_aktif` varchar(20) DEFAULT '00:00-23:59',
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `settings_autoresponder`
--

INSERT INTO `settings_autoresponder` (`id`, `id_telegram`, `teks_balasan`, `status`, `jadwal_aktif`, `updated_at`) VALUES
(1, 5232338001, '┏━━━━━━━━━━━━━━━━━━━━━━━┓\n  ✨ JASAKY – Solusi Digital Profesional\n┗━━━━━━━━━━━━━━━━━━━━━━━┛\n\n📩 Terima kasih atas pesan Anda.  \nJASAKY adalah mitra digital untuk Anda yang membutuhkan solusi berbasis bot, web, server, atau sistem otomatisasi profesional.\n\n🔧 Layanan Unggulan:\n• Bot Telegram & AutoResponder  \n• Web & Dashboard Bisnis  \n• Server VPS & Integrasi API  \n• Infrastruktur & Audit Keamanan\n\n━━━━━━━━━━━━━━━━━━━━━━━\n📡 CHANNEL & PLATFORM:\n📢 Utama       → @JASAKY_ID  \n💬 Forum       → @JASAKY_FORUM  \n📄 Transaksi   → @JASAKY_TRANSAKSI  \n🔔 Notifikasi  → @JASAKY_NOTIFIKASI  \n\n🤖 BOT:\nUserbot → @JASAKY_UBOT  \nAutoReply→@JASAKY_AUTORESPONBOT\n\n👨‍💻 Founder: @RLYNCHX\n🌐 Website: www.jasaky.cloud  \n━━━━━━━━━━━━━━━━━━━━━━━\n\n💬 Kami akan merespons pesan Anda secepat mungkin.', 1, '00:00-23:59', '2025-07-07 17:36:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings_userbot`
--

CREATE TABLE `settings_userbot` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username_bot` varchar(50) NOT NULL,
  `username_pemilik` varchar(50) NOT NULL,
  `lisensi_paket` enum('JASAKY-UBOT LITE','JASAKY-UBOT PREMIUM','JASAKY-UBOT VIP','JASAKY-UBOT VVIP') NOT NULL DEFAULT 'JASAKY-UBOT LITE',
  `harga_member` int(10) NOT NULL DEFAULT 0,
  `harga_jaseb` int(10) NOT NULL DEFAULT 0,
  `harga_vip` int(10) NOT NULL DEFAULT 0,
  `harga_sewa_admin` int(10) NOT NULL DEFAULT 0,
  `harga_lifetime_admin` int(10) NOT NULL DEFAULT 0,
  `harga_kontrol_akun` int(10) NOT NULL DEFAULT 0,
  `harga_slot_sewa` int(10) NOT NULL DEFAULT 0,
  `harga_upgrade_akun` int(11) NOT NULL DEFAULT 0,
  `teks_start` mediumtext DEFAULT '⚠️ Teks Start belum diatur. Harap atur teks ini lewat menu ADMINISTRATOR ➤ Pengaturan Bot.',
  `teks_home` mediumtext DEFAULT '\'⚠️ Teks Home belum diatur. Harap atur teks ini lewat menu ADMINISTRATOR ➤ Pengaturan Bot.\'',
  `teks_hargalayanan` mediumtext DEFAULT '⚠️ Teks Harga & Layanan belum diatur. Harap atur teks ini lewat menu ADMINISTRATOR ➤ Pengaturan Bot.',
  `teks_panduan_login` mediumtext DEFAULT '\'⚠️ Teks Panduan Login belum diatur. Harap atur teks ini lewat menu ADMINISTRATOR ➤ Pengaturan Bot.\'',
  `teks_trial` mediumtext DEFAULT '⚠️ Teks Trial belum diatur. Harap atur teks ini lewat menu ADMINISTRATOR ➤ Pengaturan Bot.',
  `teks_panduan_fitur` mediumtext DEFAULT '\'⚠️ Teks Panduan Fitur belum diatur. Harap atur teks ini lewat menu ADMINISTRATOR ➤ Pengaturan Bot.\'',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `settings_userbot`
--

INSERT INTO `settings_userbot` (`id`, `username_bot`, `username_pemilik`, `lisensi_paket`, `harga_member`, `harga_jaseb`, `harga_vip`, `harga_sewa_admin`, `harga_lifetime_admin`, `harga_kontrol_akun`, `harga_slot_sewa`, `harga_upgrade_akun`, `teks_start`, `teks_home`, `teks_hargalayanan`, `teks_panduan_login`, `teks_trial`, `teks_panduan_fitur`, `created_at`, `updated_at`) VALUES
(1, 'jasaky_ubot', 'rlynchx', 'JASAKY-UBOT VVIP', 0, 0, 0, 0, 0, 0, 0, 0, '⚠️ Teks Start belum diatur. Harap atur teks ini lewat menu ADMINISTRATOR ➤ Pengaturan Bot.', '⚠️ Teks Welcome belum diatur. Harap atur teks ini lewat menu ADMINISTRATOR ➤ Pengaturan Bot.', '⚠️ Teks Harga & Layanan belum diatur. Harap atur teks ini lewat menu ADMINISTRATOR ➤ Pengaturan Bot.', '⚠️ Teks Bantuan belum diatur. Harap atur teks ini lewat menu ADMINISTRATOR ➤ Pengaturan Bot.', '⚠️ Teks Trial belum diatur. Harap atur teks ini lewat menu ADMINISTRATOR ➤ Pengaturan Bot.', '⚠️ Teks Informasi Penggunaan belum diatur. Harap atur teks ini lewat menu ADMINISTRATOR ➤ Pengaturan Bot.', '2025-07-09 15:37:39', '2025-07-10 05:42:18');

-- --------------------------------------------------------

--
-- Struktur dari tabel `status_sebar_userbot`
--

CREATE TABLE `status_sebar_userbot` (
  `id` int(11) NOT NULL,
  `id_telegram` bigint(20) NOT NULL,
  `id_sebar` int(255) NOT NULL,
  `jeda_kirim` decimal(10,2) DEFAULT NULL,
  `timer_aktif` varchar(255) DEFAULT NULL,
  `status` enum('aktif','jeda','nonaktif') DEFAULT 'nonaktif',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `token_login_autoresponder`
--

CREATE TABLE `token_login_autoresponder` (
  `id` int(11) NOT NULL,
  `token` varchar(64) NOT NULL,
  `id_telegram` bigint(20) DEFAULT NULL,
  `sudah_dipakai` tinyint(1) DEFAULT 0,
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp(),
  `kadaluarsa_pada` timestamp NULL DEFAULT NULL,
  `level` varchar(20) DEFAULT 'AUTORESPONDER JASAKY',
  `coin` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `token_login_autoresponder`
--

INSERT INTO `token_login_autoresponder` (`id`, `token`, `id_telegram`, `sudah_dipakai`, `dibuat_pada`, `kadaluarsa_pada`, `level`, `coin`) VALUES
(53, '5d24361bea8080ceeb6a5a2a410e7744d66244c3f5d097555051842800e0c1d5', 5232338001, 1, '2025-07-05 09:11:18', '2026-07-05 09:11:18', 'AUTORESPONDER JASAKY', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `token_login_userbot`
--

CREATE TABLE `token_login_userbot` (
  `id` int(11) NOT NULL,
  `token` varchar(64) NOT NULL,
  `id_telegram` bigint(20) DEFAULT NULL,
  `pembuat_token` varchar(50) NOT NULL DEFAULT 'JASAKY_ID',
  `sudah_dipakai` tinyint(1) DEFAULT 0,
  `dibuat_pada` timestamp NOT NULL DEFAULT current_timestamp(),
  `kadaluarsa_pada` timestamp NULL DEFAULT NULL,
  `level` varchar(20) DEFAULT 'MEMBER',
  `coin` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `token_login_userbot`
--

INSERT INTO `token_login_userbot` (`id`, `token`, `id_telegram`, `pembuat_token`, `sudah_dipakai`, `dibuat_pada`, `kadaluarsa_pada`, `level`, `coin`) VALUES
(1, '1fff210946ff68d4a34778adc14e28b8f045e6bb8f83cf9446a5adb8ad107d86', 1276582149, 'JASAKY_ID', 1, '2025-06-05 14:42:50', '2026-10-18 14:42:50', 'VIP', 0),
(2, '38e8ee2c90b3d7e1c37323a8440524d77e7e41339b27c95b7e6337ac0ef6ba47', 6547014546, 'JASAKY_ID', 1, '2025-06-13 05:39:54', '2027-08-22 05:39:54', 'VIP', 0),
(3, 'TRIAL-7805357777', 7805357777, 'JASAKY_ID', 1, '2025-06-14 01:29:37', '2025-06-15 01:29:37', 'MEMBER', 0),
(4, 'TRIAL-7096024891', 7096024891, 'JASAKY_ID', 1, '2025-06-14 01:49:03', '2025-06-15 01:49:03', 'MEMBER', 0),
(6, '89ba063ff0b3baadbaec95d5b34ba96d8473356774cb79efa0bd0deb5ce6541e', 6520896223, 'JASAKY_ID', 1, '2025-06-14 10:17:03', '2025-07-14 10:17:03', 'VIP', 0),
(12, '111787237c1ec1d92057ae1c21a9fe9d5699f009a93835d731696f244e8b0ae2', 8192868417, 'Najwanthabrani', 1, '2025-06-21 05:30:07', '2028-03-17 05:30:07', 'VIP', 0),
(13, 'TRIAL-7883986243', 7883986243, 'JASAKY_ID', 0, '2025-06-21 08:29:06', '2025-06-22 08:29:06', 'MEMBER', 0),
(15, '7d87e24a54285e291b20a3ec1213cd301e1dce7e5308ff6d9d509ebb90e52387', 6652995912, 'Najwanthabrani', 1, '2025-06-21 15:03:56', '2028-03-17 15:03:56', 'VIP', 0),
(16, '9722911270a76634e1bc79550fdf8795dce53a0d8c5501ae55bd1376f732cf76', 6881366874, 'Najwanthabrani', 1, '2025-06-22 01:45:32', '2028-03-18 01:45:32', 'VIP', 0),
(17, 'd517f82ca3cf3c461ab72890b161006363f1bd9eeec1fd64cf44beb41f7a79e8', 6988431552, 'Najwanthabrani', 1, '2025-06-22 01:49:03', '2028-03-18 01:49:03', 'VIP', 0),
(18, 'TRIAL-6390088412', 6390088412, 'JASAKY_ID', 1, '2025-06-22 15:28:19', '2025-06-23 15:28:19', 'MEMBER', 0),
(19, '029aa30421ccfb2088106fa2d4c456147e5c407a8620fa6093c93382d24ea135', 8032949049, 'Najwanthabrani', 1, '2025-06-23 05:47:24', '2028-03-19 05:47:24', 'VIP', 0),
(20, 'e27178034b75e0809a2ce934a4e602e71777d2759870d91300a906861955d780', 7922721952, 'Najwanthabrani', 1, '2025-06-23 05:49:58', '2028-03-19 05:49:58', 'VIP', 0),
(21, '9835f3bfec062ba25d8c68a10e80b1233cd978d59e823867a706c923255004bc', 7885854625, 'Najwanthabrani', 1, '2025-06-24 02:33:23', '2028-03-20 02:33:23', 'VIP', 0),
(22, '97a891a6be1c4e1347f8e1f6099cd4c4fad59c5ad5d4b954d0c03c865a5036b6', 7878068373, 'Najwanthabrani', 1, '2025-06-24 02:36:28', '2028-03-20 02:36:28', 'VIP', 0),
(24, 'TRIAL-6608403305', 6608403305, 'JASAKY_ID', 1, '2025-06-26 17:46:30', '2025-06-27 17:46:30', 'MEMBER', 0),
(25, 'aae0bb14fc963e11f75971ac8668afe14fe8975ebe537355b02fb973b05890d1', NULL, 'JASAKY_ID', 0, '2025-06-27 01:20:02', '2025-06-28 01:20:02', 'VIP', 0),
(26, '55d254efa78618f6dee99bc5bd5d02e8c4a2af69036fbfedb36d492747883d67', 6999164406, 'Dddhjjjjo', 1, '2025-06-27 08:30:03', '2030-12-18 08:30:03', 'VIP', 0),
(28, 'TRIAL-7871476158', 7871476158, 'JASAKY_ID', 0, '2025-06-27 15:08:05', '2025-06-28 15:08:05', 'MEMBER', 0),
(29, '139b419ff73459a5deeb14ae98f9fae8e68fd2346e900c146ba8048948793c81', 6810495656, 'Dddhjjjjo', 1, '2025-06-28 02:54:49', '2030-12-19 02:54:49', 'VIP', 0),
(30, 'c9304f0051497f01648148d32056026190b70ed4a7d3723bbe9b8ad3220b10d6', 6215162920, 'Dddhjjjjo', 1, '2025-06-28 06:08:01', '2030-12-19 06:08:01', 'VIP', 0),
(31, 'TRIAL-1831828481', 1831828481, 'JASAKY_ID', 0, '2025-06-28 06:14:22', '2025-06-29 06:14:22', 'MEMBER', 0),
(32, '8556c27c14c59978beb8ba879138577717629987344738195aaba95f1dc36abc', 6959810084, 'Dddhjjjjo', 1, '2025-06-28 08:55:01', '2030-12-19 08:55:01', 'VIP', 0),
(33, 'TRIAL-6127835086', 6959527987, 'JASAKY_ID', 1, '2025-06-28 12:32:19', '2025-06-29 12:32:19', 'MEMBER', 0),
(34, '8c80654c9cc6927b729654e86d393a88fc2daa2d6ee7a1d50390ce4984782fbf', 6877496761, 'Dddhjjjjo', 1, '2025-06-28 13:46:27', '2030-12-19 13:46:27', 'VIP', 0),
(35, 'TRIAL-8134066267', 8134066267, 'JASAKY_ID', 0, '2025-06-29 04:40:22', '2025-06-30 04:40:22', 'MEMBER', 0),
(36, 'f304f7f413fd69f0dcb85e99463519ad8e37aff062d043d39bbdba2b713fd7e0', 6705361013, 'Dddhjjjjo', 1, '2025-06-29 14:35:55', '2030-12-20 14:35:55', 'VIP', 0),
(37, 'd37cbd047fb51e8d7a225d5beb52cbc3bba9203179b79e38c953984396aa97b8', 6579026716, 'Dddhjjjjo', 1, '2025-06-29 14:54:31', '2030-12-20 14:54:31', 'VIP', 0),
(39, '80dea3f4d619cfd56544c2a4d667af13f3e4ece50048b3aac36eb482ffbf39b4', 7688276810, 'Dddhjjjjo', 1, '2025-06-30 13:46:58', '2030-12-21 13:46:58', 'VIP', 0),
(40, 'c4905d6ccd636be0755050b5bcd2af4e452440224678c76836b403aed73d4599', 6856151865, 'Najwanthabrani', 1, '2025-07-01 04:35:11', '2028-03-27 04:35:11', 'VIP', 0),
(41, 'df25b5e20046c96ce9e27168924ca4d7263aa855c85a8e9c5577e20ea21b41b6', 6725059513, 'Najwanthabrani', 1, '2025-07-01 14:36:03', '2028-03-27 14:36:03', 'VIP', 0),
(42, 'fd3752c9a66ed1ce7d1e8caf8a10693390c6e989f2ca840b3220bce687eb0ab7', 6593529004, 'Najwanthabrani', 1, '2025-07-01 14:39:58', '2028-03-27 14:39:58', 'VIP', 0),
(43, 'df459a445ecc98a83f619859ea991f01c61a6de4b41e8eaa16d6d9e0191075db', 6718097405, 'Najwanthabrani', 1, '2025-07-01 14:41:58', '2028-03-27 14:41:58', 'VIP', 0),
(44, 'fd4096060e968ce860b6d9fa856078609badb7747d3da904bac8362acfa784d7', 6738790516, 'Najwanthabrani', 1, '2025-07-01 14:43:26', '2028-03-27 14:43:26', 'VIP', 0),
(45, '8347c87a29d971bff512469ae43ae7cbada9ca0e02ac7ca786ce0d0f44af4fb6', NULL, 'JASAKY_ID', 0, '2025-07-01 14:45:35', '2025-07-02 14:45:35', 'VIP', 0),
(46, '8c1845f2b7eb07254f04eb2106f721f4c9a7d7aef8d181c51d50e6d992bcbb1d', 6319563004, 'Najwanthabrani', 1, '2025-07-01 14:45:55', '2028-03-27 14:45:55', 'VIP', 0),
(47, 'a78bb5801332cea3b0e03932d356db8ac76550ed379f483f84ec36aedd2cde4e', 6774207833, 'Najwanthabrani', 1, '2025-07-01 14:47:38', '2028-03-27 14:47:38', 'VIP', 0),
(48, 'b5917518a334910448528524d0fc25a317ddddad7710fad2a402228bb17f85fd', 6393742408, 'Najwanthabrani', 1, '2025-07-01 14:49:07', '2028-03-27 14:49:07', 'VIP', 0),
(49, '02a4682b52f8f0a65289952282b7352395d81b8099428535808308899def7de0', 6370259418, 'Najwanthabrani', 1, '2025-07-01 15:00:05', '2028-03-27 15:00:05', 'VIP', 0),
(50, 'bcd3b4337d8cf15db460b6cecd2d81425b7e2310c88e712cd57325f1c48393c0', 6959371884, 'Najwanthabrani', 1, '2025-07-04 10:30:21', '2028-03-30 10:30:21', 'VIP', 0),
(51, '517c71d1c348df6a9a6c6831ded161f3a4f681702fe1d2e3f451c90643cada3e', 6442416571, 'Dddhjjjjo', 1, '2025-07-05 03:10:32', '2030-12-26 03:10:32', 'VIP', 0),
(52, '2d6686e0496c088f8de302a39a7c3a5da458e3e3d5a46dd01582da07f66b7251', 6956727460, 'Dddhjjjjo', 1, '2025-07-05 05:40:36', '2030-12-26 05:40:36', 'VIP', 0),
(53, 'TRIAL-8025389090', 8025389090, 'JASAKY_ID', 1, '2025-07-05 12:01:35', '2025-07-06 12:01:35', 'MEMBER', 0),
(54, 'TRIAL-7710482938', 7710482938, 'JASAKY_ID', 0, '2025-07-05 14:16:21', '2025-07-06 14:16:21', 'MEMBER', 0),
(55, 'TRIAL-5516649446', 5516649446, 'JASAKY_ID', 1, '2025-07-05 14:22:24', '2025-07-06 14:22:24', 'MEMBER', 0),
(56, 'TRIAL-5573206266', 5573206266, 'JASAKY_ID', 1, '2025-07-05 17:49:49', '2025-07-06 17:49:49', 'MEMBER', 0),
(57, 'TRIAL-7352747225', 7352747225, 'JASAKY_ID', 0, '2025-07-05 17:57:21', '2025-07-06 17:57:21', 'MEMBER', 0),
(58, '1b456e94b5c81e347dbf9fcf7a7f67aaf28e215afc03759f19beea4ececd189b', 6133411111, 'Najwanthabrani', 1, '2025-07-06 02:43:19', '2028-04-01 02:43:19', 'VIP', 0),
(59, '56253826fd1f765f6650e51a45626e32a504a221a281b6bccd2446eabbdf1c33', 6962189446, 'Najwanthabrani', 1, '2025-07-06 02:49:01', '2028-04-01 02:49:01', 'VIP', 0),
(61, '6f98a2a59bdb3d321b1896223bd328c3b7d782fdcd200a69005be2645e0dfd2c', 6029616535, 'Najwanthabrani', 1, '2025-07-07 09:27:39', '2028-04-02 09:27:39', 'VIP', 0),
(62, '3d2f4c08a7df31842b7d83e7ce99d9fc7991db48e87eedff4a5787f15acd4b4f', 1465113347, 'Dddhjjjjo', 1, '2025-07-07 15:11:47', '2030-12-28 15:11:47', 'VIP', 0),
(63, '396b3fa9029204fd5e3f3f1555eb1442758ab8447ef8334a5683fbeeb278bc25', 6864994300, 'Najwanthabrani', 1, '2025-07-08 08:04:15', '2028-04-03 08:04:15', 'VIP', 0),
(64, 'a3247e17c85c7a434daac6e9aa71331b97e3c246febbf994333c9e68d71bdba0', 6424289693, 'Najwanthabrani', 1, '2025-07-08 08:09:18', '2028-04-03 08:09:18', 'VIP', 0),
(65, '2ff7da47f0dbf23046c22099a685415f822b12f0b9e049c375955c282d4daa7e', 1634488893, 'Dddhjjjjo', 1, '2025-07-08 14:02:32', '2030-12-29 14:02:32', 'VIP', 0),
(66, '773f5951790f28216e229101ce5bf9bed4628ff08a28ac379b6a4fe591f45e01', 6850067621, 'Dddhjjjjo', 1, '2025-07-09 02:35:03', '2030-12-30 02:35:03', 'VIP', 0);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_tripay_userbot`
--

CREATE TABLE `transaksi_tripay_userbot` (
  `id` int(11) NOT NULL,
  `reference` varchar(100) NOT NULL,
  `id_telegram` bigint(20) DEFAULT NULL,
  `produk_label` varchar(100) DEFAULT NULL,
  `tipe` varchar(20) DEFAULT NULL,
  `metode` varchar(50) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi_tripay_userbot`
--

INSERT INTO `transaksi_tripay_userbot` (`id`, `reference`, `id_telegram`, `produk_label`, `tipe`, `metode`, `amount`, `status`, `customer_name`, `created_at`, `updated_at`) VALUES
(1, 'DEV-T415942463193FD57', 5232338001, 'Token VIP (25 coin)', 'token', 'QRIS', 10000, 'PAID', 'Pengguna 5232338001', '2025-06-15 08:43:00', '2025-06-15 09:58:14'),
(2, 'DEV-T41594246433OI7G9', 5232338001, 'Token JASEB (25 coin)', 'token', 'QRIS', 10000, 'PAID', 'Pengguna 5232338001', '2025-06-15 11:59:55', '2025-06-15 12:00:47'),
(3, 'DEV-T41594248972ZETXA', 7883986243, 'Token JASEB (25 coin)', 'token', 'QRIS', 10000, 'UNPAID', 'Pengguna 7883986243', '2025-06-22 13:19:49', '2025-06-22 13:19:49'),
(4, 'DEV-T41594253796FKOF8', 7606748186, 'Token JASEB (25 coin)', 'token', 'QRIS', 10000, 'UNPAID', 'Pengguna 7606748186', '2025-07-04 12:00:32', '2025-07-04 12:00:32'),
(5, 'DEV-T41594255692IHYUW', 8025389090, 'Token JASEB (25 coin)', 'token', 'QRIS', 10000, 'UNPAID', 'Pengguna 8025389090', '2025-07-08 08:22:54', '2025-07-08 08:22:54');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin_autoresponder`
--
ALTER TABLE `admin_autoresponder`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_telegram` (`id_telegram`);

--
-- Indeks untuk tabel `admin_userbot`
--
ALTER TABLE `admin_userbot`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_telegram` (`id_telegram`);

--
-- Indeks untuk tabel `coin_tamu_userbot`
--
ALTER TABLE `coin_tamu_userbot`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `grup_sebar_userbot`
--
ALTER TABLE `grup_sebar_userbot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_telegram` (`id_telegram`);

--
-- Indeks untuk tabel `kontrol_akun_userbot`
--
ALTER TABLE `kontrol_akun_userbot`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_telegram` (`id_telegram`);

--
-- Indeks untuk tabel `kontrol_sessions_userbot`
--
ALTER TABLE `kontrol_sessions_userbot`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_pengontrol` (`id_telegram_pengontrol`);

--
-- Indeks untuk tabel `list_kontrol_userbot`
--
ALTER TABLE `list_kontrol_userbot`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_telegram` (`id_telegram`);

--
-- Indeks untuk tabel `list_sebar_userbot`
--
ALTER TABLE `list_sebar_userbot`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `notifikasi_userbot`
--
ALTER TABLE `notifikasi_userbot`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `owner_userbot`
--
ALTER TABLE `owner_userbot`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_telegram` (`id_telegram`);

--
-- Indeks untuk tabel `pending_kontrol_userbot`
--
ALTER TABLE `pending_kontrol_userbot`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengaturan_watermark_autoresponder`
--
ALTER TABLE `pengaturan_watermark_autoresponder`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengaturan_watermark_userbot`
--
ALTER TABLE `pengaturan_watermark_userbot`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengguna_autoresponder`
--
ALTER TABLE `pengguna_autoresponder`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_telegram` (`id_telegram`);

--
-- Indeks untuk tabel `pengguna_userbot`
--
ALTER TABLE `pengguna_userbot`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_telegram` (`id_telegram`);

--
-- Indeks untuk tabel `pengunjung`
--
ALTER TABLE `pengunjung`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_telegram` (`id_telegram`);

--
-- Indeks untuk tabel `referal_userbot`
--
ALTER TABLE `referal_userbot`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_referal` (`kode_referal`);

--
-- Indeks untuk tabel `riwayat_login_autoresponder`
--
ALTER TABLE `riwayat_login_autoresponder`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `telegram_id` (`id_telegram`),
  ADD UNIQUE KEY `telegram_id_2` (`id_telegram`);

--
-- Indeks untuk tabel `riwayat_login_userbot`
--
ALTER TABLE `riwayat_login_userbot`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `telegram_id` (`id_telegram`),
  ADD UNIQUE KEY `telegram_id_2` (`id_telegram`);

--
-- Indeks untuk tabel `riwayat_trial_userbot`
--
ALTER TABLE `riwayat_trial_userbot`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_telegram` (`id_telegram`);

--
-- Indeks untuk tabel `settings_autoresponder`
--
ALTER TABLE `settings_autoresponder`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_telegram` (`id_telegram`);

--
-- Indeks untuk tabel `settings_userbot`
--
ALTER TABLE `settings_userbot`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `status_sebar_userbot`
--
ALTER TABLE `status_sebar_userbot`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `token_login_autoresponder`
--
ALTER TABLE `token_login_autoresponder`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`);

--
-- Indeks untuk tabel `token_login_userbot`
--
ALTER TABLE `token_login_userbot`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`);

--
-- Indeks untuk tabel `transaksi_tripay_userbot`
--
ALTER TABLE `transaksi_tripay_userbot`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reference` (`reference`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin_autoresponder`
--
ALTER TABLE `admin_autoresponder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `admin_userbot`
--
ALTER TABLE `admin_userbot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `coin_tamu_userbot`
--
ALTER TABLE `coin_tamu_userbot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `grup_sebar_userbot`
--
ALTER TABLE `grup_sebar_userbot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kontrol_akun_userbot`
--
ALTER TABLE `kontrol_akun_userbot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `kontrol_sessions_userbot`
--
ALTER TABLE `kontrol_sessions_userbot`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=446;

--
-- AUTO_INCREMENT untuk tabel `list_kontrol_userbot`
--
ALTER TABLE `list_kontrol_userbot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT untuk tabel `list_sebar_userbot`
--
ALTER TABLE `list_sebar_userbot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `notifikasi_userbot`
--
ALTER TABLE `notifikasi_userbot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `owner_userbot`
--
ALTER TABLE `owner_userbot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pending_kontrol_userbot`
--
ALTER TABLE `pending_kontrol_userbot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pengguna_autoresponder`
--
ALTER TABLE `pengguna_autoresponder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT untuk tabel `pengguna_userbot`
--
ALTER TABLE `pengguna_userbot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT untuk tabel `pengunjung`
--
ALTER TABLE `pengunjung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `referal_userbot`
--
ALTER TABLE `referal_userbot`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `riwayat_login_autoresponder`
--
ALTER TABLE `riwayat_login_autoresponder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=393;

--
-- AUTO_INCREMENT untuk tabel `riwayat_login_userbot`
--
ALTER TABLE `riwayat_login_userbot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=475;

--
-- AUTO_INCREMENT untuk tabel `riwayat_trial_userbot`
--
ALTER TABLE `riwayat_trial_userbot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT untuk tabel `settings_autoresponder`
--
ALTER TABLE `settings_autoresponder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `settings_userbot`
--
ALTER TABLE `settings_userbot`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `status_sebar_userbot`
--
ALTER TABLE `status_sebar_userbot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `token_login_autoresponder`
--
ALTER TABLE `token_login_autoresponder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT untuk tabel `token_login_userbot`
--
ALTER TABLE `token_login_userbot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT untuk tabel `transaksi_tripay_userbot`
--
ALTER TABLE `transaksi_tripay_userbot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `grup_sebar_userbot`
--
ALTER TABLE `grup_sebar_userbot`
  ADD CONSTRAINT `grup_sebar_userbot_ibfk_1` FOREIGN KEY (`id_telegram`) REFERENCES `pengguna_userbot` (`id_telegram`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
