-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 18, 2020 at 01:12 PM
-- Server version: 5.7.32-cll-lve
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wahy1212_mansis_new`
--

-- --------------------------------------------------------

--
-- Table structure for table `absen`
--

CREATE TABLE `absen` (
  `absen_id` bigint(20) NOT NULL,
  `karyawan_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `alasan` text,
  `photo` varchar(100) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `jam_masuk` time NOT NULL,
  `jam_pulang` time DEFAULT NULL,
  `lama_kerja` int(11) DEFAULT NULL,
  `hasil_kerja` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `absen`
--

INSERT INTO `absen` (`absen_id`, `karyawan_id`, `status`, `alasan`, `photo`, `tanggal`, `jam_masuk`, `jam_pulang`, `lama_kerja`, `hasil_kerja`) VALUES
(106, 45, 1, '', 'ini photo', '2020-12-15', '17:23:49', '17:23:57', 0, 'yess 1'),
(108, 45, 1, '', 'ini photo', '2020-12-16', '17:41:55', NULL, NULL, NULL),
(109, 45, 1, '', 'ini photo', '2020-12-18', '09:08:26', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `akses_pt`
--

CREATE TABLE `akses_pt` (
  `akses_pt_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `perusahaan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `akses_pt`
--

INSERT INTO `akses_pt` (`akses_pt_id`, `user_id`, `perusahaan_id`) VALUES
(18, 17, 22),
(19, 17, 23),
(20, 17, 24);

-- --------------------------------------------------------

--
-- Table structure for table `bahasa`
--

CREATE TABLE `bahasa` (
  `bahasa_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bahasa`
--

INSERT INTO `bahasa` (`bahasa_id`, `name`) VALUES
(1, 'Indonesia'),
(2, 'English');

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `bank_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`bank_id`, `name`, `created`, `updated`) VALUES
(1, 'BANK BNI', '2020-11-23 14:02:32', NULL),
(2, 'BANK BCA', '2020-11-23 14:02:39', NULL),
(3, 'BANK MANDIRI', '2020-11-23 14:02:47', NULL),
(4, 'BANK BJB', '2020-11-23 14:15:57', NULL),
(5, 'BANK BRI', '2020-11-23 14:50:52', NULL),
(7, 'BANK DANAMON', '2020-11-25 23:04:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `benefit`
--

CREATE TABLE `benefit` (
  `benefit_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `benefit`
--

INSERT INTO `benefit` (`benefit_id`, `name`) VALUES
(1, 'Jabatan'),
(2, 'Makanan'),
(3, 'Transport');

-- --------------------------------------------------------

--
-- Table structure for table `cabang`
--

CREATE TABLE `cabang` (
  `cabang_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cabang`
--

INSERT INTO `cabang` (`cabang_id`, `name`, `created`, `updated`) VALUES
(1, 'PEKALONGAN', '2020-11-16 00:01:39', NULL),
(2, 'DEPOK', '2020-11-16 00:01:45', NULL),
(3, 'JAWA BARAT', '2020-11-16 00:01:54', NULL),
(4, 'KUNINGAN', '2020-11-16 00:02:04', NULL),
(5, 'LAMPUNG', '2020-11-16 00:02:15', NULL),
(6, 'SUKABUMI', '2020-11-16 00:02:22', NULL),
(7, 'PEMALANG', '2020-11-16 00:02:32', NULL),
(8, 'BOGOR', '2020-11-16 00:02:38', NULL),
(9, 'CIREBON', '2020-11-16 00:02:44', NULL),
(10, 'JAKARTA SELATAN', '2020-11-16 00:02:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categori`
--

CREATE TABLE `categori` (
  `categori_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categori`
--

INSERT INTO `categori` (`categori_id`, `name`, `created`, `updated`) VALUES
(23, 'Alat Berat', '2020-11-15 21:22:41', NULL),
(24, 'Elektronik', '2020-11-15 21:23:51', NULL),
(25, 'Mobil', '2020-11-15 21:23:59', NULL),
(26, 'Motor', '2020-11-15 21:24:08', NULL),
(27, 'Properti', '2020-11-15 21:24:17', NULL),
(28, 'Scalfolding', '2020-11-15 21:24:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `categoripotongan`
--

CREATE TABLE `categoripotongan` (
  `categoripotongan_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categoripotongan`
--

INSERT INTO `categoripotongan` (`categoripotongan_id`, `name`) VALUES
(1, 'BPJS Ketenagakerjaan'),
(2, 'BPJS Kesehatan');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `pasar_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `detail_jobdesk`
--

CREATE TABLE `detail_jobdesk` (
  `detail_jobdesk_id` int(11) NOT NULL,
  `jobdesk_id` int(11) NOT NULL,
  `karyawan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_jobdesk`
--

INSERT INTO `detail_jobdesk` (`detail_jobdesk_id`, `jobdesk_id`, `karyawan_id`) VALUES
(10, 5, 51),
(12, 6, 94),
(13, 4, 45),
(14, 6, 45),
(15, 4, 94),
(16, 5, 94);

-- --------------------------------------------------------

--
-- Table structure for table `history_karyawan`
--

CREATE TABLE `history_karyawan` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `info` varchar(255) NOT NULL,
  `tanggal` varchar(255) NOT NULL,
  `user_agent` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history_karyawan`
--

INSERT INTO `history_karyawan` (`id`, `nama`, `info`, `tanggal`, `user_agent`) VALUES
(888, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '04/12/2020 14:55:41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(889, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '04/12/2020 14:57:32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:83.0) Gecko/20100101 Firefox/83.0'),
(890, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '04/12/2020 19:16:25', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(891, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '05/12/2020 09:14:36', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(892, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '05/12/2020 10:10:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(893, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '05/12/2020 10:14:29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(894, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '05/12/2020 10:21:37', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(895, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '06/12/2020 16:46:04', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(896, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '07/12/2020 10:06:18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(897, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '08/12/2020 00:24:57', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(898, 'adminwad', 'adminwad Telah melakukan login', '08/12/2020 00:40:19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(899, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '08/12/2020 01:01:29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(900, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '08/12/2020 01:01:59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(901, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '08/12/2020 01:10:48', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(902, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '08/12/2020 01:15:08', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(903, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '08/12/2020 01:16:41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(904, 'adminwad', 'adminwad Telah melakukan login', '08/12/2020 01:17:02', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(905, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '08/12/2020 20:03:27', 'Mozilla/5.0 (Linux; Android 10; V2029; wv) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.84 Mobile Safari/537.36 VivoBrowser/6.0.4.2'),
(906, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '08/12/2020 21:14:41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(907, 'adminwad', 'adminwad Telah melakukan login', '08/12/2020 21:18:20', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(908, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '08/12/2020 21:22:11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(909, 'adminwad', 'adminwad Telah melakukan login', '08/12/2020 21:37:35', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(910, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '08/12/2020 21:46:31', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(911, 'adminwad', 'adminwad Telah melakukan login', '08/12/2020 21:47:27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(912, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '08/12/2020 21:48:26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(913, 'adminwad', 'adminwad Telah melakukan login', '08/12/2020 21:54:10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(914, 'adminksp', 'adminksp Telah melakukan login', '08/12/2020 21:56:13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(915, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '08/12/2020 22:03:48', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(916, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '09/12/2020 00:30:29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(917, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '09/12/2020 11:45:11', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(918, 'adminwad', 'adminwad Telah melakukan login', '09/12/2020 11:46:34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(919, 'adminwad', 'adminwad Telah melakukan login', '09/12/2020 18:17:49', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36'),
(920, 'adminwad', 'adminwad Telah melakukan login', '09/12/2020 18:18:45', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36'),
(921, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '09/12/2020 18:30:19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(922, 'adminwad', 'adminwad Telah melakukan login', '09/12/2020 18:36:40', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(923, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '09/12/2020 19:30:59', 'Mozilla/5.0 (Linux; Android 10; V2029; wv) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.84 Mobile Safari/537.36 VivoBrowser/6.0.4.2'),
(924, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '10/12/2020 07:17:54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(925, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '10/12/2020 07:22:07', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(926, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '10/12/2020 07:22:22', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36'),
(927, 'adminwad', 'adminwad Telah melakukan login', '10/12/2020 07:22:39', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36'),
(928, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '10/12/2020 07:24:40', 'Mozilla/5.0 (Linux; Android 10; CPH1823) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.86 Mobile Safari/537.36'),
(929, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '10/12/2020 07:36:24', 'Mozilla/5.0 (Linux; Android 5.1.1; A37f) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.101 Mobile Safari/537.36'),
(930, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '10/12/2020 08:43:40', 'Mozilla/5.0 (Linux; Android 5.1.1; A37f) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.101 Mobile Safari/537.36'),
(931, 'adminwad', 'adminwad Telah melakukan login', '10/12/2020 08:51:00', 'Mozilla/5.0 (Linux; Android 5.1.1; A37f) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.101 Mobile Safari/537.36'),
(932, 'adminwad', 'adminwad Telah melakukan login', '10/12/2020 13:16:04', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36'),
(933, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '12/12/2020 20:55:35', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Safari/605.1.15'),
(934, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '13/12/2020 05:55:18', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Safari/605.1.15'),
(935, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '13/12/2020 07:35:50', 'Mozilla/5.0 (Linux; Android 10; V2029) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.99 Mobile Safari/537.36'),
(936, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '13/12/2020 11:45:57', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36'),
(937, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '13/12/2020 21:11:00', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Safari/605.1.15'),
(938, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '13/12/2020 23:26:07', 'Mozilla/5.0 (Linux; Android 8.1.0; ASUS_X00HD) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Mobile Safari/537.36'),
(939, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '13/12/2020 23:27:45', 'Mozilla/5.0 (Linux; U; Android 10; id-id; Redmi Note 9 Pro Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/71.0.3578.141 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.7.4'),
(940, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '13/12/2020 23:38:10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(941, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '14/12/2020 06:33:08', 'Mozilla/5.0 (Linux; Android 6.0; Redmi Note 4X) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.87 Mobile Safari/537.36'),
(942, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '14/12/2020 06:37:15', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(943, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '14/12/2020 08:31:38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(944, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '14/12/2020 08:36:56', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Safari/605.1.15'),
(945, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '14/12/2020 08:49:19', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(946, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '14/12/2020 09:39:25', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(947, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '14/12/2020 14:16:10', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36'),
(948, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '14/12/2020 14:28:21', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(949, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '14/12/2020 16:13:56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(950, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '14/12/2020 19:12:06', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(951, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '14/12/2020 19:13:47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(952, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '14/12/2020 19:14:47', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36'),
(953, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '14/12/2020 19:14:53', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(954, 'adminmsi', 'adminmsi Telah melakukan login', '14/12/2020 19:22:32', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(955, 'adminmsi', 'adminmsi Telah melakukan login', '14/12/2020 19:29:15', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36'),
(956, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '14/12/2020 19:45:23', 'Mozilla/5.0 (Linux; Android 5.1.1; A37f) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.101 Mobile Safari/537.36'),
(957, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '14/12/2020 19:56:05', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36'),
(958, 'adminmsi', 'adminmsi Telah melakukan login', '14/12/2020 19:57:02', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36'),
(959, 'adminwad', 'adminwad Telah melakukan login', '14/12/2020 19:59:23', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36'),
(960, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '15/12/2020 08:47:44', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(961, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '15/12/2020 10:37:05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(962, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '15/12/2020 12:53:26', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(963, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '15/12/2020 12:57:47', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(964, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '15/12/2020 13:56:29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(965, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '15/12/2020 15:00:53', 'Mozilla/5.0 (Linux; Android 10; V2029; wv) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.84 Mobile Safari/537.36 VivoBrowser/6.0.4.2'),
(966, 'adminmsi', 'adminmsi Telah melakukan login', '15/12/2020 15:01:21', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36'),
(967, 'adminwad', 'adminwad Telah melakukan login', '15/12/2020 15:02:39', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36'),
(968, 'adminwad', 'adminwad Telah melakukan login', '15/12/2020 15:12:05', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(969, 'adminwad', 'adminwad Telah melakukan login', '15/12/2020 15:12:54', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(970, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '15/12/2020 15:24:51', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(971, 'adminksp', 'adminksp Telah melakukan login', '15/12/2020 15:37:45', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(972, 'adminwad', 'adminwad Telah melakukan login', '15/12/2020 15:38:34', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(973, 'adminmws', 'adminmws Telah melakukan login', '15/12/2020 15:40:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(974, 'adminksp', 'adminksp Telah melakukan login', '15/12/2020 15:41:13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(975, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '15/12/2020 15:55:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(976, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '15/12/2020 16:01:38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(977, 'adminwad', 'adminwad Telah melakukan login', '15/12/2020 16:03:01', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(978, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '15/12/2020 16:45:28', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(979, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '15/12/2020 16:56:18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(980, 'adminwad', 'adminwad Telah melakukan login', '16/12/2020 08:29:16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(981, 'adminksp', 'adminksp Telah melakukan login', '16/12/2020 08:30:13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(982, 'adminwad', 'adminwad Telah melakukan login', '16/12/2020 08:34:29', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(983, 'adminwad', 'adminwad Telah melakukan login', '16/12/2020 09:02:56', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36'),
(984, 'adminksp', 'adminksp Telah melakukan login', '16/12/2020 13:08:53', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(985, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '16/12/2020 13:37:46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(986, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '16/12/2020 14:05:09', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(987, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '16/12/2020 15:07:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(988, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '16/12/2020 15:46:42', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(989, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '16/12/2020 15:49:35', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(990, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '16/12/2020 17:52:15', 'Mozilla/5.0 (Linux; U; Android 10; id-id; Redmi Note 9 Pro Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/71.0.3578.141 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.7.4'),
(991, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '17/12/2020 10:08:55', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36'),
(992, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '17/12/2020 10:12:31', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(993, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '17/12/2020 10:18:27', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36'),
(994, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '17/12/2020 12:39:49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(995, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '17/12/2020 16:40:13', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(996, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '17/12/2020 16:44:27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(997, 'adminwad', 'adminwad Telah melakukan login', '17/12/2020 16:48:38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(998, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '17/12/2020 17:08:48', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(999, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '17/12/2020 18:53:17', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(1000, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '17/12/2020 19:01:54', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36'),
(1001, 'adminwad', 'adminwad Telah melakukan login', '17/12/2020 19:02:23', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.66 Safari/537.36'),
(1002, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '17/12/2020 21:30:49', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(1003, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '17/12/2020 22:39:31', 'Mozilla/5.0 (iPhone; CPU iPhone OS 14_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0.1 Mobile/15E148 Safari/604.1'),
(1004, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '17/12/2020 22:41:41', 'Mozilla/5.0 (Linux; U; Android 10; id-id; Redmi Note 9 Pro Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/71.0.3578.141 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.7.4'),
(1005, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '17/12/2020 23:12:18', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(1006, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '17/12/2020 23:34:31', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(1007, 'adminwad', 'adminwad Telah melakukan login', '17/12/2020 23:39:38', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(1008, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '17/12/2020 23:39:56', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(1009, 'adminmsi', 'adminmsi Telah melakukan login', '17/12/2020 23:41:02', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(1010, 'adminmsi', 'adminmsi Telah melakukan login', '17/12/2020 23:41:46', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(1011, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '17/12/2020 23:42:27', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(1012, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '17/12/2020 23:43:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(1013, 'adminmsi', 'adminmsi Telah melakukan login', '17/12/2020 23:43:10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(1014, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '17/12/2020 23:45:40', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(1015, 'adminmsi', 'adminmsi Telah melakukan login', '17/12/2020 23:49:10', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(1016, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '17/12/2020 23:50:45', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(1017, 'adminmsi', 'adminmsi Telah melakukan login', '18/12/2020 00:11:43', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(1018, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '18/12/2020 00:16:14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(1019, 'adminmsi', 'adminmsi Telah melakukan login', '18/12/2020 00:16:28', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(1020, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '18/12/2020 07:18:13', 'Mozilla/5.0 (Linux; U; Android 10; id-id; Redmi Note 9 Pro Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/71.0.3578.141 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.7.4'),
(1021, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '18/12/2020 08:38:29', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(1022, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '18/12/2020 08:43:24', 'Mozilla/5.0 (Linux; Android 10; V2029; wv) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.84 Mobile Safari/537.36 VivoBrowser/6.0.4.2'),
(1023, 'adminmsi', 'adminmsi Telah melakukan login', '18/12/2020 08:55:23', 'Mozilla/5.0 (Linux; Android 10; V2029; wv) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.84 Mobile Safari/537.36 VivoBrowser/6.0.4.2'),
(1024, 'adminmsi', 'adminmsi Telah melakukan login', '18/12/2020 09:00:44', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36'),
(1025, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '18/12/2020 09:50:17', 'Mozilla/5.0 (Linux; Android 10; V2029; wv) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.84 Mobile Safari/537.36 VivoBrowser/6.0.4.2'),
(1026, 'Admin Aplikasi', 'Admin Aplikasi Telah melakukan login', '18/12/2020 11:18:41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `item_id` int(11) NOT NULL,
  `barcode` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `categori_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `perusahaan_id` int(11) NOT NULL,
  `price` int(10) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`item_id`, `barcode`, `name`, `categori_id`, `unit_id`, `perusahaan_id`, `price`, `stock`, `created`, `updated`) VALUES
(48, '123456789', 'Laptop', 24, 19, 21, 1000, 0, '2020-12-03 20:19:08', NULL),
(49, 'K0001', 'Laptop', 24, 19, 8, 2000000, 1, '2020-12-08 22:00:30', NULL),
(53, '1256', 'Lemari', 23, 23, 21, 25, -1, '2020-12-16 09:05:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `jabatan_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `perusahaan_id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`jabatan_id`, `name`, `perusahaan_id`, `created`, `updated`) VALUES
(1, 'Admin', 0, '2020-11-15 23:50:58', NULL),
(12, 'ADMIN UMUM', 0, '2020-11-16 15:28:21', NULL),
(14, 'DIREKTUR', 0, '2020-11-16 15:29:14', NULL),
(19, 'ENGINNER', 0, '2020-11-16 15:30:08', NULL),
(23, 'ADMIN KEUANGAN', 0, '2020-11-30 17:50:41', NULL),
(24, 'DESAIN GRAFIS', 0, '2020-11-30 17:50:58', NULL),
(25, 'AUDIT', 0, '2020-11-30 17:51:08', NULL),
(26, 'KETUA KOPERASI', 0, '2020-11-30 17:52:56', NULL),
(27, 'MARKETING', 0, '2020-11-30 17:53:07', NULL),
(28, 'KOLEKTOR', 0, '2020-11-30 17:53:12', NULL),
(29, 'DRIVER', 0, '2020-11-30 17:53:27', NULL),
(30, 'KEPALA CABANG', 0, '2020-11-30 17:53:46', NULL),
(31, 'MANAGER AREA', 0, '2020-11-30 17:53:59', NULL),
(32, 'DRAFTER', 0, '2020-11-30 17:54:31', NULL),
(33, 'ANALIS KREDIT', 0, '2020-11-30 17:55:04', NULL),
(34, 'STAF IT', 0, '2020-11-30 17:55:18', NULL),
(36, 'ACCOUNTING', 0, '2020-11-30 22:35:12', NULL),
(37, 'MANAGER PENGEMBANGAN', 0, '2020-11-30 22:37:12', NULL),
(38, 'LEADER SALES OPERASIONAL', 0, '2020-11-30 22:51:41', NULL),
(39, 'SALES RETAIL MSI MART', 0, '2020-11-30 22:53:49', NULL),
(40, 'MAINTENANCE', 0, '2020-11-30 22:58:16', NULL),
(41, 'SCAFOLDING', 0, '2020-11-30 22:59:12', NULL),
(42, 'FRONTLINER MSI MART', 0, '2020-11-30 22:59:55', NULL),
(43, 'MANAGER', 0, '2020-11-30 23:03:33', NULL),
(44, 'ANALIS BISNIS', 0, '2020-11-30 23:04:39', NULL),
(45, 'OFFICE BOY', 0, '2020-11-30 23:55:56', NULL),
(46, 'IT PROGRAMMER', 0, '2020-12-01 00:02:17', NULL),
(47, 'MEKANIK ELEKTRIK', 0, '2020-12-01 00:07:19', NULL),
(48, 'PROPERTY', 0, '2020-12-01 00:12:53', NULL),
(49, 'UMUM', 0, '2020-12-01 00:16:17', NULL),
(50, 'TUKANG', 0, '2020-12-18 10:01:08', NULL),
(51, 'KENEK', 0, '2020-12-18 10:02:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jns_akun`
--

CREATE TABLE `jns_akun` (
  `id` bigint(20) NOT NULL,
  `kd_aktiva` varchar(5) DEFAULT NULL,
  `perusahaan_id` int(11) NOT NULL,
  `jns_trans` varchar(50) DEFAULT NULL,
  `akun` enum('Aktiva','Pasiva') DEFAULT NULL,
  `laba_rugi` enum('','PENDAPATAN','BIAYA') DEFAULT NULL,
  `pemasukan` enum('Y','N') DEFAULT NULL,
  `pengeluaran` enum('Y','N') DEFAULT NULL,
  `aktif` enum('Y','N') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jns_akun`
--

INSERT INTO `jns_akun` (`id`, `kd_aktiva`, `perusahaan_id`, `jns_trans`, `akun`, `laba_rugi`, `pemasukan`, `pengeluaran`, `aktif`) VALUES
(1, 'A4', 0, 'Piutang Usaha PT.Mas Scafolding', 'Aktiva', '', 'Y', 'Y', 'Y'),
(2, 'A5', 0, 'Piutang Usaha PT.Mas minimarket', 'Aktiva', '', 'Y', 'Y', 'Y'),
(3, 'A6', 0, 'Putang Usaha PT.Mas Property', 'Aktiva', '', 'Y', 'Y', 'Y'),
(4, 'A7', 0, 'Piutang KSP Bulanan', 'Aktiva', '', 'Y', 'Y', 'Y'),
(5, 'A8', 0, 'Piutang KSP Mingguan', 'Aktiva', '', 'Y', 'Y', 'Y'),
(6, 'A9', 21, 'Piutang Usaha PT.wad', 'Aktiva', NULL, 'Y', 'Y', 'Y'),
(7, 'A10', 0, 'Perlengkapan Usaha PT.Mas Scafolding', 'Aktiva', '', 'N', 'Y', 'Y'),
(8, 'C', 0, 'Aktiva Tetap Berwujud', 'Aktiva', '', NULL, NULL, 'Y'),
(9, 'C1', 0, 'Inventaris Kendaraan Ksp Bulanan', 'Aktiva', '', 'Y', 'Y', 'Y'),
(10, 'C2', 0, 'Inventaris Kendaraan Ksp Mingguan', 'Aktiva', '', 'N', 'Y', 'Y'),
(11, 'C3', 0, 'Inventaris Kendaraan Pt.WAD', 'Aktiva', '', 'N', 'Y', 'Y'),
(12, 'C4', 0, 'Inventaris KendaraanPT.Mas property', 'Aktiva', '', 'N', 'Y', 'Y'),
(13, 'E', 0, 'Modal Pribadi Arta Group', 'Aktiva', '', 'N', 'N', 'N'),
(14, 'E1', 0, 'Prive', 'Aktiva', '', 'Y', 'Y', 'N'),
(15, 'F', 0, 'Utang', 'Pasiva', '', NULL, NULL, 'Y'),
(16, 'F1', 0, 'Utang Usaha supplier PT.Mas Scafolding', 'Pasiva', '', 'Y', 'Y', 'Y'),
(17, 'K3', 0, 'Gaji Karyawan PT.MAS Minimarket', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(18, 'F4', 0, 'Utang Pajak PT.MAS', 'Pasiva', '', 'Y', 'Y', 'Y'),
(19, 'F5', 0, 'Utang Pajak PT.WAD', 'Pasiva', '', 'Y', 'Y', 'Y'),
(20, 'H', 0, 'Utang Jangka Panjang', 'Pasiva', '', NULL, NULL, 'Y'),
(21, 'H1', 0, 'Utang BFI Finance', 'Pasiva', '', 'Y', 'Y', 'Y'),
(22, 'H2', 0, 'Utang Adira Finance', 'Pasiva', '', 'Y', 'Y', 'N'),
(23, 'I', 0, 'Modal', 'Pasiva', '', NULL, NULL, 'Y'),
(24, 'I1', 0, 'Modal awal PT.WAM', 'Pasiva', '', 'Y', 'Y', 'Y'),
(25, 'I2', 0, 'Modal Awal Ksp Mingguan', 'Pasiva', '', 'Y', 'Y', 'Y'),
(26, 'I3', 0, 'Modal Awal PT.WAD', 'Pasiva', '', 'Y', 'Y', 'Y'),
(27, 'I4', 0, 'Modal Awal PT.MAS Scafolding', 'Pasiva', '', 'Y', 'Y', 'Y'),
(28, 'I5', 0, 'Modal Awal PT.Mas Minimarket', 'Pasiva', '', 'Y', 'Y', 'Y'),
(29, 'I6', 0, 'Modal Awal KSP Bulanan', 'Pasiva', '', 'Y', 'Y', 'Y'),
(30, 'J', 0, 'Pendapatan', 'Pasiva', 'PENDAPATAN', NULL, NULL, 'Y'),
(31, 'J1', 0, 'Pendapatan Anguran Kasbon', 'Pasiva', 'PENDAPATAN', 'Y', 'Y', 'Y'),
(32, 'J2', 0, 'Pendapatan PT.Mas Rental Scafolding', 'Pasiva', 'PENDAPATAN', 'Y', 'Y', 'Y'),
(33, 'K', 0, 'Beban', 'Aktiva', '', NULL, NULL, 'Y'),
(34, 'K1', 0, 'Gaji Karyawan PT.WAD', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(35, 'K5', 0, 'Gaji Karyawan KSP Mingguan', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(36, 'K4', 0, 'Gaji Karyawan KSP.Bulanan', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(37, 'K10', 0, 'Biaya Listrik KSP', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(38, 'TRF', 0, 'Transfer Antar Kas', NULL, '', NULL, NULL, 'N'),
(39, 'A11', 0, 'Permisalan', 'Aktiva', '', 'Y', 'Y', 'Y'),
(40, 'J3', 0, 'Pendapatan PT.Mas Mini Market', 'Pasiva', 'PENDAPATAN', 'Y', 'Y', 'Y'),
(41, 'J4', 0, 'Pendapatan PT.WAD', 'Pasiva', 'PENDAPATAN', 'Y', 'Y', 'Y'),
(42, 'J5', 0, 'Pendapatan Texnoss design', 'Pasiva', 'PENDAPATAN', 'Y', 'Y', 'Y'),
(43, 'K2', 0, 'Gaji Karyawan PT.MAS Scafolding', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(44, 'K6', 0, 'Gaji Karyawan Texnoss design', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(45, 'K7', 0, 'Gaji Karyawan PT.WAM', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(46, 'F2', 0, 'Utang Supplier PT.Mas mini market', 'Pasiva', '', 'Y', 'Y', 'Y'),
(47, 'F3', 0, 'Utang PT.Mas Property', 'Pasiva', '', 'Y', 'Y', 'Y'),
(48, 'F6', 0, 'Utang Pajak KSP Bulanan', 'Pasiva', '', 'Y', 'Y', 'Y'),
(49, 'F7', 0, 'Utang pajak PT.WAM', 'Pasiva', '', 'Y', 'Y', 'Y'),
(50, 'H3', 0, 'Utang Bank Mandiri ', 'Pasiva', '', 'Y', 'Y', 'Y'),
(51, 'K8', 0, 'Sewa Kantor PT.WAD', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(52, 'K9', 0, 'Sewa Kantor PT.Mas', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(53, 'k11', 0, 'Sewa Kantor KSP ', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(54, 'k12', 0, 'Biaya Internet PT.Wad', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(55, 'K13', 0, 'Biaya internet KSP', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(56, 'k14', 0, 'Biaya internet PT.Mas Scafolding', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(57, 'K15', 0, 'Biaya Internet PT.Mas Minimarket', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(58, 'k16', 0, 'Bayar listrik  PT.WAD', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(59, 'k17', 0, 'Biaya listrik Pt.Mas', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(60, 'I7', 0, 'Modal Awal PT.Mas Property', 'Pasiva', '', 'Y', 'Y', 'Y'),
(61, 'c5', 0, 'Inventaris Kendaraan PT.Mas Minimarket', 'Aktiva', '', 'N', 'Y', 'Y'),
(62, 'c6', 0, 'Inventaris Kendaraan Pt mas rental scafolding', 'Aktiva', '', 'N', 'Y', 'Y'),
(63, 'c7', 0, 'Aktiva lainnya', 'Aktiva', '', 'Y', 'N', 'Y'),
(64, 'c8', 0, 'Inventaris Mesin Ksp Mingguan', 'Aktiva', '', 'N', 'Y', 'Y'),
(65, 'c9', 0, 'Inventaris Mesin Ksp Bulanan', 'Aktiva', '', 'N', 'Y', 'Y'),
(66, 'c10', 0, 'Inventaris Mesin PT.WAD', 'Aktiva', '', 'N', 'Y', 'Y'),
(67, 'c11', 0, 'Inventaris Mesin PT.Mas Property', 'Aktiva', '', 'N', 'Y', 'Y'),
(68, 'c12', 0, 'Inventaris Mesin PT.Mas minimarket', 'Aktiva', '', 'N', 'Y', 'Y'),
(69, 'c13', 0, 'Inventaris Mesin Pt mas rental scafolding', 'Aktiva', '', 'N', 'Y', 'Y'),
(70, 'c14', 0, 'Inventaris mesin PT.WAM', 'Aktiva', '', 'N', 'Y', 'Y'),
(71, 'a12', 0, 'Biaya Dibayar Dimuka', 'Aktiva', '', 'N', 'Y', 'Y'),
(72, 'I8', 0, 'Modal Arta Art', 'Pasiva', '', 'Y', 'Y', 'Y'),
(73, 'k18', 0, 'Gaji Karyawan Arta Art', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(74, 'k19', 0, 'Kasbon Pekerjaan IT PT.WAD', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(75, 'k20', 0, 'Gaji Karyawan PT.MAS Property', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y'),
(76, 'k21', 0, 'Gaji Karyawan Arta Group', 'Aktiva', 'BIAYA', 'N', 'Y', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `jns_angsuran`
--

CREATE TABLE `jns_angsuran` (
  `id` bigint(20) NOT NULL,
  `ket` int(11) DEFAULT NULL,
  `aktif` enum('Y','T','') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jns_angsuran`
--

INSERT INTO `jns_angsuran` (`id`, `ket`, `aktif`) VALUES
(24, 1, 'Y'),
(25, 2, 'Y'),
(26, 3, 'Y'),
(27, 4, 'Y'),
(28, 5, 'Y'),
(29, 6, 'Y'),
(30, 7, 'Y'),
(31, 8, NULL),
(32, 9, NULL),
(33, 10, NULL),
(34, 11, NULL),
(35, 12, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jns_kas`
--

CREATE TABLE `jns_kas` (
  `id` bigint(20) NOT NULL,
  `nama` varchar(225) DEFAULT NULL,
  `aktif` enum('Y','T') DEFAULT NULL,
  `tmpl_simpan` enum('Y','T') DEFAULT NULL,
  `tmpl_penarikan` enum('Y','T') DEFAULT NULL,
  `tmpl_pinjaman` enum('Y','T') DEFAULT NULL,
  `tmpl_bayar` enum('Y','T') DEFAULT NULL,
  `tmpl_pemasukan` enum('Y','T') DEFAULT NULL,
  `tmpl_pengeluaran` enum('Y','T') DEFAULT NULL,
  `tmpl_transfer` enum('Y','T') DEFAULT NULL,
  `perusahaan_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jns_kas`
--

INSERT INTO `jns_kas` (`id`, `nama`, `aktif`, `tmpl_simpan`, `tmpl_penarikan`, `tmpl_pinjaman`, `tmpl_bayar`, `tmpl_pemasukan`, `tmpl_pengeluaran`, `tmpl_transfer`, `perusahaan_id`) VALUES
(40, 'Kas.PT.WAD', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 21),
(41, 'Kas KSP WAS', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 8),
(42, 'Kas PT MUTIARA WAHYUARTA SEJAHTERA', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 7);

-- --------------------------------------------------------

--
-- Table structure for table `jns_simpanan`
--

CREATE TABLE `jns_simpanan` (
  `id` int(5) NOT NULL,
  `ket` varchar(100) DEFAULT NULL,
  `perusahaan_id` int(11) NOT NULL,
  `jumlah` double NOT NULL,
  `tampil` enum('Y','T') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jns_simpanan`
--

INSERT INTO `jns_simpanan` (`id`, `ket`, `perusahaan_id`, `jumlah`, `tampil`) VALUES
(56, 'Arisan Karyawan PT WAHYU ARTA DIGITAL (WAD)', 21, 6000, 'Y'),
(57, 'Arisan Karyawan KSP WAHYU ARTA SEJAHTERA', 8, 10000, 'Y'),
(58, 'Arisan Karyawan PT MUTIARA WAHYUARTA SEJAHTERA', 7, 0, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `jobdesk`
--

CREATE TABLE `jobdesk` (
  `jobdesk_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `perusahaan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobdesk`
--

INSERT INTO `jobdesk` (`jobdesk_id`, `name`, `perusahaan_id`) VALUES
(4, 'Membuat Aplikasi Web', 21),
(5, 'Membuat Aplikasi Android', 21),
(6, 'Membuat Tampilan UI/UX Aplikasi', 21);

-- --------------------------------------------------------

--
-- Table structure for table `kamus`
--

CREATE TABLE `kamus` (
  `kamus_id` int(5) NOT NULL,
  `bahasa_id` int(3) DEFAULT NULL,
  `kode_kamus` int(3) DEFAULT NULL,
  `teks` varchar(110) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kamus`
--

INSERT INTO `kamus` (`kamus_id`, `bahasa_id`, `kode_kamus`, `teks`) VALUES
(90, 1, 1, 'Selamat Datang'),
(91, 2, 1, 'Welcome'),
(92, 1, 2, 'Daftar Pekerjaan'),
(93, 2, 2, 'Job List'),
(94, 1, 3, 'Absen'),
(95, 2, 3, 'Absent'),
(96, 1, 4, 'Pengumuman'),
(97, 2, 4, 'Announcement'),
(98, 1, 5, 'Laporan'),
(99, 2, 5, 'Report'),
(100, 1, 6, 'Tambah Kata'),
(101, 2, 6, 'Add Word');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `karyawan_id` int(11) NOT NULL,
  `kd_karyawan` varchar(100) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `ktp` varchar(50) DEFAULT NULL,
  `alamat` text,
  `phone` varchar(15) DEFAULT NULL,
  `pendidikan` varchar(50) DEFAULT NULL,
  `jk_kelamin` varchar(50) DEFAULT NULL,
  `jabatan_id` int(11) DEFAULT NULL,
  `perusahaan_id` int(11) DEFAULT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `status_id` int(5) DEFAULT NULL,
  `phone_saudara` varchar(15) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `gaji_pokok` int(11) DEFAULT NULL,
  `jam_kerja` int(11) DEFAULT NULL,
  `rate_gaji` int(11) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `no_rek` varchar(50) DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` date DEFAULT NULL,
  `api_token` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`karyawan_id`, `kd_karyawan`, `name`, `ktp`, `alamat`, `phone`, `pendidikan`, `jk_kelamin`, `jabatan_id`, `perusahaan_id`, `tgl_masuk`, `status_id`, `phone_saudara`, `photo`, `gaji_pokok`, `jam_kerja`, `rate_gaji`, `password`, `bank_id`, `no_rek`, `created`, `updated`, `api_token`) VALUES
(45, '19020006', 'PUTRI ANISA', '', '', '', 'S1', 'Perempuan', 23, 7, '2020-11-30', 1, '', 'item-201130-30380f916b.png', 0, 0, 0, '$2y$10$2JqPhn.yenTiCk/zPvj/ru7XP2Kih.tVXmgBRNuzmUBoYp7Rj/wCe', 1, '123456789', '2020-11-30 18:44:19', '2020-11-30', 'KWW4rAy6UoNPfUjU0kriZnx3e46SZIZNwF7Gluzx6ttgK5FPmLlrs7vEzuJw'),
(51, '18120004', 'RIA HARYATI', '', '', '', 'SMA/SMK', 'Perempuan', 30, 8, '0000-00-00', 1, '', 'item-201130-0af98bde86.png', 0, 0, 0, '$2y$10$2JqPhn.yenTiCk/zPvj/ru7XP2Kih.tVXmgBRNuzmUBoYp7Rj/wCe', 0, '', '2020-11-30 22:00:13', '2020-11-30', '7n6WB7f2Ogwwp8HrKOUSGDN5AIxZ9hf3GxQhTUpf7jSw4d3WfsiV4G8eRnN7'),
(52, '19020005', 'IIS MUHAROH', '', '', '', '', '', 1, 8, '0000-00-00', 0, '', 'item-201130-2072474d2a.png', 0, 0, 0, NULL, 0, '', '2020-11-30 22:04:06', NULL, NULL),
(53, '18010010', 'SUTIKNO', '', '', '', '', '', 25, 8, '0000-00-00', 0, '', 'item-201130-a31f1965be.png', 0, 0, 0, NULL, 0, '', '2020-11-30 22:18:13', NULL, NULL),
(54, '18010011', 'DWI NINGSIH', '', '', '', '', '', 26, 8, '0000-00-00', 0, '', 'item-201130-49b94d3857.png', 0, 0, 0, NULL, 0, '', '2020-11-30 22:18:58', '2020-11-30', NULL),
(55, '19070012', 'MURTIONO', '', '', '', '', '', 28, 8, '0000-00-00', 0, '', 'item-201130-4aaf13ba15.png', 0, 0, 0, NULL, 0, '', '2020-11-30 22:21:10', NULL, NULL),
(56, '19040015', 'ENDAH ROMMAEDAH FIRDAUS', '', '', '', '', '', 30, 8, '0000-00-00', 0, '', 'item-201130-89e4489341.png', 0, 0, 0, NULL, 0, '', '2020-11-30 22:22:58', NULL, NULL),
(57, '19090021', 'ALBERT POSMA SIMANUNGKALIT', '', '', '', '', '', 33, 8, '0000-00-00', 0, '', 'item-201130-0446c13e8c.png', 0, 0, 0, NULL, 0, '', '2020-11-30 22:23:34', NULL, NULL),
(58, '19070027', 'MOH NURHADI', '', '', '', '', '', 30, 8, '0000-00-00', 0, '', 'item-201130-2ab372db97.png', 0, 0, 0, NULL, 0, '', '2020-11-30 22:34:38', NULL, NULL),
(59, '19090028', 'LINDA DEWI MARTIANTI', '', '', '', '', '', 36, 8, '0000-00-00', 0, '', 'item-201130-c69fb16d09.png', 0, 0, 0, NULL, 0, '', '2020-11-30 22:35:47', NULL, NULL),
(60, '19090031', 'HARTATI', '', '', '', '', '', 30, 8, '0000-00-00', 0, '', 'item-201130-cecb365252.png', 0, 0, 0, NULL, 0, '', '2020-11-30 22:36:38', NULL, NULL),
(61, '20060049', 'MILTON WILLY HARLAN', '', '', '', '', '', 37, 7, '0000-00-00', 0, '', 'item-201130-bfd7118090.png', 0, 0, 0, NULL, 0, '', '2020-11-30 22:37:47', NULL, NULL),
(62, '20060050', 'AGUNG CATUR PRASETIO', '', '', '', '', '', 24, 7, '0000-00-00', 0, '', 'item-201130-7f59b6d3f0.png', 0, 0, 0, NULL, 0, '', '2020-11-30 22:38:16', NULL, NULL),
(63, '20070053', 'SUSI RAMADANTI', '', '', '', '', '', 1, 8, '0000-00-00', 0, '', 'item-201130-b48c8d9497.png', 0, 0, 0, NULL, 0, '', '2020-11-30 22:39:44', NULL, NULL),
(64, '20070054', 'HARI SOPIAN', '', '', '', '', '', 29, 7, '0000-00-00', 0, '', 'item-201130-eddc9ae103.png', 0, 0, 0, NULL, 0, '', '2020-11-30 22:50:25', NULL, NULL),
(65, '20070056', 'GUMARA ANGGA FIRNANDO', '', '', '', '', '', 38, 7, '0000-00-00', 0, '', 'item-201130-2564994554.png', 0, 0, 0, NULL, 0, '', '2020-11-30 22:51:14', '2020-11-30', NULL),
(66, '20070057', 'AZIMAH ULFI YUDIANI', '', '', '', '', '', 1, 8, '0000-00-00', 0, '', 'item-201130-ce72e044ac.png', 0, 0, 0, NULL, 0, '', '2020-11-30 22:52:37', NULL, NULL),
(67, '20070058', 'MUHAMMAD FADLAN AL HABIB', '', '', '', '', '', 1, 7, '0000-00-00', 0, '', 'item-201130-c6d3473540.png', 0, 0, 0, NULL, 0, '', '2020-11-30 22:53:30', NULL, NULL),
(68, '20070059', 'UNTORO', '', '', '', '', '', 39, 7, '0000-00-00', 0, '', 'item-201130-347a8b70d9.png', 0, 0, 0, NULL, 0, '', '2020-11-30 22:57:33', NULL, NULL),
(69, '20070061', 'SUYONO', '', '', '', '', '', 40, 7, '0000-00-00', 0, '', 'item-201130-7db6e4f7aa.png', 0, 0, 0, NULL, 0, '', '2020-11-30 22:58:05', '2020-11-30', NULL),
(70, '20070062', 'FAJAR BUDIARSO', '', '', '', '', '', 41, 7, '0000-00-00', 0, '', 'item-201130-1ae7e52ed6.png', 0, 0, 0, NULL, 0, '', '2020-11-30 22:59:37', NULL, NULL),
(71, '20080063', 'LEGIMAN', '', '', '', '', '', 42, 7, '0000-00-00', 0, '', 'item-201130-f3481fbaf6.png', 0, 0, 0, NULL, 0, '', '2020-11-30 23:01:37', NULL, NULL),
(72, '20080064', 'HESTI FITRIANI', '', '', '', '', '', 42, 7, '0000-00-00', 0, '', 'item-201130-9d97c1682c.png', 0, 0, 0, NULL, 0, '', '2020-11-30 23:02:06', NULL, NULL),
(73, '20080065', 'ARDIAN JOKO PURNOMO', '', '', '', '', '', 42, 7, '0000-00-00', 0, '', 'item-201130-2cc92ef7b9.png', 0, 0, 0, NULL, 0, '', '2020-11-30 23:02:28', NULL, NULL),
(74, '20080066', 'LILIS FADILLAH', '', '', '', '', '', 42, 7, '0000-00-00', 0, '', 'item-201130-0a83708c01.png', 0, 0, 0, NULL, 0, '', '2020-11-30 23:02:55', NULL, NULL),
(75, '20080067', 'ANDRIYANA SUGENG RIYADI', '', '', '', '', '', 43, 8, '0000-00-00', 0, '', 'item-201130-d4a0a7547a.png', 0, 0, 0, NULL, 0, '', '2020-11-30 23:04:02', NULL, NULL),
(76, '20080068', 'IMAM PUJIANTORO', '', '', '', '', '', 44, 8, '0000-00-00', 0, '', 'item-201130-49e6526b6f.png', 0, 0, 0, NULL, 0, '', '2020-11-30 23:04:29', '2020-11-30', NULL),
(77, '20080069', 'NIA ANGGRAINI', '', '', '', '', '', 23, 7, '0000-00-00', 0, '', 'item-201130-9b0bcc6202.png', 0, 0, 0, NULL, 0, '', '2020-11-30 23:05:41', NULL, NULL),
(78, '20080070', 'ABDUL RIZAL', '', '', '', '', '', 28, 8, '0000-00-00', 0, '', 'item-201130-919a04d8d2.png', 0, 0, 0, NULL, 0, '', '2020-11-30 23:32:39', NULL, NULL),
(79, '20080071', 'ADIE RINALDIE', '', '', '', '', '', 32, 7, '0000-00-00', 0, '', 'item-201130-bc67d98d9f.png', 0, 0, 0, NULL, 0, '', '2020-11-30 23:33:54', NULL, NULL),
(80, '20080072', 'MEGA TIARA PUTRI', '', '', '', '', '', 42, 7, '0000-00-00', 0, '', 'item-201130-0197952eb2.png', 0, 0, 0, NULL, 0, '', '2020-11-30 23:34:34', NULL, NULL),
(81, '20080073', 'AHMAD KAHFI', '', '', '', '', '', 30, 8, '0000-00-00', 0, '', 'item-201130-91087c27aa.png', 0, 0, 0, NULL, 0, '', '2020-11-30 23:36:08', NULL, NULL),
(82, '20080074', 'HENGKI AFIYANTO', '', '', '', '', '', 30, 8, '0000-00-00', 0, '', 'item-201130-4b6bf919eb.png', 0, 0, 0, NULL, 0, '', '2020-11-30 23:47:38', NULL, NULL),
(84, '20080075', 'SUKAMTO', '', '', '', '', '', 1, 8, '0000-00-00', 0, '', 'item-201130-ee3ecc0d8d.png', 0, 0, 0, NULL, 0, '', '2020-11-30 23:50:08', '2020-11-30', NULL),
(87, '20080076', 'WAHYU TRISTO SUJITO', '', '', '', '', '', 30, 8, '0000-00-00', 0, '', 'item-201130-c4a3de77a0.png', 0, 0, 0, NULL, 0, '', '2020-11-30 23:55:21', NULL, NULL),
(88, '20080077', 'KUSAIRI', '', '', '', '', '', 45, 8, '0000-00-00', 0, '', 'item-201130-79f72e162f.png', 0, 0, 0, NULL, 0, '', '2020-11-30 23:57:07', NULL, NULL),
(89, '20080080', 'SOFIYAN HADI PRIMANTO', '', '', '', '', '', 28, 8, '0000-00-00', 0, '', 'item-201130-4d1072ece0.png', 0, 0, 0, NULL, 0, '', '2020-11-30 23:57:30', NULL, NULL),
(90, '20080081', 'IRNAWATI', '', '', '', '', '', 1, 8, '0000-00-00', 0, '', 'item-201130-8224803133.png', 0, 0, 0, NULL, 0, '', '2020-11-30 23:57:58', NULL, NULL),
(91, '20080082', 'SURADI', '', '', '', '', '', 42, 7, '0000-00-00', 0, '', 'item-201130-d02489f532.png', 0, 0, 0, NULL, 0, '', '2020-11-30 23:58:27', NULL, NULL),
(92, '20080083', 'ALDI IRSAN MAJID', '', '', '', '', '', 34, 21, '0000-00-00', 0, '', 'item-201201-0c19c70a87.png', 0, 0, 0, NULL, 0, '', '2020-12-01 00:00:31', NULL, NULL),
(93, '20080084', 'MEYDA KURNIA EMYLIA PUTRI', '', '', '', '', '', 34, 21, '0000-00-00', 0, '', 'item-201201-e5179e50a4.png', 0, 0, 0, NULL, 0, '', '2020-12-01 00:00:54', NULL, NULL),
(94, '20120098', 'MUHAMMAD SAEFUL RAMDAN', '', 'Bogor Tajur Halang', '083874731480', 'S1', 'Laki Laki', 46, 21, '2020-11-13', 2, '083874731480', 'item-201201-2e6d1de0b1.jpg', 1500000, 100, 15000, NULL, 3, '1560015443551', '2020-12-01 00:02:02', '2020-12-15', NULL),
(95, '20090085', 'HADI SUINDRO', '', '', '', '', '', 30, 8, '0000-00-00', 0, '', 'item-201201-5645147c8a.png', 0, 0, 0, NULL, 0, '', '2020-12-01 00:03:17', NULL, NULL),
(96, '20090086', 'JUPAENDI', '', '', '', '', '', 28, 8, '0000-00-00', 0, '', 'item-201201-07b5f33894.png', 0, 0, 0, NULL, 0, '', '2020-12-01 00:04:07', '2020-12-01', NULL),
(97, '20090087', 'REZA AZHARY', '', '', '', '', '', 28, 8, '0000-00-00', 0, '', 'item-201201-0ca006d619.png', 0, 0, 0, NULL, 0, '', '2020-12-01 00:04:30', NULL, NULL),
(98, '20090088', 'DANI SEPTIYANTO', '', '', '', '', '', 28, 8, '0000-00-00', 0, '', 'item-201201-3a39d17391.png', 0, 0, 0, NULL, 0, '', '2020-12-01 00:06:46', NULL, NULL),
(99, '20090089', 'MARADONA', '', '', '', '', '', 47, 7, '0000-00-00', 0, '', 'item-201201-9d8edc64b8.png', 0, 0, 0, NULL, 0, '', '2020-12-01 00:08:22', NULL, NULL),
(100, '20090090', 'RIMA WIJAYANTI', '', '', '', '', '', 1, 7, '0000-00-00', 0, '', 'item-201201-ab0b50f64b.png', 0, 0, 0, NULL, 0, '', '2020-12-01 00:08:48', NULL, NULL),
(101, '20090091', 'DIAN LESTARI', '', '', '', '', '', 1, 8, '0000-00-00', 0, '', 'item-201201-bf3c6fbd9b.png', 0, 0, 0, NULL, 0, '', '2020-12-01 00:10:35', NULL, NULL),
(102, '20090092', 'MUH KHANIF', '', '', '', '', '', 28, 8, '0000-00-00', 0, '', 'item-201201-4fb5f0fc4c.png', 0, 0, 0, NULL, 0, '', '2020-12-01 00:11:01', NULL, NULL),
(103, '20090093', 'VEBY MUHAMAD IQBAL', '', '', '', '', '', 28, 8, '0000-00-00', 0, '', 'item-201201-ef75230732.png', 0, 0, 0, NULL, 0, '', '2020-12-01 00:11:31', NULL, NULL),
(104, '20090094', 'AGUNG PRASETYO', '', '', '', '', '', 28, 8, '0000-00-00', 0, '', 'item-201201-bce80cf9e8.png', 0, 0, 0, NULL, 0, '', '2020-12-01 00:12:15', NULL, NULL),
(105, '20080095', 'RONIPAN', '', '', '', '', '', 48, 7, '0000-00-00', 0, '', 'item-201201-e7d6960243.png', 0, 0, 0, NULL, 0, '', '2020-12-01 00:13:21', NULL, NULL),
(106, '20080096', 'IRNA WIRIYANTI', '', '', '', '', 'Perempuan', 36, 8, '0000-00-00', 0, '', 'item-201201-ed9a532d83.png', 0, 0, 0, NULL, 0, '', '2020-12-01 00:14:04', '2020-12-01', NULL),
(107, '20080097', 'DAVID MEGYA TYAS', '', '', '', '', 'Laki Laki', 36, 8, '0000-00-00', 0, '', 'item-201201-491c4acef9.png', 0, 0, 0, NULL, 0, '', '2020-12-01 00:15:37', '2020-12-01', NULL),
(108, '20080098', 'WIWIT WIBI SUSANTO', '', '', '', '', '', 49, 7, '0000-00-00', 0, '', 'item-201201-71b9934df9.png', 0, 0, 0, NULL, 0, '', '2020-12-01 00:17:22', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kasbon`
--

CREATE TABLE `kasbon` (
  `kasbon_id` int(11) NOT NULL,
  `karyawan_id` int(11) NOT NULL,
  `besar_uang` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `desk` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kasbon`
--

INSERT INTO `kasbon` (`kasbon_id`, `karyawan_id`, `besar_uang`, `tanggal`, `desk`) VALUES
(7, 51, 1000000, '2020-12-15', 'tes pinjaman');

-- --------------------------------------------------------

--
-- Table structure for table `pasar`
--

CREATE TABLE `pasar` (
  `pasar_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pengumuman`
--

CREATE TABLE `pengumuman` (
  `pengumuman_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `desk` text NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `perusahaan_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pengumuman`
--

INSERT INTO `pengumuman` (`pengumuman_id`, `title`, `desk`, `start_date`, `end_date`, `perusahaan_id`) VALUES
(1, 'dasdd', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2020-12-17', '2020-12-18', 8),
(3, 'pengumuman Libur', 'Di beritahukan bahwa kepada seluruh karyawan PT WAD bahwa tgl 30 desember 2020 seluruh kegiatan perusahaan di liburkan', '2020-12-17', '2020-12-30', 8),
(4, 'test', 'test', '2020-12-18', '2020-12-19', 8),
(12, 'Pengumuman hari ini', 'pengumuman libur tahun baru, mulai masuk tanggal 2 Januari', '2020-12-18', '2021-01-02', 7),
(13, 'Pengumuman Kemaren', 'Acara Meetup karyawan akan dimulai nanti pada tanggal 22 DESEMBER', '2020-12-15', '2020-12-17', 7),
(14, 'Pengumuman besok', 'Bonus gaji akhir tahun. Akan dibagikan pada tanggal 24 Desember', '2020-12-19', '2020-12-24', 7);

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan`
--

CREATE TABLE `perusahaan` (
  `perusahaan_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `perusahaan`
--

INSERT INTO `perusahaan` (`perusahaan_id`, `name`, `created`, `updated`) VALUES
(7, 'PT MUTIARA WAHYUARTA SEJAHTERA', '2020-11-15 20:29:52', NULL),
(8, 'KSP WAHYU ARTA SEJAHTERA', '2020-11-15 20:30:04', NULL),
(21, 'PT WAHYU ARTA DIGITAL (WAD)', '2020-12-01 00:00:00', NULL),
(22, 'PT MSI Sukabumi', '2020-12-14 19:16:58', NULL),
(23, 'PT MSI Bogor', '2020-12-17 23:40:48', NULL),
(24, 'PT MSI Bekasi', '2020-12-17 23:40:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `potongan`
--

CREATE TABLE `potongan` (
  `potongan_id` int(11) NOT NULL,
  `karyawan_id` int(11) NOT NULL,
  `categoripotongan_id` int(11) NOT NULL,
  `besar_potongan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `potongan`
--

INSERT INTO `potongan` (`potongan_id`, `karyawan_id`, `categoripotongan_id`, `besar_potongan`) VALUES
(6, 94, 1, 75000),
(7, 94, 2, 125000);

-- --------------------------------------------------------

--
-- Table structure for table `raker`
--

CREATE TABLE `raker` (
  `raker_id` int(11) NOT NULL,
  `karyawan_id` int(11) NOT NULL,
  `jobdesk_id` int(11) NOT NULL,
  `desk` text NOT NULL,
  `tgl_mulai` datetime NOT NULL,
  `tgl_selesai` datetime DEFAULT NULL,
  `tgl_hari_ini` date DEFAULT NULL,
  `status` varchar(150) NOT NULL,
  `note` text NOT NULL,
  `solusi` text NOT NULL,
  `photo` varchar(150) DEFAULT NULL,
  `nilai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `raker`
--

INSERT INTO `raker` (`raker_id`, `karyawan_id`, `jobdesk_id`, `desk`, `tgl_mulai`, `tgl_selesai`, `tgl_hari_ini`, `status`, `note`, `solusi`, `photo`, `nilai`) VALUES
(148, 45, 6, 'membuat kebun', '2020-12-15 17:23:49', '2020-12-16 17:41:55', '2020-12-15', 'selesai', '', '', '', 0),
(149, 45, 6, 'membuat pasir', '2020-12-15 17:23:49', '2020-12-16 17:23:57', '2020-12-15', 'selesai', '', '', '', 0),
(150, 45, 4, 'membuat teh telor', '2020-12-15 17:23:49', NULL, '2020-12-15', 'progress', 'Ini solusi', 'Eh kebalik wkwkw', '', 0),
(151, 45, 6, 'test', '2020-12-18 09:08:26', NULL, '2020-12-18', 'progress', '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_id`, `name`, `created`, `updated`) VALUES
(1, 'KARYAWAN KONTRAK', '2020-11-17 12:18:31', NULL),
(2, 'FREELAN/BULAN', '2020-11-17 12:18:42', NULL),
(3, 'HARIAN', '2020-11-17 12:18:52', NULL),
(4, 'MAGANG', '2020-11-17 12:19:02', NULL),
(5, 'KARYAWAN MARKETING/BULAN', '2020-11-17 12:19:12', NULL),
(6, 'KARYAWAN TETAP', '2020-11-17 12:19:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `address` text NOT NULL,
  `description` text,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  `perusahaan_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `name`, `phone`, `address`, `description`, `created`, `updated`, `perusahaan_id`) VALUES
(24, 'PT ABC', '123456789', 'Bekasi', 'ABC', '2020-12-02 18:31:15', NULL, 7),
(25, 'PT WAD 1', '123456789', 'bekasi', 'bekasi\r\n', '2020-12-03 05:53:10', '2020-12-08 21:55:42', 21),
(26, 'PT WAD 2', '123456789', 'jakarta', 'SUpllier buku', '2020-12-03 20:17:59', '2020-12-08 21:55:55', 21),
(27, 'Mitra KSP 1', '123456789', 'bekasi', 'test', '2020-12-08 21:57:07', NULL, 8),
(29, 'Bank Kusairi', '08780', 'Jl;..nm,n,,', 'ok', '2020-12-16 08:44:33', NULL, 21);

-- --------------------------------------------------------

--
-- Table structure for table `tambahan`
--

CREATE TABLE `tambahan` (
  `tambahan_id` int(11) NOT NULL,
  `karyawan_id` int(11) NOT NULL,
  `benefit_id` int(11) NOT NULL,
  `besar_tambahan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tambahan`
--

INSERT INTO `tambahan` (`tambahan_id`, `karyawan_id`, `benefit_id`, `besar_tambahan`) VALUES
(12, 94, 1, 100000),
(13, 94, 2, 50000),
(14, 94, 3, 10000);

-- --------------------------------------------------------

--
-- Table structure for table `t_angsuran_supplier`
--

CREATE TABLE `t_angsuran_supplier` (
  `angsuran_id` bigint(20) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `jumlah_bayar` int(11) DEFAULT NULL,
  `denda` float(10,2) DEFAULT NULL,
  `status_angsuran` enum('Diterima','Ditolak','Menunggu Konfirmasi') DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `dk` enum('D','K') DEFAULT NULL,
  `angsuran_ke` bigint(20) DEFAULT NULL,
  `photo_bukti` varchar(255) DEFAULT NULL,
  `pinjaman_id` bigint(20) NOT NULL,
  `akun_id` bigint(20) DEFAULT NULL,
  `kas_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `perusahaan_id` int(11) DEFAULT NULL,
  `tgl_update` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_angsuran_supplier`
--

INSERT INTO `t_angsuran_supplier` (`angsuran_id`, `tgl_bayar`, `jumlah_bayar`, `denda`, `status_angsuran`, `keterangan`, `dk`, `angsuran_ke`, `photo_bukti`, `pinjaman_id`, `akun_id`, `kas_id`, `user_id`, `perusahaan_id`, `tgl_update`) VALUES
(27, '2020-12-08', 1000, NULL, 'Diterima', '1000', 'D', NULL, 'de9127f44a4c2eed51fad66b4e660f35.jpeg', 8, NULL, 40, 1, 21, '2020-12-08 21:51:52');

-- --------------------------------------------------------

--
-- Table structure for table `t_cart`
--

CREATE TABLE `t_cart` (
  `cart_id` int(11) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `discount_item` int(11) DEFAULT '0',
  `total` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `t_kas`
--

CREATE TABLE `t_kas` (
  `kas_id` bigint(20) NOT NULL,
  `tgl_transaksi` datetime NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `jumlah` double NOT NULL,
  `tipe` enum('Pemasukan','Pengeluaran','Transfer') DEFAULT NULL,
  `dari_kas_id` bigint(20) DEFAULT NULL,
  `untuk_kas_id` bigint(20) DEFAULT NULL,
  `akun_id` bigint(20) DEFAULT NULL,
  `dk` enum('D','K') DEFAULT NULL,
  `update_data` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `perusahaan_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_kas`
--

INSERT INTO `t_kas` (`kas_id`, `tgl_transaksi`, `keterangan`, `jumlah`, `tipe`, `dari_kas_id`, `untuk_kas_id`, `akun_id`, `dk`, `update_data`, `user_id`, `perusahaan_id`) VALUES
(1, '2019-04-06 12:00:00', 'Rokok Untuk IT', 36600, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(2, '2019-08-16 12:00:00', 'Minum Proyek MSI', 14100, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(3, '2019-08-16 12:00:00', 'Kas Masuk pembayaran mas dewa', 2200000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(4, '2019-08-17 12:00:00', 'TF Mas Dewa', 2000000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(5, '2019-08-20 12:00:00', 'Kas WAD', 1300000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(6, '2019-08-28 12:00:00', 'Bayar ke mas dewa', 2006500, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(7, '2019-08-28 12:00:00', 'Biaya pasang iklan', 1106500, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(8, '2019-08-28 12:00:00', 'Pergantian Akta WAD', 5500000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(9, '2019-08-30 12:00:00', 'Token WAD', 477884, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(10, '2019-08-30 12:00:00', 'Pengeliuaran WAD', 377000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(11, '2019-09-03 12:00:00', 'Kas Mung Ke lampung', 2000000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(12, '2019-09-04 12:00:00', 'Kopi rokok ke lampung', 78700, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(13, '2019-09-05 12:00:00', 'Pembelian Aqua Cup untuk kantor', 16000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(14, '2019-09-05 12:00:00', 'Pembelian 2 unit Meja dan Kursi Kantor WAD', 3100000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(15, '2019-09-10 12:00:00', 'Tempel WAD ', 240000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(16, '2019-09-10 12:00:00', 'Pulsa internet WAD', 200000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(17, '2019-09-11 12:00:00', 'Wifi WAD', 741763, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(18, '2019-09-16 12:00:00', 'ATK WAD', 78500, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(19, '2019-10-01 12:00:00', 'Stample MSI dan WAD', 360000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(20, '2019-10-07 12:00:00', 'Kas Masuk', 12900000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(21, '2019-10-07 12:00:00', 'Kas WAD', 1000000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(22, '2019-10-07 12:00:00', 'Benner neon box WAD', 3200000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(23, '2019-10-30 12:00:00', 'TF pak RT saiful Bayar IMB rumah kramat', 1006500, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(24, '2020-03-03 12:00:00', 'Uang rokok orang pasang indiehome WAD', 50000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(25, '2020-05-15 12:00:00', 'Bayar Jobstreet pasang iklan WAD', 1683000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(26, '2020-06-10 12:00:00', 'Kas renov kantor WAD', 1005000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(27, '2020-06-10 12:00:00', 'Matrial aqua prof, kasa, dll untuk WAD', 88000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(28, '2020-06-10 12:00:00', 'Matrial untuk WAD', 580000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(29, '2020-06-10 12:00:00', 'Mtrial stop kontak, pipa dll untuk WAD', 337000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(30, '2020-06-10 12:00:00', 'Perjalanan dinas gunawan ke grogol keperluan WAD', 39500, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(31, '2020-06-11 12:00:00', 'Aqua botol untuk pekerja di PT. WAD', 24000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(32, '2020-06-11 12:00:00', 'Isi ulang Aqua Galon', 20000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(33, '2020-06-12 12:00:00', 'Kas untuk bayar tukang dan matrial WAD', 1436000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(34, '2020-06-12 12:00:00', 'Bensin operasional pak gigih urus WAD', 20000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(35, '2020-06-12 12:00:00', 'matrial sprata WAD', 90000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(36, '2020-06-12 12:00:00', 'Bayar tukang WAD', 1200000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(37, '2020-06-15 12:00:00', 'Pembayaran sms gateway WAD', 190050, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(38, '2020-07-22 12:00:00', 'Kunci 2 KANTOR WAD', 35000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(39, '2020-09-03 12:00:00', 'Beli Baso makan siang PT. WAD 8 bungkus', 160000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(40, '2020-09-07 12:00:00', 'Kirim paket WAD ke PT. Telkom', 16000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(41, '2020-10-10 12:00:00', 'untuk yana (google maps)', 3438491, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(42, '2020-10-13 12:00:00', 'untuk yana (creadit card)', 3190000, 'Pengeluaran', NULL, 40, 6, 'K', NULL, 15, 21),
(43, '2020-12-15 00:00:00', '', 100000, 'Pemasukan', 42, NULL, 1, 'D', NULL, 17, 22),
(44, '2020-12-17 00:00:00', 'Dari barang', 1000000, 'Pemasukan', 40, NULL, 6, 'D', NULL, 1, 21);

-- --------------------------------------------------------

--
-- Table structure for table `t_pengajuan_supplier`
--

CREATE TABLE `t_pengajuan_supplier` (
  `pengajuan_id` bigint(20) NOT NULL,
  `no_ajuan` varchar(100) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `jumlah` bigint(20) DEFAULT NULL,
  `status` enum('Setuju','Tolak','Laksanakan','Menunggu','Tunda','Hapus','Lunas') DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `perusahaan_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `kas_id` bigint(20) DEFAULT NULL,
  `tgl_input` date NOT NULL,
  `tgl_cair` date DEFAULT NULL,
  `tgl_update` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_pengajuan_supplier`
--

INSERT INTO `t_pengajuan_supplier` (`pengajuan_id`, `no_ajuan`, `keterangan`, `jumlah`, `status`, `supplier_id`, `user_id`, `perusahaan_id`, `item_id`, `kas_id`, `tgl_input`, `tgl_cair`, `tgl_update`) VALUES
(15, 'PJ-17847', 'weqe', 1000, 'Lunas', 25, 15, 21, 48, 40, '2020-12-08', '2020-12-08', '2020-12-08 14:51:52');

-- --------------------------------------------------------

--
-- Table structure for table `t_pinjaman_supplier`
--

CREATE TABLE `t_pinjaman_supplier` (
  `pinjaman_id` bigint(20) NOT NULL,
  `tgl_pinjam` datetime NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `bunga` float(10,2) DEFAULT NULL,
  `biaya_adm` int(11) DEFAULT NULL,
  `status_lunas` enum('Belum','Lunas','Tidak Aktif') DEFAULT NULL,
  `alasan` varchar(255) DEFAULT NULL,
  `dk` enum('D','K') DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `akun_id` bigint(20) DEFAULT NULL,
  `kas_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `perusahaan_id` int(11) DEFAULT NULL,
  `pengajuan_id` bigint(20) DEFAULT NULL,
  `tgl_update` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_pinjaman_supplier`
--

INSERT INTO `t_pinjaman_supplier` (`pinjaman_id`, `tgl_pinjam`, `jumlah`, `bunga`, `biaya_adm`, `status_lunas`, `alasan`, `dk`, `supplier_id`, `item_id`, `akun_id`, `kas_id`, `user_id`, `perusahaan_id`, `pengajuan_id`, `tgl_update`) VALUES
(8, '2020-12-08 00:00:00', 1000, 0.00, 0, 'Lunas', 'daw', 'K', 25, 48, 19, 40, 1, 21, 15, '2020-12-08 21:50:05');

-- --------------------------------------------------------

--
-- Table structure for table `t_sale`
--

CREATE TABLE `t_sale` (
  `sale_id` int(11) NOT NULL,
  `invoice` varchar(50) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `final_price` int(11) NOT NULL,
  `cash` int(11) NOT NULL,
  `remaining` int(11) NOT NULL,
  `note` text NOT NULL,
  `date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `t_sale`
--
DELIMITER $$
CREATE TRIGGER `del_sale_detail` AFTER DELETE ON `t_sale` FOR EACH ROW BEGIN
    DELETE FROM t_sale_detail
    WHERE sale_id = OLD.sale_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `t_sale_detail`
--

CREATE TABLE `t_sale_detail` (
  `detail_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `discount_item` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `t_sale_detail`
--
DELIMITER $$
CREATE TRIGGER `stock_min` AFTER INSERT ON `t_sale_detail` FOR EACH ROW BEGIN
	UPDATE item SET stock = stock - NEW.qty
    WHERE item_id = NEW.item_id;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `stock_return` AFTER DELETE ON `t_sale_detail` FOR EACH ROW BEGIN
	UPDATE item SET stock = stock + OLD.qty
    WHERE item_id = OLD.item_id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `t_simpanan`
--

CREATE TABLE `t_simpanan` (
  `simpanan_id` bigint(20) NOT NULL,
  `tipe` enum('Setoran','Penarikan') DEFAULT NULL,
  `tgl_transaksi` datetime NOT NULL,
  `jenis_id` int(5) DEFAULT NULL,
  `karyawan_id` int(11) DEFAULT NULL,
  `jumlah` double NOT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `dk` enum('D','K') DEFAULT NULL,
  `nama_kuasa` varchar(255) DEFAULT NULL,
  `identitas_kuasa` varchar(255) DEFAULT NULL,
  `alamat_kuasa` varchar(255) DEFAULT NULL,
  `kas_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `perusahaan_id` int(11) DEFAULT NULL,
  `update_data` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_simpanan`
--

INSERT INTO `t_simpanan` (`simpanan_id`, `tipe`, `tgl_transaksi`, `jenis_id`, `karyawan_id`, `jumlah`, `keterangan`, `dk`, `nama_kuasa`, `identitas_kuasa`, `alamat_kuasa`, `kas_id`, `user_id`, `perusahaan_id`, `update_data`) VALUES
(12, 'Penarikan', '2020-12-08 00:00:00', 56, 93, 40000, '', 'K', ' MEYDA KURNIA EMYLIA PUTRI', '', '', 40, 15, 21, NULL),
(13, 'Setoran', '2020-12-09 00:00:00', 56, 94, 1000, '', 'D', ' MUHAMMAD SAEFUL RAMDAN', '', 'Bogor Tajur Halang', 40, 15, 21, NULL),
(14, 'Setoran', '2020-12-16 00:00:00', 56, 94, 1000000, 'lunas', 'D', 'Albert', '001234', 'Jl . Tapos', 40, 15, 21, NULL),
(15, 'Penarikan', '2020-12-16 00:00:00', 56, 94, 1000000, 'lunas', 'K', 'Muklis', '12345', 'jl, lawe', 40, 15, 21, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `t_stock`
--

CREATE TABLE `t_stock` (
  `stock_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `perusahaan_id` int(11) DEFAULT NULL,
  `type` enum('in','out') NOT NULL,
  `detail` text NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `date` date NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_stock`
--

INSERT INTO `t_stock` (`stock_id`, `item_id`, `perusahaan_id`, `type`, `detail`, `supplier_id`, `qty`, `date`, `created`, `user_id`) VALUES
(82, 49, 8, 'in', 'tambahan', 27, 1, '2020-12-08', '2020-12-08 22:01:45', 13),
(83, 48, 21, 'in', '128', 25, 5, '2020-12-17', '2020-12-16 09:03:19', 15),
(84, 53, 21, 'in', 'ok', 26, 4, '2020-12-16', '2020-12-16 09:06:32', 15),
(85, 48, 21, 'out', 'ok', NULL, 5, '2020-12-15', '2020-12-16 09:07:37', 15),
(86, 53, 21, 'out', 'ok', NULL, 5, '2020-12-16', '2020-12-16 09:08:54', 15);

-- --------------------------------------------------------

--
-- Table structure for table `unit`
--

CREATE TABLE `unit` (
  `unit_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `unit`
--

INSERT INTO `unit` (`unit_id`, `name`, `created`, `updated`) VALUES
(16, 'Kotak', '2020-08-26 00:26:55', NULL),
(17, 'Kaleng', '2020-08-26 00:27:02', NULL),
(18, 'BOX', '2020-08-26 00:27:09', NULL),
(19, 'PCS', '2020-08-26 00:27:14', NULL),
(20, 'Litter', '2020-08-26 00:27:21', NULL),
(21, 'Bal', '2020-08-27 14:19:25', NULL),
(22, 'Dus', '2020-08-27 14:19:35', NULL),
(23, 'Karung', '2020-10-21 12:16:10', NULL),
(24, 'KG', '2020-10-21 12:16:21', NULL),
(25, 'TON', '2020-10-21 12:16:44', NULL),
(26, 'Meter', '2020-10-21 13:16:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `perusahaan_id` int(11) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `level` int(1) NOT NULL,
  `email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `perusahaan_id`, `name`, `address`, `level`, `email`) VALUES
(1, 'admin', 'f865b53623b121fd34ee5426c792e5c33af8c227', NULL, 'Admin Aplikasi', 'Perumahan Sai Residance', 1, 'saepulramdan244@gmail.com'),
(13, 'adminksp', '1cad6287e8530c635cccc7bbae41111cf0fa75a4', 8, 'adminksp', 'Jakarta', 2, ''),
(14, 'adminmws', 'f37f2056058f5765aad23f0113af83ecb15ed4e9', 7, 'adminmws', 'jakarta', 2, ''),
(15, 'adminwad', 'cc18210c7a78b3b5257b2553aa4a2ada18b28cb1', 21, 'adminwad', 'jakarta', 2, 'ramdan_genz@yahoo.com'),
(17, 'adminmsi', '95bff9a893650bc2fbda4153e49cb1f17a8cc701', 22, 'adminmsi', '', 2, 'adminmsi@email.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_sub_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `role_id`, `user_sub_menu`) VALUES
(154, 1, 19),
(155, 1, 18),
(156, 1, 1),
(157, 1, 4),
(158, 1, 5),
(159, 1, 6),
(160, 1, 12),
(161, 1, 14),
(162, 1, 13),
(163, 1, 15),
(164, 1, 16),
(165, 1, 17),
(166, 1, 21),
(167, 1, 22),
(168, 1, 23),
(169, 1, 24),
(170, 1, 25),
(171, 1, 26),
(172, 1, 27),
(173, 1, 28),
(174, 1, 29),
(175, 1, 30),
(176, 1, 20),
(177, 1, 7),
(179, 1, 9),
(181, 2, 4),
(182, 2, 5),
(183, 2, 6),
(185, 2, 13),
(186, 2, 14),
(187, 2, 15),
(188, 2, 16),
(189, 2, 17),
(190, 2, 12),
(191, 2, 21),
(192, 2, 22),
(193, 2, 23),
(194, 2, 24),
(195, 2, 25),
(196, 2, 26),
(197, 2, 28),
(198, 2, 27),
(199, 2, 29),
(200, 2, 30),
(201, 2, 20),
(204, 1, 40),
(205, 1, 41),
(206, 1, 42),
(208, 1, 44),
(209, 1, 45),
(210, 1, 46),
(211, 1, 47),
(212, 1, 48),
(213, 1, 49),
(214, 1, 50),
(215, 1, 51),
(216, 1, 52),
(217, 1, 53),
(218, 1, 54),
(219, 1, 55),
(220, 1, 56),
(221, 1, 57),
(222, 1, 58),
(223, 1, 59),
(224, 1, 60),
(225, 1, 61),
(226, 2, 40),
(227, 2, 41),
(228, 2, 42),
(229, 2, 43),
(230, 2, 44),
(231, 2, 45),
(232, 2, 46),
(233, 2, 47),
(234, 2, 48),
(235, 2, 49),
(236, 2, 50),
(237, 2, 51),
(239, 2, 53),
(240, 2, 54),
(241, 2, 55),
(242, 2, 56),
(243, 2, 57),
(244, 2, 58),
(245, 2, 59),
(246, 2, 60),
(247, 2, 61),
(248, 1, 8),
(249, 1, 62),
(250, 1, 43),
(252, 6, 1),
(253, 1, 63),
(254, 2, 63),
(255, 1, 64),
(256, 2, 64);

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `menu` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `urutan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`, `icon`, `urutan`) VALUES
(1, 'Master Data', 'fa fa-list', 2),
(2, 'Inventory', 'fa fa-cube', 3),
(3, 'Human Resource', 'fa fa-users', 4),
(4, 'Pengaturan', 'fa fa-gears', 13),
(6, 'Akuntansi', 'fa fa-book', 5),
(7, 'Raker', 'fa fa-file', 7),
(8, 'Payroll', 'fa fa-paypal', 6),
(20, 'Simpanan', 'fa fa-circle-o', 8),
(21, 'Transaksi Kas', 'fa fa-circle-o', 9),
(22, 'Pinjaman Supplier', 'fa fa-circle-o', 10),
(23, 'Laporan', 'fa fa-circle-o', 11),
(24, 'Pengumuman', 'fa fa-circle-o', 12);

--
-- Triggers `user_menu`
--
DELIMITER $$
CREATE TRIGGER `des_sub_menu` AFTER DELETE ON `user_menu` FOR EACH ROW BEGIN
    DELETE FROM user_sub_menu
    WHERE menu_id = OLD.id;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Admin Aplikasi'),
(2, 'Admin PT'),
(3, 'HRGA'),
(4, 'Akuntansi'),
(5, 'Manager');

-- --------------------------------------------------------

--
-- Table structure for table `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  `icon` varchar(128) NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Data Perusahaan', 'perusahaan', 'fa fa-circle-o', 1),
(4, 1, 'Data Cabang', 'cabang', 'fa fa-circle-o', 1),
(5, 1, 'Data Supplier', 'supplier', 'fa fa-circle-o', 1),
(6, 1, 'Data Bank', 'bank', 'fa fa-circle-o', 1),
(7, 4, 'Pengaturan User', 'user', 'fa fa-circle-o', 1),
(8, 4, 'History Login', 'history', 'fa fa-circle-o', 1),
(9, 4, 'Backup', 'backup', 'fa fa-circle-o', 1),
(10, 5, 'Manu Parent', 'backup', 'fa fa-circle-o', 1),
(11, 5, 'Sub Menu', 'backup', 'fa fa-circle-o', 1),
(12, 2, 'Data Inventaris', 'item', 'fa fa-circle-o', 1),
(13, 2, 'Item', 'item/item', 'fa fa-circle-o', 1),
(14, 2, 'Categori', 'categori', 'fa fa-circle-o', 1),
(15, 2, 'Unit', 'unit', 'fa fa-circle-o', 1),
(16, 2, 'Stock In', 'stock/stock_in_data', 'fa fa-circle-o', 1),
(17, 2, 'Stock Out', 'stock/stock_out_data', 'fa fa-circle-o', 1),
(18, 4, 'Pengaturan Level', 'level', 'fa fa-circle-o', 1),
(19, 4, 'Pengaturan Menu', 'user_menu', 'fa fa-circle-o', 1),
(20, 7, 'List Raker', 'raker', 'fa fa-circle-o', 1),
(21, 3, 'Status Karyawan', 'status', 'fa fa-circle-o', 1),
(22, 3, 'Jabatan', 'jabatan', 'fa fa-circle-o', 1),
(23, 3, 'Karyawan', 'karyawan', 'fa fa-circle-o', 1),
(24, 3, 'Kehadiran', 'absen', 'fa fa-circle-o', 1),
(25, 8, 'Salary', 'salary', 'fa fa-circle-o', 1),
(26, 8, 'Pinjaman/Kasbon', 'kasbon', 'fa fa-circle-o', 1),
(27, 8, 'Benefit', 'tambahan', 'fa fa-circle-o', 1),
(28, 8, 'Potongan', 'potongan', 'fa fa-circle-o', 1),
(29, 8, 'Categori Benefit', 'benefit', 'fa fa-circle-o', 1),
(30, 8, 'Categori Potongan', 'categoripotongan', 'fa fa-circle-o', 1),
(40, 1, 'Data Kas', 'jeniskas', 'fa fa-circle-o', 1),
(41, 1, 'Data COA', 'jenisakun', 'fa fa-circle-o', 1),
(42, 1, 'Data Lama Angsuran', 'jenisangsuran', 'fa fa-circle-o', 1),
(43, 1, 'Data Jenis Simpanan', 'jenissimpanan', 'fa fa-circle-o', 1),
(44, 20, 'Setoran Tunai', 'simpanan/setoran', 'fa fa-circle-o', 1),
(45, 20, 'Penarikan Tunai', 'simpanan/penarikan', 'fa fa-circle-o', 1),
(46, 21, 'Pemasukan', 'kas/pemasukan', 'fa fa-circle-o', 1),
(47, 21, 'Pengeluaran', 'kas/pengeluaran', 'fa fa-circle-o', 1),
(49, 22, 'Pengajuan', 'pinjaman_supplier/pengajuan', 'fa fa-circle-o', 1),
(50, 22, 'Pinjaman', 'pinjaman_supplier/pinjaman', 'fa fa-circle-o', 1),
(51, 22, 'Angsuran', 'pinjaman_supplier/angsuran', 'fa fa-circle-o', 1),
(52, 22, 'konfirmasi', 'pinjaman_supplier/konfirmasi', 'fa fa-circle-o', 1),
(53, 22, 'Pinjaman Lunas', 'pinjaman_supplier/lunas', 'fa fa-circle-o', 1),
(54, 23, 'Laporan Data Karyawan', 'laporan/lap_karyawan', 'fa fa-circle-o', 0),
(55, 23, 'Laporan Pinjaman Supplier', 'laporan/lap_pinjaman_supplier', 'fa fa-circle-o', 1),
(56, 23, 'Laporan Simpanan', 'laporan/lap_simpanan', 'fa fa-circle-o', 1),
(57, 23, 'Laporan Transaksi Kas', 'laporan/lap_kas', 'fa fa-circle-o', 1),
(58, 23, 'Laporan Saldo Kas', 'laporan/lap_saldo_kas', 'fa fa-circle-o', 1),
(59, 23, 'Laporan Neraca Kas', 'laporan/lap_neraca_saldo', 'fa fa-circle-o', 1),
(60, 23, 'Laporan Buku Besar', 'laporan/lap_buku_besar', 'fa fa-circle-o', 1),
(61, 23, 'Laporan Laba Rugi', 'laporan/lap_laba_rugi', 'fa fa-circle-o', 1),
(62, 4, 'Pengaturan Bahasa', 'bahasa', 'fa fa-circle-o', 1),
(63, 1, 'Data Jobdesk', 'jobdesk', 'fa fa-circle-o', 1),
(64, 24, 'List Pengumuman', 'pengumuman', 'fa fa-circle-o', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE `user_token` (
  `id_user_token` int(11) NOT NULL,
  `email` varchar(150) NOT NULL,
  `token` varchar(150) NOT NULL,
  `create_date` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_token`
--

INSERT INTO `user_token` (`id_user_token`, `email`, `token`, `create_date`) VALUES
(32, 'saepulramdan244@gmail.com', '3fwjDc+XX9LLZtW6N0O1H2D57kYvaEUYtPnfoNQFFhk=', 1607364066);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_hitung_pinjaman_supplier`
-- (See below for the actual view)
--
CREATE TABLE `v_hitung_pinjaman_supplier` (
`pinjaman_id` bigint(20)
,`tgl_pinjam` datetime
,`supplier_id` int(11)
,`jumlah` int(11)
,`bunga` float(10,2)
,`biaya_adm` int(11)
,`status_lunas` enum('Belum','Lunas','Tidak Aktif')
,`dk` enum('D','K')
,`kas_id` bigint(20)
,`perusahaan_id` int(11)
,`nama_perusahaan` varchar(150)
,`pokok_angsuran` int(11)
,`nama_supplier` varchar(100)
,`nama_item` varchar(100)
,`denda` double(10,2)
,`bunga_pinjaman` double(17,0)
,`angsuran_per_bulan` double(17,0)
,`tagihan` double(17,0)
,`alasan` varchar(255)
,`item_id` int(11)
,`bln_sudah_angsur` bigint(21)
,`jumlah_bayar` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_stock_perusahaan`
-- (See below for the actual view)
--
CREATE TABLE `v_stock_perusahaan` (
`item_id` int(11)
,`perusahaan_id` int(11)
,`nama_perusahaan` varchar(150)
,`nama_item` varchar(100)
,`barcode` varchar(100)
,`price` int(10)
,`nama_categori` varchar(100)
,`nama_unit` varchar(100)
,`in` decimal(32,0)
,`out` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_transaksi`
-- (See below for the actual view)
--
CREATE TABLE `v_transaksi` (
`tbl` varchar(17)
,`id` bigint(20)
,`tgl` datetime
,`kredit` double
,`debet` double
,`dari_kas` bigint(20)
,`untuk_kas` bigint(20)
,`transaksi` bigint(20)
,`ket` varchar(255)
,`perusahaan` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `v_hitung_pinjaman_supplier`
--
DROP TABLE IF EXISTS `v_hitung_pinjaman_supplier`;

CREATE ALGORITHM=UNDEFINED DEFINER=`wahy1212`@`localhost` SQL SECURITY DEFINER VIEW `v_hitung_pinjaman_supplier`  AS  select `t_pinjaman_supplier`.`pinjaman_id` AS `pinjaman_id`,`t_pinjaman_supplier`.`tgl_pinjam` AS `tgl_pinjam`,`t_pinjaman_supplier`.`supplier_id` AS `supplier_id`,`t_pinjaman_supplier`.`jumlah` AS `jumlah`,`t_pinjaman_supplier`.`bunga` AS `bunga`,`t_pinjaman_supplier`.`biaya_adm` AS `biaya_adm`,`t_pinjaman_supplier`.`status_lunas` AS `status_lunas`,`t_pinjaman_supplier`.`dk` AS `dk`,`t_pinjaman_supplier`.`kas_id` AS `kas_id`,`t_pinjaman_supplier`.`perusahaan_id` AS `perusahaan_id`,`perusahaan`.`name` AS `nama_perusahaan`,`t_pinjaman_supplier`.`jumlah` AS `pokok_angsuran`,`supplier`.`name` AS `nama_supplier`,`item`.`name` AS `nama_item`,ifnull(`t_angsuran_supplier`.`denda`,0) AS `denda`,round(ceiling(((`t_pinjaman_supplier`.`jumlah` * `t_pinjaman_supplier`.`bunga`) / 100)),-(2)) AS `bunga_pinjaman`,round(ceiling(((((((`t_pinjaman_supplier`.`jumlah` * `t_pinjaman_supplier`.`bunga`) / 100) + `t_pinjaman_supplier`.`jumlah`) + `t_pinjaman_supplier`.`biaya_adm`) * 100) / 100)),-(2)) AS `angsuran_per_bulan`,round(ceiling(((((((`t_pinjaman_supplier`.`jumlah` * `t_pinjaman_supplier`.`bunga`) / 100) + `t_pinjaman_supplier`.`jumlah`) + `t_pinjaman_supplier`.`biaya_adm`) * 100) / 100)),-(2)) AS `tagihan`,`t_pinjaman_supplier`.`alasan` AS `alasan`,`t_pinjaman_supplier`.`item_id` AS `item_id`,ifnull(count(`t_angsuran_supplier`.`angsuran_id`),0) AS `bln_sudah_angsur`,sum((case when (`t_angsuran_supplier`.`status_angsuran` <> 'Ditolak') then `t_angsuran_supplier`.`jumlah_bayar` else 0 end)) AS `jumlah_bayar` from ((((`t_pinjaman_supplier` left join `t_angsuran_supplier` on((`t_pinjaman_supplier`.`pinjaman_id` = `t_angsuran_supplier`.`pinjaman_id`))) left join `perusahaan` on((`t_pinjaman_supplier`.`perusahaan_id` = `perusahaan`.`perusahaan_id`))) left join `supplier` on((`t_pinjaman_supplier`.`supplier_id` = `supplier`.`supplier_id`))) left join `item` on((`t_pinjaman_supplier`.`item_id` = `item`.`item_id`))) group by `t_pinjaman_supplier`.`pinjaman_id` ;

-- --------------------------------------------------------

--
-- Structure for view `v_stock_perusahaan`
--
DROP TABLE IF EXISTS `v_stock_perusahaan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`wahy1212`@`localhost` SQL SECURITY DEFINER VIEW `v_stock_perusahaan`  AS  select `t_stock`.`item_id` AS `item_id`,`t_stock`.`perusahaan_id` AS `perusahaan_id`,`perusahaan`.`name` AS `nama_perusahaan`,`item`.`name` AS `nama_item`,`item`.`barcode` AS `barcode`,`item`.`price` AS `price`,`categori`.`name` AS `nama_categori`,`unit`.`name` AS `nama_unit`,sum(if((`t_stock`.`type` like 'in%'),`t_stock`.`qty`,0)) AS `in`,sum(if((`t_stock`.`type` like 'out%'),`t_stock`.`qty`,0)) AS `out` from ((((`t_stock` join `item` on((`item`.`item_id` = `t_stock`.`item_id`))) join `categori` on((`categori`.`categori_id` = `item`.`categori_id`))) join `unit` on((`unit`.`unit_id` = `item`.`unit_id`))) join `perusahaan` on((`perusahaan`.`perusahaan_id` = `t_stock`.`perusahaan_id`))) group by `t_stock`.`item_id`,`t_stock`.`perusahaan_id` ;

-- --------------------------------------------------------

--
-- Structure for view `v_transaksi`
--
DROP TABLE IF EXISTS `v_transaksi`;

CREATE ALGORITHM=UNDEFINED DEFINER=`wahy1212`@`localhost` SQL SECURITY DEFINER VIEW `v_transaksi`  AS  select 'pinjaman_supplier' AS `tbl`,`t_pinjaman_supplier`.`pinjaman_id` AS `id`,`t_pinjaman_supplier`.`tgl_pinjam` AS `tgl`,`t_pinjaman_supplier`.`jumlah` AS `kredit`,0 AS `debet`,`t_pinjaman_supplier`.`kas_id` AS `dari_kas`,NULL AS `untuk_kas`,`t_pinjaman_supplier`.`akun_id` AS `transaksi`,`t_pinjaman_supplier`.`alasan` AS `ket`,`t_pinjaman_supplier`.`perusahaan_id` AS `perusahaan` from `t_pinjaman_supplier` where (`t_pinjaman_supplier`.`status_lunas` <> 'Tidak Aktif') union select 'angsuran_supplier' AS `tbl`,`t_angsuran_supplier`.`angsuran_id` AS `id`,`t_angsuran_supplier`.`tgl_bayar` AS `tgl`,0 AS `kredit`,`t_angsuran_supplier`.`jumlah_bayar` AS `debet`,NULL AS `dari_kas`,`t_angsuran_supplier`.`kas_id` AS `untuk_kas`,`t_angsuran_supplier`.`akun_id` AS `transaksi`,`t_angsuran_supplier`.`keterangan` AS `ket`,`t_angsuran_supplier`.`perusahaan_id` AS `perusahaan` from `t_angsuran_supplier` where (`t_angsuran_supplier`.`status_angsuran` = 'Diterima') union select 'simpanan' AS `tbl`,`t_simpanan`.`simpanan_id` AS `id`,`t_simpanan`.`tgl_transaksi` AS `tgl`,if((`t_simpanan`.`dk` = 'K'),`t_simpanan`.`jumlah`,0) AS `kredit`,if((`t_simpanan`.`dk` = 'D'),`t_simpanan`.`jumlah`,0) AS `debet`,if((`t_simpanan`.`dk` = 'K'),`t_simpanan`.`kas_id`,NULL) AS `dari_kas`,if((`t_simpanan`.`dk` = 'D'),`t_simpanan`.`kas_id`,NULL) AS `untuk_kas`,`t_simpanan`.`jenis_id` AS `transaksi`,`t_simpanan`.`keterangan` AS `ket`,`t_simpanan`.`perusahaan_id` AS `perusahaan` from `t_simpanan` union select 'kas' AS `tbl`,`t_kas`.`kas_id` AS `id`,`t_kas`.`tgl_transaksi` AS `tgl`,if((`t_kas`.`dk` = 'K'),`t_kas`.`jumlah`,if(isnull(`t_kas`.`dk`),`t_kas`.`jumlah`,0)) AS `kredit`,if((`t_kas`.`dk` = 'D'),`t_kas`.`jumlah`,if(isnull(`t_kas`.`dk`),`t_kas`.`jumlah`,0)) AS `debet`,`t_kas`.`dari_kas_id` AS `dari_kas`,`t_kas`.`untuk_kas_id` AS `untuk_kas`,`t_kas`.`akun_id` AS `transaksi`,`t_kas`.`keterangan` AS `ket`,`t_kas`.`perusahaan_id` AS `perusahaan` from `t_kas` order by `tgl` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absen`
--
ALTER TABLE `absen`
  ADD PRIMARY KEY (`absen_id`);

--
-- Indexes for table `akses_pt`
--
ALTER TABLE `akses_pt`
  ADD PRIMARY KEY (`akses_pt_id`);

--
-- Indexes for table `bahasa`
--
ALTER TABLE `bahasa`
  ADD PRIMARY KEY (`bahasa_id`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`bank_id`);

--
-- Indexes for table `benefit`
--
ALTER TABLE `benefit`
  ADD PRIMARY KEY (`benefit_id`);

--
-- Indexes for table `cabang`
--
ALTER TABLE `cabang`
  ADD PRIMARY KEY (`cabang_id`);

--
-- Indexes for table `categori`
--
ALTER TABLE `categori`
  ADD PRIMARY KEY (`categori_id`);

--
-- Indexes for table `categoripotongan`
--
ALTER TABLE `categoripotongan`
  ADD PRIMARY KEY (`categoripotongan_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `pasar_id` (`pasar_id`);

--
-- Indexes for table `detail_jobdesk`
--
ALTER TABLE `detail_jobdesk`
  ADD PRIMARY KEY (`detail_jobdesk_id`),
  ADD KEY `jobdesk_id` (`jobdesk_id`);

--
-- Indexes for table `history_karyawan`
--
ALTER TABLE `history_karyawan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`item_id`),
  ADD UNIQUE KEY `barcode` (`barcode`),
  ADD KEY `categori_id` (`categori_id`),
  ADD KEY `item_ibfk_2` (`unit_id`),
  ADD KEY `perusahaan_id` (`perusahaan_id`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`jabatan_id`);

--
-- Indexes for table `jns_akun`
--
ALTER TABLE `jns_akun`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jns_angsuran`
--
ALTER TABLE `jns_angsuran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jns_kas`
--
ALTER TABLE `jns_kas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jns_simpanan`
--
ALTER TABLE `jns_simpanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobdesk`
--
ALTER TABLE `jobdesk`
  ADD PRIMARY KEY (`jobdesk_id`);

--
-- Indexes for table `kamus`
--
ALTER TABLE `kamus`
  ADD PRIMARY KEY (`kamus_id`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`karyawan_id`),
  ADD KEY `status_id` (`status_id`),
  ADD KEY `bank_id` (`bank_id`),
  ADD KEY `perusahaan_id` (`perusahaan_id`),
  ADD KEY `jabatan_id` (`jabatan_id`);

--
-- Indexes for table `kasbon`
--
ALTER TABLE `kasbon`
  ADD PRIMARY KEY (`kasbon_id`);

--
-- Indexes for table `pasar`
--
ALTER TABLE `pasar`
  ADD PRIMARY KEY (`pasar_id`);

--
-- Indexes for table `pengumuman`
--
ALTER TABLE `pengumuman`
  ADD PRIMARY KEY (`pengumuman_id`);

--
-- Indexes for table `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD PRIMARY KEY (`perusahaan_id`);

--
-- Indexes for table `potongan`
--
ALTER TABLE `potongan`
  ADD PRIMARY KEY (`potongan_id`),
  ADD KEY `categoripotongan_id` (`categoripotongan_id`);

--
-- Indexes for table `raker`
--
ALTER TABLE `raker`
  ADD PRIMARY KEY (`raker_id`),
  ADD KEY `jobdesk_id` (`jobdesk_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `tambahan`
--
ALTER TABLE `tambahan`
  ADD PRIMARY KEY (`tambahan_id`),
  ADD KEY `benefit_id` (`benefit_id`);

--
-- Indexes for table `t_angsuran_supplier`
--
ALTER TABLE `t_angsuran_supplier`
  ADD PRIMARY KEY (`angsuran_id`),
  ADD KEY `t_pinjaman_supplier_FK` (`akun_id`) USING BTREE,
  ADD KEY `t_pinjaman_supplier_FK_1` (`kas_id`) USING BTREE,
  ADD KEY `t_pinjaman_supplier_FK_2` (`user_id`) USING BTREE,
  ADD KEY `t_pinjaman_supplier_FK_5` (`perusahaan_id`) USING BTREE,
  ADD KEY `t_angsuran_supplier_FK` (`pinjaman_id`);

--
-- Indexes for table `t_cart`
--
ALTER TABLE `t_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `t_kas`
--
ALTER TABLE `t_kas`
  ADD PRIMARY KEY (`kas_id`),
  ADD KEY `t_kas_FK` (`akun_id`),
  ADD KEY `t_kas_FK_1` (`dari_kas_id`),
  ADD KEY `t_kas_FK_2` (`untuk_kas_id`),
  ADD KEY `t_kas_FK_3` (`user_id`),
  ADD KEY `t_kas_FK_4` (`perusahaan_id`);

--
-- Indexes for table `t_pengajuan_supplier`
--
ALTER TABLE `t_pengajuan_supplier`
  ADD PRIMARY KEY (`pengajuan_id`),
  ADD KEY `t_pengajuan_supplier_FK` (`user_id`),
  ADD KEY `t_pengajuan_supplier_FK_1` (`supplier_id`),
  ADD KEY `t_pengajuan_supplier_FK_2` (`perusahaan_id`),
  ADD KEY `t_pengajuan_supplier_FK_4` (`item_id`),
  ADD KEY `t_pengajuan_supplier_FK_3` (`kas_id`);

--
-- Indexes for table `t_pinjaman_supplier`
--
ALTER TABLE `t_pinjaman_supplier`
  ADD PRIMARY KEY (`pinjaman_id`),
  ADD KEY `t_pinjaman_supplier_FK` (`akun_id`),
  ADD KEY `t_pinjaman_supplier_FK_1` (`kas_id`),
  ADD KEY `t_pinjaman_supplier_FK_2` (`user_id`),
  ADD KEY `t_pinjaman_supplier_FK_3` (`item_id`),
  ADD KEY `t_pinjaman_supplier_FK_4` (`pengajuan_id`),
  ADD KEY `t_pinjaman_supplier_FK_5` (`perusahaan_id`),
  ADD KEY `t_pinjaman_supplier_FK_6` (`supplier_id`);

--
-- Indexes for table `t_sale`
--
ALTER TABLE `t_sale`
  ADD PRIMARY KEY (`sale_id`);

--
-- Indexes for table `t_sale_detail`
--
ALTER TABLE `t_sale_detail`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `t_simpanan`
--
ALTER TABLE `t_simpanan`
  ADD PRIMARY KEY (`simpanan_id`),
  ADD KEY `t_simpanan_FK` (`user_id`),
  ADD KEY `t_simpanan_FK_1` (`perusahaan_id`),
  ADD KEY `t_simpanan_FK_2` (`jenis_id`),
  ADD KEY `t_simpanan_FK_3` (`kas_id`);

--
-- Indexes for table `t_stock`
--
ALTER TABLE `t_stock`
  ADD PRIMARY KEY (`stock_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `kapal_id` (`perusahaan_id`);

--
-- Indexes for table `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`unit_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `level` (`level`),
  ADD KEY `perusahaan_id` (`perusahaan_id`);

--
-- Indexes for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id_user_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absen`
--
ALTER TABLE `absen`
  MODIFY `absen_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `akses_pt`
--
ALTER TABLE `akses_pt`
  MODIFY `akses_pt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `bahasa`
--
ALTER TABLE `bahasa`
  MODIFY `bahasa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `bank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `benefit`
--
ALTER TABLE `benefit`
  MODIFY `benefit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cabang`
--
ALTER TABLE `cabang`
  MODIFY `cabang_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categori`
--
ALTER TABLE `categori`
  MODIFY `categori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `categoripotongan`
--
ALTER TABLE `categoripotongan`
  MODIFY `categoripotongan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `detail_jobdesk`
--
ALTER TABLE `detail_jobdesk`
  MODIFY `detail_jobdesk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `history_karyawan`
--
ALTER TABLE `history_karyawan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1027;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `jabatan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `jns_akun`
--
ALTER TABLE `jns_akun`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `jns_angsuran`
--
ALTER TABLE `jns_angsuran`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `jns_kas`
--
ALTER TABLE `jns_kas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `jns_simpanan`
--
ALTER TABLE `jns_simpanan`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `jobdesk`
--
ALTER TABLE `jobdesk`
  MODIFY `jobdesk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `kamus`
--
ALTER TABLE `kamus`
  MODIFY `kamus_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `karyawan`
--
ALTER TABLE `karyawan`
  MODIFY `karyawan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `kasbon`
--
ALTER TABLE `kasbon`
  MODIFY `kasbon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pasar`
--
ALTER TABLE `pasar`
  MODIFY `pasar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pengumuman`
--
ALTER TABLE `pengumuman`
  MODIFY `pengumuman_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `perusahaan`
--
ALTER TABLE `perusahaan`
  MODIFY `perusahaan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `potongan`
--
ALTER TABLE `potongan`
  MODIFY `potongan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `raker`
--
ALTER TABLE `raker`
  MODIFY `raker_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `tambahan`
--
ALTER TABLE `tambahan`
  MODIFY `tambahan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `t_angsuran_supplier`
--
ALTER TABLE `t_angsuran_supplier`
  MODIFY `angsuran_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `t_kas`
--
ALTER TABLE `t_kas`
  MODIFY `kas_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `t_pengajuan_supplier`
--
ALTER TABLE `t_pengajuan_supplier`
  MODIFY `pengajuan_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `t_pinjaman_supplier`
--
ALTER TABLE `t_pinjaman_supplier`
  MODIFY `pinjaman_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `t_sale`
--
ALTER TABLE `t_sale`
  MODIFY `sale_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `t_sale_detail`
--
ALTER TABLE `t_sale_detail`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `t_simpanan`
--
ALTER TABLE `t_simpanan`
  MODIFY `simpanan_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `t_stock`
--
ALTER TABLE `t_stock`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `unit`
--
ALTER TABLE `unit`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=257;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id_user_token` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`pasar_id`) REFERENCES `pasar` (`pasar_id`);

--
-- Constraints for table `detail_jobdesk`
--
ALTER TABLE `detail_jobdesk`
  ADD CONSTRAINT `detail_jobdesk_ibfk_1` FOREIGN KEY (`jobdesk_id`) REFERENCES `jobdesk` (`jobdesk_id`);

--
-- Constraints for table `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`categori_id`) REFERENCES `categori` (`categori_id`),
  ADD CONSTRAINT `item_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`unit_id`),
  ADD CONSTRAINT `item_ibfk_3` FOREIGN KEY (`perusahaan_id`) REFERENCES `perusahaan` (`perusahaan_id`);

--
-- Constraints for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`perusahaan_id`) REFERENCES `perusahaan` (`perusahaan_id`),
  ADD CONSTRAINT `karyawan_ibfk_2` FOREIGN KEY (`jabatan_id`) REFERENCES `jabatan` (`jabatan_id`);

--
-- Constraints for table `potongan`
--
ALTER TABLE `potongan`
  ADD CONSTRAINT `potongan_ibfk_1` FOREIGN KEY (`categoripotongan_id`) REFERENCES `categoripotongan` (`categoripotongan_id`);

--
-- Constraints for table `raker`
--
ALTER TABLE `raker`
  ADD CONSTRAINT `raker_ibfk_1` FOREIGN KEY (`jobdesk_id`) REFERENCES `jobdesk` (`jobdesk_id`);

--
-- Constraints for table `tambahan`
--
ALTER TABLE `tambahan`
  ADD CONSTRAINT `tambahan_ibfk_1` FOREIGN KEY (`benefit_id`) REFERENCES `benefit` (`benefit_id`);

--
-- Constraints for table `t_angsuran_supplier`
--
ALTER TABLE `t_angsuran_supplier`
  ADD CONSTRAINT `t_angsuran_supplier_FK` FOREIGN KEY (`pinjaman_id`) REFERENCES `t_pinjaman_supplier` (`pinjaman_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_pinjaman_supplier_FK_1_copy` FOREIGN KEY (`kas_id`) REFERENCES `jns_kas` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_pinjaman_supplier_FK_2_copy` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_pinjaman_supplier_FK_5_copy` FOREIGN KEY (`perusahaan_id`) REFERENCES `perusahaan` (`perusahaan_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_pinjaman_supplier_FK_copy` FOREIGN KEY (`akun_id`) REFERENCES `jns_akun` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `t_cart`
--
ALTER TABLE `t_cart`
  ADD CONSTRAINT `t_cart_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `t_cart_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `t_kas`
--
ALTER TABLE `t_kas`
  ADD CONSTRAINT `t_kas_FK` FOREIGN KEY (`akun_id`) REFERENCES `jns_akun` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_kas_FK_1` FOREIGN KEY (`dari_kas_id`) REFERENCES `jns_kas` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_kas_FK_2` FOREIGN KEY (`untuk_kas_id`) REFERENCES `jns_kas` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_kas_FK_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_kas_FK_4` FOREIGN KEY (`perusahaan_id`) REFERENCES `perusahaan` (`perusahaan_id`) ON UPDATE CASCADE;

--
-- Constraints for table `t_pengajuan_supplier`
--
ALTER TABLE `t_pengajuan_supplier`
  ADD CONSTRAINT `t_pengajuan_supplier_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_pengajuan_supplier_FK_1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_pengajuan_supplier_FK_2` FOREIGN KEY (`perusahaan_id`) REFERENCES `perusahaan` (`perusahaan_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_pengajuan_supplier_FK_3` FOREIGN KEY (`kas_id`) REFERENCES `jns_kas` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_pengajuan_supplier_FK_4` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON UPDATE CASCADE;

--
-- Constraints for table `t_pinjaman_supplier`
--
ALTER TABLE `t_pinjaman_supplier`
  ADD CONSTRAINT `t_pinjaman_supplier_FK` FOREIGN KEY (`akun_id`) REFERENCES `jns_akun` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_pinjaman_supplier_FK_1` FOREIGN KEY (`kas_id`) REFERENCES `jns_kas` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_pinjaman_supplier_FK_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_pinjaman_supplier_FK_3` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_pinjaman_supplier_FK_4` FOREIGN KEY (`pengajuan_id`) REFERENCES `t_pengajuan_supplier` (`pengajuan_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_pinjaman_supplier_FK_5` FOREIGN KEY (`perusahaan_id`) REFERENCES `perusahaan` (`perusahaan_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_pinjaman_supplier_FK_6` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`) ON UPDATE CASCADE;

--
-- Constraints for table `t_sale_detail`
--
ALTER TABLE `t_sale_detail`
  ADD CONSTRAINT `t_sale_detail_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`);

--
-- Constraints for table `t_simpanan`
--
ALTER TABLE `t_simpanan`
  ADD CONSTRAINT `t_simpanan_FK` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_simpanan_FK_1` FOREIGN KEY (`perusahaan_id`) REFERENCES `perusahaan` (`perusahaan_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_simpanan_FK_2` FOREIGN KEY (`jenis_id`) REFERENCES `jns_simpanan` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `t_simpanan_FK_3` FOREIGN KEY (`kas_id`) REFERENCES `jns_kas` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `t_stock`
--
ALTER TABLE `t_stock`
  ADD CONSTRAINT `t_stock_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `t_stock_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`),
  ADD CONSTRAINT `t_stock_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `t_stock_ibfk_4` FOREIGN KEY (`perusahaan_id`) REFERENCES `perusahaan` (`perusahaan_id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`level`) REFERENCES `user_role` (`id`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`perusahaan_id`) REFERENCES `perusahaan` (`perusahaan_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
