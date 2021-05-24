-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 20, 2020 at 01:20 PM
-- Server version: 10.2.30-MariaDB
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
-- Database: `u5044450_warehouse`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'Kimia Farma', '1571216784.jpg', '2019-10-16 09:06:24', '2019-10-16 09:06:24'),
(2, 'PT. Indofoods', '1571217615.jpg', '2019-10-16 09:08:58', '2019-10-16 09:20:15'),
(5, 'Meiyume', '1571389793.jpg', '2019-10-18 09:09:53', '2019-10-18 09:09:53'),
(6, 'LPC 1', '1571390444.jpg', '2019-10-18 09:20:44', '2019-10-18 09:20:44'),
(7, 'AMA', '1571390461.jpg', '2019-10-18 09:21:01', '2019-10-18 09:21:01'),
(8, 'Corpac', '1571390483.png', '2019-10-18 09:21:23', '2019-10-18 09:21:23'),
(9, 'OSA', '1571650298.jpg', '2019-10-21 09:31:38', '2019-10-21 09:31:38'),
(10, 'Company Int', '1572255408.jpg', '2019-10-28 09:36:48', '2019-10-28 09:36:48'),
(11, 'PT. Kalbe Farma', '1572399991.jpg', '2019-10-30 01:46:31', '2019-10-30 01:46:31'),
(13, 'PT. Alvindo Raja Pratama', NULL, '2019-12-06 07:34:33', '2019-12-06 07:34:33'),
(14, 'PT. Tetra Pak Stainless Equipment', NULL, '2019-12-09 02:46:08', '2019-12-09 02:46:08'),
(15, 'PT. JETEC INDONESIA', NULL, '2019-12-09 02:53:08', '2019-12-09 02:53:08'),
(16, 'PT. AQUA Bekasi', NULL, '2019-12-13 07:40:03', '2019-12-13 07:40:03'),
(17, 'PT. SKF Industrial Indonesia', NULL, '2019-12-13 07:55:25', '2019-12-13 07:55:25'),
(18, 'PT. SUTO iTEC Indonesia', NULL, '2019-12-23 06:51:01', '2019-12-23 06:51:01'),
(19, 'PT. GEA Westfalia Separator Indonesia', NULL, '2020-01-06 03:39:29', '2020-01-06 03:39:29'),
(20, 'PT. Tirta Investama Plant Subang', NULL, '2020-01-24 07:14:19', '2020-01-24 07:14:19'),
(21, 'Pak Ari', NULL, '2020-01-24 07:24:32', '2020-01-24 07:24:32'),
(22, 'PT. Sinergy Tehnik Utama', NULL, '2020-01-24 07:26:11', '2020-01-24 07:26:11'),
(23, 'PT. GEA - SINGAPORE', NULL, '2020-01-27 01:26:17', '2020-01-27 01:26:17'),
(24, 'PT. ANGKASA PURA SOLUSI', NULL, '2020-01-27 02:02:06', '2020-01-27 02:02:06'),
(25, 'PT. ABB CEMS SURALAYA', NULL, '2020-02-04 02:36:13', '2020-02-14 07:14:32'),
(26, 'PT. PARAMITA BANGUN SARANA,Tbk', NULL, '2020-02-18 02:14:19', '2020-02-18 02:14:19');

-- --------------------------------------------------------

--
-- Table structure for table `departements`
--

CREATE TABLE `departements` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departements`
--

INSERT INTO `departements` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'CEO', NULL, NULL, '2019-10-16 09:27:08'),
(46, 'ROOT', 'All Access Granted', '2019-10-15 05:04:29', '2019-10-15 05:13:44'),
(51, 'SALES', NULL, '2020-01-27 06:54:49', '2020-01-27 06:54:49'),
(52, 'PRODUKSI', NULL, '2020-01-27 06:57:13', '2020-01-27 06:57:13'),
(53, 'Gudang', NULL, '2020-01-27 06:58:15', '2020-01-27 06:58:15');

-- --------------------------------------------------------

--
-- Table structure for table `departement_privilege`
--

CREATE TABLE `departement_privilege` (
  `id` bigint(10) UNSIGNED NOT NULL,
  `privilege_id` int(10) UNSIGNED NOT NULL,
  `departement_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `departement_privilege`
--

INSERT INTO `departement_privilege` (`id`, `privilege_id`, `departement_id`, `created_at`, `updated_at`) VALUES
(23, 10, 22, NULL, NULL),
(24, 13, 22, NULL, NULL),
(25, 15, 23, NULL, NULL),
(26, 10, 25, NULL, NULL),
(27, 10, 26, NULL, NULL),
(29, 8, 28, NULL, NULL),
(30, 8, 29, NULL, NULL),
(31, 8, 30, NULL, NULL),
(32, 8, 31, NULL, NULL),
(52, 7, 37, NULL, NULL),
(167, 15, 46, NULL, NULL),
(170, 7, 1, NULL, NULL),
(171, 8, 1, NULL, NULL),
(172, 9, 1, NULL, NULL),
(173, 10, 1, NULL, NULL),
(174, 11, 1, NULL, NULL),
(175, 12, 1, NULL, NULL),
(176, 13, 1, NULL, NULL),
(177, 14, 1, NULL, NULL),
(178, 15, 1, NULL, NULL),
(179, 16, 1, NULL, NULL),
(180, 17, 1, NULL, NULL),
(181, 18, 1, NULL, NULL),
(182, 19, 1, NULL, NULL),
(183, 20, 1, NULL, NULL),
(184, 21, 1, NULL, NULL),
(185, 22, 1, NULL, NULL),
(186, 23, 1, NULL, NULL),
(259, 7, 51, NULL, NULL),
(260, 12, 51, NULL, NULL),
(261, 16, 51, NULL, NULL),
(262, 17, 51, NULL, NULL),
(263, 18, 51, NULL, NULL),
(264, 19, 51, NULL, NULL),
(265, 20, 51, NULL, NULL),
(266, 21, 51, NULL, NULL),
(267, 22, 51, NULL, NULL),
(268, 7, 52, NULL, NULL),
(269, 7, 53, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mfg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `disc` int(11) DEFAULT NULL,
  `total_cost` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `description`, `type`, `mfg`, `qty`, `unit`, `price`, `disc`, `total_cost`, `created_at`, `updated_at`, `user_id`) VALUES
(1405, 'DOUBLE TAPE 3M', NULL, '3M', NULL, 'PCS', 30000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1406, 'Solenoid valve Blanking Plate', 'P-200MR2', 'Airtec', NULL, 'Pcs', 20000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1407, 'Tuning Elbow Male Connector dia 1/2\" 10mm', 'PL1004D', 'Airtec', NULL, 'Pcs', 67000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1408, 'Tubing Elbow Connector 1/4\" 10mm(bless)', 'PL1002B', 'Airtech', NULL, 'pcs', 45000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1409, 'Filter Regulator 1/2\"', 'GFR30015F3G', 'Airtech', NULL, 'pcs', 900000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1410, 'Tubing male Connector 1/4\" 10mm', 'PC602D', 'Airtech', NULL, 'pcs', 30000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1411, 'Manifold 3 Station', '200M3F', 'Airtech', NULL, 'pcs', 310000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1412, 'Manifold 8 Station', '200M8F', 'Airtech', NULL, 'pcs', 680000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1413, 'Tubing Hose 6mm', 'US98A06004010MBU', 'Airtech', NULL, 'M', 13000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1414, 'Solenoid Valve 1/4\" 5/2-Way 24Vdc', '4V21008BG', 'Airtech', NULL, 'pcs', 600000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1415, 'Tubing Universal Silencer 1/4\"', 'BSL02', 'Airtech', NULL, 'pcs', 37500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1416, 'CLX Empty Slot Filler for 1756 Chassis', '1756-N2', 'Allen-Bradley', NULL, 'pcs', 281000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1417, 'CLX Screw Clamp Block 20 Pin NemA ', '1756-TBNH', 'Allen-Bradley', NULL, 'pcs', 684000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1418, 'CLX 36 Pin Screw Clamp Block With Standard Housing', '1756-TBCH', 'Allen-Bradley', NULL, 'pcs', 847000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1419, 'Conversion Module for 1771 to 1756 I/O Field Wiring Conversion System', '1492-CM1771-LA003', 'Allen-Bradley', NULL, 'pcs', 1272000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1420, 'Conversion Cable for 1771 to 1756 I/O Field Wiring Conversion System, 0.5 meters', '1492-CONACAB005E8C', 'Allen-Bradley', NULL, 'pcs', 1283000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1421, 'Conversion Module for 1771 to 1756 I/O Field Wiring Conversion System', '1492-CM1771-LD006', 'Allen-Bradley', NULL, 'pcs', 1283000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1422, 'Conversion Module for 1771 to 1756 I/O Field Wiring Conversion System', '1492-CM1771-LD003', 'Allen-Bradley', NULL, 'pcs', 1350000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1423, 'Conversion Module for 1771 to 1756 I/O Field Wiring Conversion System', '1492-CM1771-LD009F', 'Allen-Bradley', NULL, 'pcs', 1350000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1424, 'Conversion Module for 1771 to 1756 I/O Field Wiring Conversion System', '1492-CM1771-LA002', 'Allen-Bradley', NULL, 'pcs', 1362000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1425, 'Conversion Module for 1771 to 1756 I/O Field Wiring Conversion System', '1492-CM1771-LA001', 'Allen-Bradley', NULL, 'pcs', 1362000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1426, 'Industrial Switch, Unmanaged, 5 Ports, RJ45 Copper 24VDC', '1783-US5T', 'Allen-Bradley', NULL, 'Pcs', 1402200, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1427, 'Conversion Cable for 1771 to 1756 I/O Field Wiring Conversion System, 0.5 meters', '1492-CONCAB005X', 'Allen-Bradley', NULL, 'pcs', 1497000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1428, 'Conversion Module for 1771 to 1756 I/O Field Wiring Conversion System', '1492-CM1771-LD011', 'Allen-Bradley', NULL, 'pcs', 1497000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1429, 'Mounting Assembly for 1771 to 1756 I/O Field Wiring Conversion System, 7 or 10 slot chassis', '1492-MUA2B-A7-A10', 'Allen-Bradley', NULL, 'pcs', 1677000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1430, 'Flex I/O Terminal Base', '1794-TB3', 'Allen-Bradley', NULL, 'pcs', 1859000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1431, 'Conversion Cable for 1771 to 1756 I/O Field Wiring Conversion System, 0.5 meters', '1492-CONACAB005D', 'Allen-Bradley', NULL, 'pcs', 1924000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1432, 'Conversion Cable for 1771 to 1756 I/O Field Wiring Conversion System, 0.5 meters', '1492-CONACAB005A', 'Allen-Bradley', NULL, 'pcs', 1924000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1433, 'Industrial Switch, Unmanaged, 8 Ports, RJ45 Copper 24VDC', '1783-US8T', 'Allen-Bradley', NULL, 'pcs', 2101000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1434, 'Mounting Assembly for 1771 to 1756 I/O Field Wiring Conversion System, 13 or 17 slot chassis', '1492-MUA4-A13-A17', 'Allen-Bradley', NULL, 'pcs', 2183000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1435, 'Conversion Cable for 1771 to 1756 I/O Field Wiring Conversion System, 0.5 meters', '1492-CONCAB005Y', 'Allen-Bradley', NULL, 'pcs', 2385000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1436, 'Conversion Cable for 1771 to 1756 I/O Field Wiring Conversion System, 0.5 meters', '1492-CONCAB005Z', 'Allen-Bradley', NULL, 'pcs', 2385000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1437, 'Flex I/O Digital Inputs 16 channel', '1794-IB16', 'Allen-Bradley', NULL, 'pcs', 2940000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1438, 'Conversion Cable for 1771 to 1756 I/O Field Wiring Conversion System, 0.5 meters', '1492-C005005XL', 'Allen-Bradley', NULL, 'pcs', 3600000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1439, 'Flex I/O Digital Outputs 16 channel', '1794-OB16', 'Allen-Bradley', NULL, 'pcs', 4190000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1440, 'CLX Digital Input 32 Pts 10-31 VDC (36 Pin)', '1756-IB32', 'Allen-Bradley', NULL, 'pcs', 4683000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1441, 'CLX Digital Input 16 Pts 159-265 VAC Isolated (36 Pin)', '1756-IM16I', 'Allen-Bradley', NULL, 'pcs', 5954000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1442, 'CLX 1756 Chassis 10 slots', '1756-A10', 'Allen-Bradley', NULL, 'pcs', 6101000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1443, 'CLX Digital Output 16 Pts N.O. Isolated Relay (36 Pin)', '1756-OW16I', 'Allen-Bradley', NULL, 'pcs', 6195000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1444, 'CLX Digital Output 16 Pts 74-265 VAC (20 Pin)', '1756-OA16', 'Allen-Bradley', NULL, 'pcs', 6447000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1445, 'CLX Digital Output 32 Pts 10-31 VDC (36 Pin)', '1756-OB32', 'Allen-Bradley', NULL, 'pcs', 6626000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1446, 'Flex I/O Ethernet Adapter Module', '1794-AENT', 'Allen-Bradley', NULL, 'pcs', 7279000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1447, 'CLX 1756 Chassis 13 slots', '1756-A13', 'Allen-Bradley', NULL, 'pcs', 7340000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1448, 'Flex I/O Analog Outputs', '1794-OE4', 'Allen-Bradley', NULL, 'pcs', 8432000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1449, 'CLX 1756 Chassis 17 slots', '1756-A17', 'Allen-Bradley', NULL, 'pcs', 8631000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1450, 'CLX 1756 Chassis 4 slots', '1756-A4', 'Allen-Bradley', NULL, 'pcs', 8631000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1451, 'CLX Power Supply, 85-265 VAC (5V @ 10 Amp)', '1756-PA72', 'Allen-Bradley', NULL, 'pcs', 9009000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1452, 'Flex I/O Analog Inputs', '1794-IE8', 'Allen-Bradley', NULL, 'pcs', 9324000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1453, 'CLX High Speed Counter, 2 Channel / 4 Output (36 Pin)', '1756-HSC', 'Allen-Bradley', NULL, 'pcs', 10479000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1454, 'CLX High Speed Counter, 2 Channel / 4 Output (36 Pin)', '1756-HSC', 'Allen-Bradley', NULL, 'pcs', 10479000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1455, 'CLX Power Supply, 85-265V AC (5V @ 13 Amp)', '1756-PA75', 'Allen-Bradley', NULL, 'pcs', 11025000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1456, 'CLX Analog Input, Current/Voltage  16 Pts (36 Pin)', '1756-IF16', 'Allen-Bradley', NULL, 'pcs', 15225000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1457, 'CLX DH+/RIO Bridge/Scanner Module 2 Channels', '1756-DHRIO', 'Allen-Bradley', NULL, 'pcs', 21525000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1458, 'SLC 500 Ethernet / IP Adapter', '1747-AENTR', 'Allen-Bradley', NULL, 'Pcs', 25189000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1459, 'CLX Analog Output, Current/Voltage, 8 Isolated Points (36 Pin)', '1756-OF8I', 'Allen-Bradley', NULL, 'pcs', 25725000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1460, 'FactoryTalk View SE Station 100 Display', '9701-VWSB100AENM', 'Allen-Bradley', NULL, 'pcs', 26883040, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1461, 'EtherNet 10-100M Bridge Module', '1756-EN2T', 'Allen-Bradley', NULL, 'pcs', 28575000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1462, 'KEPserver Enterprise', '9301-OPCSRVENM', 'Allen-Bradley', NULL, 'pcs', 29880000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1463, 'HMI Graphic Terminal, Standard Model 6,5 in, Display, TFT Color, Touchscreen, Single Ethernet, 18-30 VDC', '2711P-T7C21D8S', 'Allen-Bradley', NULL, 'Pcs', 35583108, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1464, 'Studio 5000 Logix Designer Professional Edition', '9324-RLD700NXENM', 'Allen-Bradley', NULL, 'pcs', 102360000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1465, 'CLX Logix5583E Controller  With 10 Mbytes Memory', '1756-L83E', 'Allen-Bradley', NULL, 'pcs', 121500000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1466, 'Distribution Block, Mini, 115A, 3P, Aluminum', '1492-PDM3141', 'Allen-Bradley ', NULL, 'Pcs', 285000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1467, 'Temperature Controller', 'TK4S14RC/14CC', 'Autonic', NULL, 'pcs', 720000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1468, 'Temperature Controller - current module', 'TK4S-12RN', 'Autonics', NULL, 'Pcs', 609000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1469, 'HMI Beijer 10\"', 'X2Base10', 'Beijer', NULL, 'Unit', 0, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1470, 'HMI Beijer 7\"', 'X2Base7', 'Beijer', NULL, 'Unit', 0, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1471, 'Cable ethernet Cat 5', 'Cat5', 'Belden', NULL, 'Roll', 1400000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1472, 'Cable Ethernet cat 6', 'Cat6', 'Belden', NULL, 'Roll', 1850000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1473, 'Cable Gland Ex Prof untuk Flexible metal conduit 1/2\"', NULL, 'CABTEK', NULL, 'Pcs', 130000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1474, 'Cable Gland Ex Prof untuk Flexible metal conduit 1\"', NULL, 'CABTEK', NULL, 'Pcs', 350000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1475, 'Cable Gland Ex Prof untuk Flexible metal conduit 1\"', NULL, 'CABTEK', NULL, 'Pcs', 350000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1476, 'Cable Gland Ex Prof untuk Flexible metal conduit 1/2\"', NULL, 'CABTEK', NULL, 'Pcs', 130000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1477, 'Pipa Conduit Clamp 20mm.', NULL, 'CLIPSAL', NULL, 'Pcs', 750, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1478, 'Pipa Conduit 20mm 3meter/batang', NULL, 'CLIPSAL', NULL, 'Pcs', 12000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1479, 'Pipa PVC 20mm Putih 3meter/batang', NULL, 'CLIPSAL', NULL, 'Btg', 12000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1480, 'Pipa Conduit Shock 20mm.', NULL, 'CLIPSAL', NULL, 'Pcs', 750, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1481, 'Panel Box 2000Hx800Wx600D', NULL, 'Cometal', NULL, 'pcs', 12800000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1482, 'Panel Box 400Hx300Wx200D', NULL, 'Cometal', NULL, 'pcs', 1000000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1483, 'Panel Box 600Hx400Wx250D', NULL, 'Cometal', NULL, 'pcs', 1450000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1484, 'Panel Box 800Hx600Wx250D', NULL, 'Cometal', NULL, 'pcs', 2200000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1485, 'Cable 3x0.75mm2', 'YSLY-JZ', 'Delta Cable', NULL, 'Meter', 5000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1486, 'Cable 3x1.5mm2', 'YSLY-JZ', 'Delta Cable', NULL, 'Meter', 9500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1487, 'Cable 7x0.75mm2', 'YSLY-JZ', 'Delta Cable', NULL, 'Meter', 12000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1488, 'Cable 34x0.75mm2', 'YSLY-JZ', 'Delta Cable', NULL, 'Meter', 55500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1489, 'Cable 1x0.5mm2 (blue)', 'NYAF', 'Federal', NULL, 'Roll', 110000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1490, 'Cable 1x0.75mm2 (black)', 'NYAF', 'Federal', NULL, 'Roll', 119000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1491, 'Cable 1x0.75mm2 (light blue)', 'NYAF', 'Federal', NULL, 'Roll', 136000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1492, 'Cable 1x0.75mm2 (blue)', 'NYAF', 'Federal', NULL, 'Roll', 119000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1493, 'Cable 1x0.75mm2 (Green/yellow)', 'NYAF', 'Federal', NULL, 'Roll', 149000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1494, 'Cable 1x0.75mm2 (Light blue)', 'NYAF', 'Federal', NULL, 'Roll', 149000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1495, 'Cable 1x1.5mm2 (Black)', 'NYAF', 'Federal', '1', 'Roll', 220000, 0, 220000, '2019-11-15 03:18:08', '2019-12-09 07:47:21', 35),
(1496, 'Cable 1x1.5mm2 (blue)', 'NYAF', 'Federal', NULL, 'Roll', 203000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1497, 'Cable 1x1.5mm2 (red)', 'NYAF', 'Federal', NULL, 'roll', 203000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1498, 'Cable 1x1.5mm2 (Light blue)', 'NYAF', 'Federal', NULL, 'Roll', 203000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1499, 'Cable 1x1mm2 (red)', 'NYAF', 'Federal', NULL, 'roll', 150500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1500, 'Cable 1x2.5mm2 (Black)', 'NYAF', 'Federal', NULL, 'Roll', 336000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1501, 'Cable 1x2.5mm2 (light blue)', 'NYAF', 'Federal', NULL, 'Roll', 384000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1502, 'Cable 1x2.5mm2 (blue)', 'NYAF', 'Federal', NULL, 'Roll', 431000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1503, 'Cable 1x2.5mm2 (blue)', 'NYAF', 'Federal', NULL, 'Pcs', 336000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1504, 'Cable 1x2.5mm2 (Merah)', 'NYAF', 'Federal', NULL, 'Roll', 431000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1505, 'Cable 1x2.5mm2 (red)', 'NYAF', 'Federal', NULL, 'roll', 336000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1506, 'Cable 1x4mm2 (Black)', 'NYAF', 'Federal', NULL, 'Roll', 525000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1507, 'Cable 1x4mm2 (blue)', 'NYAF', 'Federal', NULL, 'Roll', 720500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1508, 'Cable 1x4mm2 (red)', 'NYAF', 'Federal', NULL, 'Roll', 525000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1509, 'Cable 1x50mm2 (Black)', 'NYAF', 'Federal', NULL, 'Meter', 66913, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1510, 'Cable PE 1,5mm2 (Yellow/Green)', 'NYAF', 'Federal', NULL, 'Roll', 203000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1511, 'Cable PE 2,5mm2 (Yellow/Green)', 'NYAF', 'Federal', NULL, 'Roll', 384000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1512, 'Cable PE 4mm2 (Yellow/Green)', 'NYAF', 'Federal', NULL, 'Roll', 590000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1513, 'Fan 230VAC 172 x 172', NULL, 'Fort', NULL, 'Pcs', 175000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1514, 'Fan Fillter 204 x 204', NULL, 'Fort', NULL, 'Pcs', 95000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1515, 'IGS- Industrial Gateway Server for Basic Points 253 Additional IGS Protocols IOT Gateway plug in No Tags', 'DR-G00P253V0', 'GE', NULL, 'Pcs', 20424000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1516, 'SIRENE/BUZZER with lamp outdor satpam. 220VAC', NULL, 'hanyoung', NULL, 'Pcs', 30000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1517, 'Push Button Green', '0105-A1-Green', 'Helon', NULL, 'pcs', 363000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1518, 'Push Button Red', '0105-A1-Red', 'Helon', NULL, 'pcs', 363000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1519, 'PC CORE I5 RAM 8GB + 19 INCH', 'HPTDT4MF27PA', 'HP PRO 280 G4', NULL, 'Pcs', 9475000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1520, 'Cable 1x0.75mm2 (light blue)', 'NYAF', 'Jembo', NULL, 'Roll', 149000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1521, 'Cable 1x1.5mm2 (light blue)', 'NYAF', 'Jembo', NULL, 'Roll', 266500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1522, 'Cable 1x10mm2 (Black)', 'NYAF', 'Jembo', NULL, 'Meter', 17500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1523, 'Cable 1x1.5mm2 (black)', 'NYAF', 'Jembo', NULL, 'Roll', 203000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1524, 'Cable 1x1.5mm2 (white)', 'NYAF', 'Jembo', '1', 'Roll', 220000, 0, 220000, '2019-11-15 03:18:08', '2019-12-09 07:50:57', 35),
(1525, 'Cable 1x1mm2 (black)', 'NYAF', 'Jembo', NULL, 'Roll', 150500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1526, 'Cable 1x1mm2 (white)', 'NYAF', 'Jembo', NULL, 'Roll', 150500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1527, 'Cable 1x2.5mm2 (black)', 'NYAF', 'Jembo', NULL, 'Roll', 336000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1528, 'Cable 1x2.5mm2 (white)', 'NYAF', 'Jembo', NULL, 'Roll', 336000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1529, 'Cable 1x2.5mm2 (light blue)', 'NYAF', 'Jembo', NULL, 'Roll', 336000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1530, 'Cable 1x2.5mm2 (Black)', 'NYAF', 'Jembo', NULL, 'Roll', 384000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1531, 'Cable 1x4mm2 (light blue)', 'NYAF', 'Jembo', NULL, 'Roll', 525000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1532, 'Cable 1x4mm2 (Black)', 'NYAF', 'Jembo', NULL, 'Roll', 590000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1533, 'Cable 1x50mm2 (Black)', 'NYAF', 'Jembo', NULL, 'Meter', 82000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1534, 'Cable 2x0,75mm22', 'NYMHY', 'Jembo', NULL, 'Meter', 3560, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1535, 'Cable PE 1x1mm2 (Green/yellow)', 'NYAF', 'Jembo', NULL, 'Roll', 190000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1536, 'Cable PE 1x4mm2 (Green/yellow)', 'NYAF', 'Jembo', NULL, 'Roll', 525000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1537, 'Cable 1x25mm2 (black) ', 'NYAF', 'Jembo', NULL, 'Meter', 33110, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1538, 'Cable 1x50mm2 (black)', 'NYAF', 'Jembo', NULL, 'Meter', 66913, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1539, 'Cable 1x70mm2 (black)', 'NYAF', 'Jembo', NULL, 'Meter', 97200, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1540, 'Cable 3x1.5mm22', 'NYFGbY', 'Jembo', NULL, 'Meter', 20000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1541, 'Holesaw 22', NULL, 'Jepang', NULL, 'Pak', 245000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1542, 'Holesaw 22', NULL, 'Jepang', NULL, 'Pcs', 340000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1543, 'Cable Duct W100xH100', NULL, 'Klemsam', NULL, 'Pcs', 220000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1544, 'Cable Duct W48xH100', NULL, 'Klemsam', NULL, 'Pcs', 110000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1545, 'Cable Duct W70xH100', NULL, 'Klemsam', NULL, 'Pcs', 144000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1546, 'Cable Duct W33xH100', NULL, 'KSS', NULL, 'pcs', 123000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1547, 'Cable Duct W40xH40', NULL, 'KSS', NULL, 'Btg', 31000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1548, 'Cable Duct W45xH65', NULL, 'KSS', NULL, 'pcs', 100000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1549, 'Cable Duct W48xH100', NULL, 'KSS', NULL, 'Pcs', 183000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1550, 'Cable Duct W65x65XH100 ', NULL, 'KSS', NULL, 'pcs', 91000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1551, 'Cable Duct W65xH65', NULL, 'KSS', NULL, 'Pcs', 49500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1552, 'Cable Duct W65xH65', NULL, 'KSS', NULL, 'pcs', 107000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1553, 'Cable Duct W70xH100', NULL, 'KSS', NULL, 'pcs', 176000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1554, 'Cable Duct W75xH100', NULL, 'KSS', NULL, 'pcs', 220000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1555, 'Cable Ties 100', NULL, 'KSS', NULL, 'Pak', 6000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1556, 'Cable Ties 150', NULL, 'KSS', NULL, 'Pak', 12500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1557, 'Cable Ties 200', NULL, 'KSS', NULL, 'Pak', 20000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1558, 'Cable Ties 250', NULL, 'KSS', NULL, 'Pak', 30000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1559, 'KSS MARKER TUBE 4.5 mm White', NULL, 'KSS', NULL, 'Roll', 85000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1560, 'KSS Mini cable tie holder 12mm x 12mm', NULL, 'KSS', NULL, 'Pcs', 850, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1561, 'KSS Movable Bushing', 'KG-045', 'KSS', NULL, 'Pcs', 85000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1562, 'KSS O Type Marker Tube', 'OMT-3.2', 'KSS', NULL, 'Roll', 590000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1563, 'KSS O Type Marker Tube', 'OMT-5.5', 'KSS', NULL, 'Roll', 600000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1564, 'KSS O Type Marker Tube', 'OMT-4.5', 'KSS', NULL, 'Roll', 830000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1565, 'Skun Perulles 0.75mm', NULL, 'KSS', NULL, 'Pcs', 110, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1566, 'Skun Perulles 1.5mm', NULL, 'KSS', NULL, 'Pcs', 145, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1567, 'Skun Perulles 10mm', NULL, 'KSS', NULL, 'Pcs', 400, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1568, 'Skun Perulles 2.5mm', NULL, 'KSS', NULL, 'Pcs', 200, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1569, 'Skun Perulles 4mm', NULL, 'KSS', NULL, 'Pcs', 320, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1570, 'Skun Perulles 6mm', NULL, 'KSS', NULL, 'Pcs', 360, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1571, 'Skun Y 1.5mm', NULL, 'KSS', NULL, 'Pcs', 180, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1572, 'Skun Y 2.5mm', NULL, 'KSS', NULL, 'Pcs', 220, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1573, 'Spiral Wrapping Band 12mm', NULL, 'KSS', NULL, 'Pack', 45000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1574, 'Tie Mount', 'HC-101', 'KSS', NULL, 'Pack', 80000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1575, 'Gland cable 980.03 (6mm-12mm)', '98003', 'Legrand', NULL, 'Pcs', 16000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1576, 'Gland cable 980.05 (13mm-18mm)', NULL, 'Legrand', NULL, 'Pcs', 26000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1577, 'Label machine Letatwin', 'LM550A', 'Letatwin', NULL, 'Pcs', 9300000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1578, 'Busbar Cooper 80x5mm 4meter', NULL, 'Local', NULL, 'Pcs', 1772727, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1579, 'Busbar Copper 50x5mm 4meter', NULL, 'Local', NULL, 'Pcs', 1136363, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1580, 'Cable lug 0,75 sqmm', NULL, 'Local', NULL, 'Pcs', 130, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1581, 'Cable Maker 3.6-7.4 mm (angka 0 s.d 9) Camsco ', NULL, 'Local', NULL, 'Pcs', 36000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1582, 'Din Rail 35 x 7.5 x 1.5 x 2000 mm', NULL, 'Local', NULL, 'Btg', 55000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1583, 'Limit Switch Door NO & NC', NULL, 'Local', NULL, 'Pcs', 72500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1584, 'Panel Box 600Hx550Wx300D double layer', NULL, 'Local', NULL, 'Unit', 2750000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1585, 'Panel Box MS 400Hx300Wx150D ', NULL, 'Local', NULL, 'Pcs', 600000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1586, 'Pilot Lamp LED 22mm 24VDC Green', 'AD22-22DS', 'Local', NULL, 'Pcs', 7500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1587, 'Scanner Barcode Taffware USB Wireless', 'YK980', 'Local', NULL, 'Pcs', 525000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1588, 'Sewa Laptop Core i5 Ram8Gb', 'Utk 5hr @425rb', 'Local', NULL, 'Pcs', 425000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1589, 'Skun Ferullus 0.5mm', NULL, 'Local', NULL, 'Pcs', 125, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1590, 'Skun Ferullus 1 mm', NULL, 'Local', NULL, 'Pcs', 150, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1591, 'Skun Ferullus 1.5mm', NULL, 'Local', NULL, 'Pcs', 175, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1592, 'Skun Ferullus 10 mm', NULL, 'Local', NULL, 'Pcs', 1000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1593, 'Skun Ferullus 2.5 mm', NULL, 'Local', NULL, 'Pcs', 200, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1594, 'Skun Ferullus 25mm', NULL, 'Local', NULL, 'Pcs', 1000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1595, 'Skun Ferullus 4mm', NULL, 'Local', NULL, 'Pak', 28500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1596, 'Skun Ferullus 50 mm', NULL, 'Local', NULL, 'Pcs', 3000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1597, 'Skun Ferullus 6 mm', NULL, 'Local', NULL, 'Pcs', 400, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1598, 'Skun Ferullus 70mm', NULL, 'Local', NULL, 'Pcs', 3500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1599, 'Transformer 400/230 VAC 1000 VA', NULL, 'Local', NULL, 'Pcs', 650000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1600, 'Custom Support Busbar ', NULL, 'Lokal', NULL, 'Pcs', 200000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1601, 'Ink ribbon letatwin Max LM-IR 50B', 'LM-IR 50B', 'MAX', NULL, 'Pcs', 230000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1602, 'Mata Bor 4.5mm', NULL, 'Nachi', NULL, 'Pcs', 25000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1603, 'Mata Bor 4.5mm', NULL, 'Nachi', NULL, 'Pak', 25000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1604, 'Isolasi Hitam', NULL, 'Nito', NULL, 'Pak', 7500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1605, 'Isolasi Hitam', NULL, 'Nitro', NULL, 'Pcs', 7500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1606, 'Isolasi Hitam', NULL, 'Nitto', NULL, 'Pcs', 7500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1607, 'Isolasi Hitam', NULL, 'Nitto', NULL, 'Pcs', 7500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1608, 'Panel Box 100HX100WX250D', 'CV-107', 'Nobi', NULL, 'Pcs', 643000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1609, 'CJ1W Ethernet Module', 'CJ1W-ETN21', 'Omron', NULL, 'Pcs', 8900000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1610, 'CP1H CPU Unit with 24 Input, 16 Relay output, 24VDC power supply', 'CP1H-XA40DR-A', 'Omron', NULL, 'Pcs', 10732800, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1611, 'CP1W Adapter/Option board expansion module', 'CP1W-CIF01', 'Omron', NULL, 'Pcs', 339840, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1612, 'CP1W Cable Peripheral', 'CS1W-CN226', 'Omron', NULL, 'Pcs', 1221000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1613, 'CP1W Cable Serial communication PLC to HMI', 'XW2Z-200T', 'Omron', NULL, 'Pcs', 691200, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1614, 'Exclusive Socket', 'PYF08A-E BY OMZ', 'Omron', NULL, 'Pcs', 17280, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1615, 'HMI NB7W 10\" Omron', 'NB7W-TW01B', 'Omron', NULL, 'Pcs', 9741120, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1616, 'Power Supply 100-240VAC/ 24VDC 2,1A ', 'S82K-05024', 'Omron', NULL, 'Pcs', 817920, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1617, 'standard light, Standard light 14W, 230V', NULL, 'Philips', NULL, 'Pcs', 90000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1618, 'Busbar Copper 10x100mm 4meter', '4PMCM101', 'PM', NULL, 'Btg', 3852000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1619, 'Busbar Copper 10x60mm 4meter', '4PMCM106', 'PM', NULL, 'Btg', 2300500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1620, 'Busbar Copper 5x50mm 4 meter', '4PMCM550', 'PM', NULL, 'Btg', 963000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1621, 'Busbar support', ' PM EL-270', 'PM', NULL, 'Pcs', 62000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1622, 'Busbar support', ' PM EL-270', 'PM', NULL, 'Pcs', 62000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1623, 'Gateway EtherNet/IP to AB RIO or DH+', 'AN-X2-AB-DHRIO', 'Prosoft', NULL, 'pcs', 32280000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1624, 'Gateway Modbus Master/Slave Enhanced Communication Module', 'MVI56E-MCM', 'Prosoft', NULL, 'pcs', 34080000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1625, 'Power Supply 100-240VAC/ 24VDC 40A ', 'QS40.241', 'PULS', NULL, 'pcs', 9500000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1626, 'Power Supply 100-240VAC/24VDC, 10A', 'PIC240.241C', 'PULS', NULL, 'Pcs', 1690000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1627, 'Power Supply 100-240VAC/24VDC, 5A', NULL, 'PULS', NULL, 'Pcs', 1100000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1628, 'Selector switch 2 posisi On - Off', 'M220-61192-219M1', 'Salzer', NULL, 'Pcs', 70000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1629, 'Selector switch 3 posisi Auto - Off - Manual', 'M220-61026-219M1', 'Salzer', NULL, 'Pcs', 80000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1630, 'Adapter GV2 - LC1D', 'GV2AF3', 'Schneider', NULL, 'Pcs', 47775, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1631, 'Auxilary contact for GV2, 1NO+1NC, front', 'GVAE11', 'Schneider', NULL, 'Pcs', 127050, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1632, 'Circuit breaker Compact NSX100F,3 poles, 100A, 36kA, TMD 32 A', 'LV429635', 'Schneider', NULL, 'pcs', 1424000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1633, 'Circuit breaker Compact NSX160F, 3 poles, 160A, 36kA, TMD trip unit', 'LV430630', 'Schneider', NULL, 'pcs', 2746000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1634, 'Circuit breaker Compact NSX250F, 3 poles, 250A, 36 kA, TMD trip unit', 'LV431630', 'Schneider', NULL, 'pcs', 3059000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1635, 'Circuit breaker Easypact EZC100H - TMD - 60 A - 2 poles 2d', 'EZC100H2060', 'Schneider', NULL, 'pcs', 812000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1636, 'ClimaSys forced vent. IP54, 300m3/h, 230V, with outlet grille and filter G2', 'NSYCVF300M230PF', 'Schneider', NULL, 'pcs', 1800000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1637, 'ClimaSys forced vent. IP54, 300m3/h, 230V, with outlet grille and filter G2', 'NSYCVF300M230PF', 'Schneider', NULL, 'pcs', 1800000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1638, 'Connection sub-base ABE7 - for distribution of 4 thermocouples', 'ABE7CPA412', 'Schneider', NULL, 'pcs', 4729000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1639, 'Contactor LC1-D 3P 12A 24VDC', 'LC1D12BD', 'Schneider', NULL, 'pcs', 778636, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1640, 'Contactor LC1-D 3P 9A 24VDC', 'LC1D09BD', 'Schneider', NULL, 'Pcs', 694575, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1641, 'Current Transformer (CT) 5/250A DIN Rail Mounting', 'METSECT5MA025', 'Schneider', NULL, 'pcs', 346000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1642, 'Emergency stop latching turn to release', 'XB4BS542', 'Schneider', NULL, 'Pcs', 171627, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1643, 'Lamp LED 220VAC Green', 'XB4BVM3', 'Schneider', NULL, 'Pcs', 112255, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1644, 'Lamp LED 220VAC red', 'XB4BVM4', 'Schneider', NULL, 'Pcs', 112255, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1645, 'Lamp LED 220VAC Yellow', 'XB4BVM5', 'Schneider', NULL, 'Pcs', 112255, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1646, 'Lamp LED 24VDC red', 'XB4BVB4', 'Schneider', NULL, 'pcs', 157000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1647, 'Lamp LED 24VDC Yellow', 'XB4BVB5', 'Schneider', NULL, 'pcs', 157000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1648, 'M340 20-pin removable caged terminal blocks -1 x 0.34..1 mm2', 'BMXFTB2000', 'Schneider', NULL, 'pcs', 508500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1649, 'M340 28-pin removable spring terminal blocks - 1 x 0.34..1 mm2', 'BMXFTB2820', 'Schneider', NULL, 'pcs', 611000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1650, 'M340 Analog input module 8 inputs temperature', 'BMXART0814', 'Schneider', NULL, 'pcs', 13731000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1651, 'M340 Cord set - 40-way terminal - SUB-D25 connector 5 m', 'BMXFCA502', 'Schneider', NULL, 'pcs', 2591000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1652, 'M340 CPU 2 Port Modbus', 'BMXP342000', 'Schneider', NULL, 'pcs', 13367000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1653, 'M340 Discrete input 16 inputs 24VDC positive', 'BMXDDI1602', 'Schneider', NULL, 'pcs', 2977000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1654, 'M340 Discrete output 16 outputs 24VDC positive', 'BMXDDO1602', 'Schneider', NULL, 'pcs', 3599000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1655, 'M340 Ethernet module M340 - flash memory card - 1 x RJ45 10/100', 'BMXNOE0100', 'Schneider', NULL, 'pcs', 17424000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1656, 'M340 Isolated analog input 8 inputs', 'BMXAMI0810', 'Schneider', NULL, 'pcs', 10275000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1657, 'M340 Power supply 100-240 VAC 36 W', 'BMXCPS3500', 'Schneider', NULL, 'pcs', 9313000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1658, 'M580 Rack X80 - 12 slots - Ethernet backplane', 'BMEXBP1200', 'Schneider', NULL, 'pcs', 11193000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1659, 'MCB Fuse-disconnector 1P 10 A - for fuse 8.5 x 31.5 mm', 'A9N15635', 'Schneider', NULL, 'pcs', 88500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1660, 'MCB iC60NN 1P 10A', 'A9F74110', 'Schneider', NULL, 'Pcs', 116025, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1661, 'MCB iC60NN 1P 2A', 'A9F74102', 'Schneider', NULL, 'Pcs', 127050, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1662, 'MCB iC60NN 1P 40A', 'A9F74140', 'Schneider', NULL, 'pcs', 151000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1663, 'MCB iC60NN 1P 4A', 'A9F74104', 'Schneider', NULL, 'Pcs', 121000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1664, 'MCB iC60NN 2P 10A', 'A9F74210', 'Schneider', NULL, 'pcs', 306500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1665, 'MCB iC60NN 2P 2A', 'A9F74202', 'Schneider', '1', 'pcs', 404250, 0, NULL, '2019-11-15 03:18:08', '2019-12-09 08:50:35', 35),
(1666, 'MCB iC60NN 2P 4A', 'A9F74204', 'Schneider', '1', 'pcs', 404250, 0, NULL, '2019-11-15 03:18:08', '2019-12-09 08:51:34', 35),
(1667, 'MCB iC60NN 3P 6A', 'A9F74306', 'Schneider', NULL, 'pcs', 465500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1668, 'Motor Circuit Breaker GV2ME 3P 13-18 A', 'GV2ME20', 'Schneider', NULL, 'Pcs', 672525, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1669, 'Motor Circuit Breaker GV2ME 3P 6-10 A', 'GV2ME14', 'Schneider', NULL, 'Pcs', 623175, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1670, 'Motor Circuit Breaker GV2ME 3P 9-14 A', 'GV2ME16', 'Schneider', NULL, 'pcs', 693182, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1671, 'Mounting Plate', 'NSYMM86', 'Schneider', NULL, 'Pcs', 743182, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1672, 'Panel Box SS 800Hx600Wx300D mm', 'NSYS3DEX8630', 'Schneider', NULL, 'Pcs', 7797273, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1673, 'Panel Box SS 1200Hx1000Wx400D mm ', NULL, 'Schneider', NULL, 'Pcs', 10800000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1674, 'PC Socket 2 pole + neutral 10/16A 250V din Rail', 'A9A15307', 'Schneider', NULL, 'Pcs', 342300, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1675, 'PM5560 Integrated Display Acc 0.2s Ethernet port', 'METSEPM5350', 'Schneider', NULL, 'pcs', 6031000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1676, 'Relay 24VDC, 4 contact C/O', 'RXM4AB2BD', 'Schneider', NULL, 'Pcs', 86625, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1677, 'Selector switch 230VAC 2A XB4 +options', 'XB4BD53', 'Schneider', NULL, 'pcs', 166000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1678, 'Socket for relay RXM2/4', 'RXZE1M4C', 'Schneider', NULL, 'Pcs', 30498, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1679, 'Socket for relay RXZ', 'RXZE2S114M', 'Schneider', NULL, 'pcs', 45000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1680, 'TeSys fuse-disconnector - fuse cartridge 8.5 x 31.5 mm - aM 2 A -w/o indication', 'DF2BA0200', 'Schneider', NULL, 'Box', 171364, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1681, 'TeSys fuse-disconnector - fuse cartridge 8.5 x 31.5 mm - aM 4 A - w/o indication', 'DF2BA0400', 'Schneider', NULL, 'Box', 198636, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1682, 'S7-1500, MOUNTING RAIL 482 MM (APPR. 19 INCH)', '6ES7590-1AE80-0AA0', 'Siemens', NULL, 'Pcs', 377000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1683, 'S7-1500, mounting rail 245 mm (approx. 9.6 inch)', '6ES7590-1AC40-0AA0', 'Siemens', NULL, 'Pcs', 415000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1684, 'S7-1500, Front connector Screw-type connection system, 40-pole for 35 mm', '6ES7592-1AM00-0XB0', 'Siemens', NULL, 'Pcs', 453000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1685, 'SIMATIC S7-1500, FRONTCONNECTOR SCREW-TYPE, 40PIN, FOR 35MM', '6ES7592-1AM00-0XB0', 'Siemens', NULL, 'Pcs', 453000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1686, 'S7 Memory Card 4MB', '6ES7954-8LC03-0AA0', 'Siemens', NULL, 'Pcs', 525000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1687, 'S7 Memory card, 4 MB', '6ES7954-8LC03-0AA0', 'Siemens', NULL, 'Pcs', 625000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1688, 'S7, memory card for S7-1x 00 CPU/SINAMICS, 3, 3 V flash, 4 MB', '6ES7954-8LC02-0AA0', 'Siemens', NULL, 'Pcs', 625000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1689, 'S7-1200, ANALOG INPUT, SM 1231, 4 AI,  12 BIT + SIGN BIT (13 BIT ADC)', '6ES7231-4HD32-0XB0', 'Siemens', NULL, 'Pcs', 2190000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1690, 'Pressure Transmitter', '7MF1565-3CA00-6AA1', 'Siemens', NULL, 'Pcs', 2200000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1691, 'SIMATIC S7-1200, CPU 1212C, compact CPU, DC/DC/relay, 8 DI 24VDC; 6 DO relay 2A; 2 AI 0-10 V DC, Power supply: DC 20.4-28.8V DC, Program/data memory 75 KB', '6ES7212-1HE40-0XB0', 'Siemens', NULL, 'Pcs', 2232500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1692, 'S7-1500, SYSTEM POWER SUPPLY PS 25W 24V DC', '6ES7505-0KA00-0AB0', 'Siemens', NULL, 'Pcs', 2329000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1693, 'S7-1500, ANALOG INPUT MODULE AI 4 X U/I/RTD/TC, 16 BITS OF RESOLUTION', '6ES7531-7QD00-0AB0', 'Siemens', NULL, 'Pcs', 3594000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1694, 'S7-1500, DIGITAL INPUT MODULE DI32 X DC24V', '6ES7521-1BL00-0AB0', 'Siemens', NULL, 'Pcs', 4060000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1695, 'S7-1500, DIGITAL OUTPUT MODULE DQ 32 X 24V DC/0.5A', '6ES7522-1BL01-0AB0', 'Siemens', NULL, 'Pcs', 5082000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1696, 'S7-1200, CPU 1215C 14DI, 10DO, 2AI, 24VDC, Program/Data Memory 100 KB', '6ES7215-1AG40-0XB0', 'Siemens', NULL, 'Pcs', 5400000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1697, 'S7-1500, ANALOG OUTPUT MODULE AQ 4 X U/I ST; 16 BITS OF RESOLUTION', '6ES7532-5HD00-0AB0', 'Siemens', NULL, 'Pcs', 5838000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1698, 'S7-1500, ANALOG IN-/OUTPUT MODULE AI 4X U/I/R/RTD/TC, AQ 2X U/I', '6ES7534-7QE00-0AB0', 'Siemens', NULL, 'Pcs', 6644000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1699, 'S7-1500, SYSTEM POWER SUPPLY PS 60W 24/48/60V DC', '6ES7505-0RA00-0AB0', 'Siemens', NULL, 'Pcs', 6823000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1700, 'S7-1500, CPU 1511-1 PN, CENTRAL PROCESSING UNIT WITH WORKING MEMORY 150 KB FOR PROGRAM AND 1 MB FOR DATA', '6ES7511-1AK02-0AB0', 'Siemens', NULL, 'Pcs', 9100000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1701, 'SIMATIC TP700 COMFORT PANEL, WINDOWS CE 6.0, 7\" WIDESCREEN-TFT-DISPLAY, 12 MB USER MEMORY, CONFIGURABLE FROM WINCC V11 ', '6AV2124-0GC01-0AX0', 'Siemens', NULL, 'Pcs', 11900000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1702, 'Control Valve Directional Component', 'SS3YJ5-41-13-01', 'SMC', NULL, 'Pcs', 1788000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1703, 'Selenoid Valve', 'SYJ514-5HZ', 'SMC', NULL, 'Pcs', 695000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1704, 'Cable 3x0.75 mm screen', NULL, 'SMI', NULL, 'Meter', 8250, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1705, 'Cable 3x2,5mm2 (Abu-Abu)', NULL, 'SMI', NULL, 'Meter', 14080, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1706, 'Cable 3x2.5mm2 unscreen', NULL, 'SMI', NULL, 'Meter', 14960, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1707, 'Cable 4x1,5mm2 Screened SiHF/C/Si', NULL, 'SMI', NULL, 'Meter', 15840, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1708, 'Cable 8x1.5mm2', NULL, 'SMI', NULL, 'Meter', 23040, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1709, 'Cable 4x2.5mm2', 'YSLY-JZ', 'SMI CABLE', NULL, 'Meter', 18400, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1710, 'Cable 12x0.75mm2', 'YSLY-JZ', 'SMI CABLE', NULL, 'Meter', 18560, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1711, 'Cable 4x4mm2', 'NYYHY', 'SMI CABLE', NULL, 'Meter', 27000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1712, 'Cable 18x0.75mm2', 'YSLY-JZ', 'SMI CABLE', NULL, 'Meter', 27600, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1713, 'Cable 4x2.5mm2', 'NYY', 'Supreme Cable ', NULL, 'Meter', 17360, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1714, 'Cable 3x4mm2', 'NYY', 'Supreme Cable ', NULL, 'Meter', 20000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1715, 'Cable 4x10mm2', 'NYY', 'Supreme Cable ', NULL, 'Meter', 67540, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1716, 'Cable 4x50mm2', 'NYY', 'Supreme Cable ', NULL, 'Meter', 253830, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1717, 'Cable 4x95mm2', 'NYY', 'Supreme Cable ', NULL, 'Meter', 495940, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1718, 'Temperature Sensor', NULL, 'Tegussa', NULL, 'Pcs', 1900000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1719, 'Panel Box SS Eex 458Hx382Wx205D mm', NULL, 'Tempa Pano', NULL, 'Pcs', 6800000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1720, 'Panel BOX ABS Plastik 125Hx125wx100D Grey', NULL, 'Ti-Box', NULL, 'Pcs', 110000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1721, 'Cross-connector, For the terminals WQB B/10', '1579050000', 'Weidmueller', NULL, 'Pcs', 27000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1722, 'DEK 5/5 PLUS MC NE WS', '1854490000', 'Weidmueller', NULL, 'Pcs', 76000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1723, 'Feed-through terminal, Double-tier terminal, Screw connection, 2.5 mm², 400 V, 24 A, Dark Beige', '1021500000', 'Weidmueller', NULL, 'Pcs', 32000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1724, 'Feed-through terminal, Double-tier terminal, Screw connection, 2.5 mm², 400 V, 24 A, Dark Beige', '1021500000', 'Weidmueller', NULL, 'Pcs', 39000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1725, 'Terminal End plate. WAP WDK2.5', '1059100000', 'Weidmueller', NULL, 'Pcs', 6000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1726, 'Terminal End plate. WAP WDU2.5', '1050000000', 'Weidmueller', NULL, 'Pcs', 6000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1727, 'Terminal marker, 44.5 x 9.5 mm, Pitch in mm (P): 5.00 Beige', '1631930000', 'Weidmueller', NULL, 'Pcs', 14000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1728, 'Terminal PE, Screw connection, 10 mm², 1200 A (10 mm²), green / yellow', '1010300000', 'Weidmueller', NULL, 'Pcs', 21000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1729, 'Terminal PE, Screw connection, 4 mm², 480 A (4 mm²), green / yellow', '1010100000', 'Weidmueller', NULL, 'Pcs', 42000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1730, 'Terminal PE, Screw connection, 50 mm², green / yellow', '1820840000', 'Weidmueller', NULL, 'Pcs', 148000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1731, 'Terminal, Screw connection, 50 mm², dark beige', '1846040000', 'Weidmueller', NULL, 'Pcs', 283000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1732, 'Dinrail', NULL, 'Weidmuller', NULL, 'Pcs', 160000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1733, 'Terminal Fuse 6mm WSI6', NULL, 'Weidmuller', NULL, 'pcs', 41000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1734, 'Terminal Jumper 2.5/10', NULL, 'Weidmuller', NULL, 'Pcs', 18000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1735, 'Terminal PE, Screw connection, 2.5 mm², 300 A (2.5 mm²), green / yellow', '1010000000', 'Weidmuller', NULL, 'pcs', 41000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1736, 'Terminal, Double-tier terminal, Screw connection, 2.5 mm², 400 V, 24 A, dark beige', '1021500000', 'Weidmuller', NULL, 'pcs', 24000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1737, 'Terminal, Screw connection, 10 mm², 1000 V, 57 A, dark beige', '1020300000', 'Weidmuller', NULL, 'pcs', 23000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1738, 'Terminal, Screw connection, 2.5 mm², 800 V, 24 A, Dark Beige', '1020000000', 'Weidmuller', NULL, 'pcs', 8000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1739, 'Terminal, Screw connection, 4 mm², 800 V, 32 A, Dark Beige', '1020100000', 'Weidmuller', NULL, 'pcs', 9000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1740, 'Terminal, Screw connection, 50 mm², dark beige', NULL, 'Weidmuller', NULL, 'pcs', 145000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1741, 'HMI 7\" TFT Display', 'MT8071iP', 'Weintek', NULL, 'Pcs', 3446900, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1742, 'IOT Box ', 'CMT-SVR-100', 'Weintek', NULL, 'Pcs', 4550000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1743, 'IOT Box with Wireless ', 'CMT-SVR-200', 'Weintek', NULL, 'Pcs', 8600000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1744, 'Acrylic 5mm', NULL, NULL, NULL, 'Lbr', 1010000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0);
INSERT INTO `items` (`id`, `description`, `type`, `mfg`, `qty`, `unit`, `price`, `disc`, `total_cost`, `created_at`, `updated_at`, `user_id`) VALUES
(1745, 'cable 1x10mm hitam', NULL, NULL, NULL, 'roll', 1295000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1746, 'CABLE GLEND M 20', NULL, NULL, NULL, 'PCS', 9000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1747, 'cable Skun SC 10 3 warna', NULL, NULL, NULL, 'Pcs', 250, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1748, 'cable Skun SC 10-6', NULL, NULL, NULL, 'Pcs', 1200, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1749, 'cable Skun SC 120 3 warna', NULL, NULL, NULL, 'Pcs', 1500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1750, 'cable Skun SC 120-10', NULL, NULL, NULL, 'Pcs', 16500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1751, 'cable Skun SC 16 3 warna', NULL, NULL, NULL, 'Pcs', 400, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1752, 'cable Skun SC 16-8', NULL, NULL, NULL, 'Pcs', 2000, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1753, 'cable Skun SC 25 3 warna', NULL, NULL, NULL, 'Pcs', 500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1754, 'cable Skun SC 25-8', NULL, NULL, NULL, 'Pcs', 2500, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1755, 'cable Skun SC 50 3 warna', NULL, NULL, NULL, 'Pcs', 750, 0, NULL, '2019-11-15 03:18:08', '2019-11-15 03:18:08', 0),
(1756, 'cable Skun SC 50-8', NULL, NULL, NULL, 'Pcs', 4900, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1757, 'cable Skun SC 6 3 warna', NULL, NULL, NULL, 'Pcs', 200, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1758, 'cable Skun SC 6-6', NULL, NULL, NULL, 'Pcs', 1000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1759, 'Connector RJ 45', NULL, NULL, NULL, 'BOX', 145000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1760, 'EEW HRLM PILOT LIGHT YELLOW 24VDC', NULL, NULL, NULL, 'PCS', 406000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1761, 'EEW HRLM PUSH BUTTON GREEN WITH CONTACT POINT', NULL, NULL, NULL, 'PCS', 385000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1762, 'EEW HRLM PUSH BUTTON RED WITH CONTACT POINT', NULL, NULL, NULL, 'PCS', 385000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1763, 'Heat Shrink (Black) untuk ukuran busbar 100x10mm ', NULL, NULL, NULL, 'M', 48000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1764, 'Heat Shrink (Black) untuk ukuran busbar 60x10mm ', NULL, NULL, NULL, 'M', 40000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1765, 'Heat Shrink 115mm (Biru) / 70', NULL, NULL, NULL, 'm', 55000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1766, 'Heat Shrink 2.5mm (Hitam)', NULL, NULL, NULL, 'm', 2000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1767, 'ISOLASI HITAM', NULL, NULL, NULL, 'PCS', 7500, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1768, 'Isolator bulat 40x40', NULL, NULL, NULL, 'Pcs', 9000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1769, 'KSS Marker Strip', 'MS-100', NULL, NULL, 'Pcs', 750, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1770, 'Label Machine Letatwin ink ribbon', 'LM-370A', NULL, NULL, 'Pcs', 125000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1771, 'Lakban Bening', NULL, NULL, NULL, 'PCS', 9000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1772, 'Lakban Kertas', NULL, NULL, NULL, 'Pcs', 5000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1773, 'Lakban Kertas', NULL, NULL, NULL, 'Pcs', 5000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1774, 'Lakban Kertas', NULL, NULL, NULL, 'Pcs', 5000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1775, 'Lakban Kertas', NULL, NULL, NULL, 'PCS', 5000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1776, 'Lakban Kertas', NULL, NULL, NULL, 'Pcs', 5000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1777, 'Mata Bor 10', NULL, NULL, NULL, 'Pcs', 75000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1778, 'Mata Bor 3,5', NULL, NULL, NULL, 'Pcs', 17500, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1779, 'Mata bor 4,5', NULL, NULL, NULL, 'Pcs', 20000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1780, 'Mata Bor 6', NULL, NULL, NULL, 'Pcs', 30000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1781, 'Mata Bor 8', NULL, NULL, NULL, 'Pcs', 45000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1782, 'Skun Ring 10mm', NULL, NULL, NULL, 'Pcs', 1000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1783, 'Skun Ring 10mm - Lubang baut M8/M10', NULL, NULL, NULL, 'Pcs', 1000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1784, 'Skun Ring 150mm - Lubang baut M10', NULL, NULL, NULL, 'Pcs', 16000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1785, 'Skun Ring 2.5mm - Lubang baut M8/M10', NULL, NULL, NULL, 'Pcs', 42000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1786, 'Skun Ring 25mm', NULL, NULL, NULL, 'Pcs', 2500, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1787, 'Skun Ring 35mm', NULL, NULL, NULL, 'Pcs', 3500, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1788, 'Skun Ring 4mm - Lubang baut M8/M10', NULL, NULL, NULL, 'Pcs', 59000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1789, 'Skun Ring 50mm', NULL, NULL, NULL, 'Pcs', 4500, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1790, 'Skun Ring 70mm', NULL, NULL, NULL, 'Pcs', 7800, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1791, 'SKUN RING SC 10 - 6', NULL, NULL, NULL, 'PCS', 1200, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1792, 'Skun Y 1,5mm', NULL, NULL, NULL, 'Pak', 18000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1793, 'Skun Y 1,5mm Hitam', NULL, NULL, NULL, 'Pcs', 165, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1794, 'Skun Y 10mm', NULL, NULL, NULL, 'pak', 120000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1795, 'Skun Y 2,5mm', NULL, NULL, NULL, 'Pak', 20000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1796, 'Skun Y 2,5mm Hitam', NULL, NULL, NULL, 'Pcs', 200, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1797, 'Skun Y 4mm', NULL, NULL, NULL, 'Pak', 34000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1798, 'Skun Y 4mm Hitam', NULL, NULL, NULL, 'Pcs', 350, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1799, 'Tap 5', NULL, NULL, NULL, 'Pcs', 20000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1800, 'Tap 6', NULL, NULL, NULL, 'Pcs', 30000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1801, 'Tap 8', NULL, NULL, NULL, 'Pcs', 35000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1802, 'Vinnyl Biru 10mm', NULL, NULL, NULL, 'Pcs', 300, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1803, 'Vinnyl Biru 150mm', NULL, NULL, NULL, 'Pcs', 1700, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1804, 'Vinnyl Biru 2.5mm', NULL, NULL, NULL, 'Pcs', 150, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1805, 'Vinnyl Biru 25mm', NULL, NULL, NULL, 'Pcs', 400, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1806, 'Vinnyl Biru 4mm', NULL, NULL, NULL, 'Pcs', 200, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1807, 'Vinnyl Biru 50mm', NULL, NULL, NULL, 'Pcs', 700, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1808, 'Vinnyl Biru 70mm', NULL, NULL, NULL, 'Pcs', 1000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1809, 'Vinnyl Hitam 10mm', NULL, NULL, NULL, 'Pcs', 300, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1810, 'Vinnyl Hitam 150mm', NULL, NULL, NULL, 'Pcs', 1700, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1811, 'Vinnyl Hitam 2.5mm', NULL, NULL, NULL, 'Pcs', 150, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1812, 'Vinnyl Hitam 25mm', NULL, NULL, NULL, 'Pcs', 400, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1813, 'Vinnyl Hitam 4mm', NULL, NULL, NULL, 'Pcs', 200, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1814, 'Vinnyl Hitam 50mm', NULL, NULL, NULL, 'Pcs', 700, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1815, 'Vinnyl Hitam 6mm', NULL, NULL, NULL, 'Pcs', 200, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1816, 'Vinnyl Hitam 70mm', NULL, NULL, NULL, 'Pcs', 1000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1817, 'Vinnyl Kuning 10mm', NULL, NULL, NULL, 'Pcs', 300, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1818, 'Vinnyl Kuning 150mm', NULL, NULL, NULL, 'Pcs', 1700, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1819, 'Vinnyl Kuning 2.5mm', NULL, NULL, NULL, 'Pcs', 150, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1820, 'Vinnyl Kuning 25mm', NULL, NULL, NULL, 'Pcs', 400, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1821, 'Vinnyl Kuning 4mm', NULL, NULL, NULL, 'Pcs', 200, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1822, 'Vinnyl Kuning 50mm', NULL, NULL, NULL, 'Pcs', 700, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1823, 'Vinnyl Kuning 6mm', NULL, NULL, NULL, 'Pcs', 200, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1824, 'Vinnyl Kuning 70mm', NULL, NULL, NULL, 'Pcs', 1000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1825, 'Vinnyl Merah 10mm', NULL, NULL, NULL, 'Pcs', 300, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1826, 'Vinnyl Merah 150mm', NULL, NULL, NULL, 'Pcs', 1700, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1827, 'Vinnyl Merah 2.5mm', NULL, NULL, NULL, 'Pcs', 150, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1828, 'Vinnyl Merah 25mm', NULL, NULL, NULL, 'Pcs', 400, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1829, 'Vinnyl Merah 4mm', NULL, NULL, NULL, 'Pcs', 200, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1830, 'Vinnyl Merah 50mm', NULL, NULL, NULL, 'Pcs', 700, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1831, 'Vinnyl Merah 6mm', NULL, NULL, NULL, 'Pcs', 200, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1832, 'Vinnyl Merah 70mm', NULL, NULL, NULL, 'Pcs', 1000, 0, NULL, '2019-11-15 03:18:09', '2019-11-15 03:18:09', 0),
(1850, 'Condumax', 'CLS16D-3E1P1', 'Endress Hauser', NULL, 'unit', 13500000, 0, NULL, '2019-12-09 03:29:29', '2019-12-09 03:29:29', 0),
(1851, 'Ceraliquid ', 'CPS41D-7BC2B1', 'Endress Hauser', NULL, 'unit', 6510000, 0, NULL, '2019-12-09 03:29:29', '2019-12-09 03:29:29', 0),
(1852, 'Panel Box Eex 640x860x205mm ', NULL, NULL, NULL, 'Pcs', 17800000, 0, NULL, '2019-12-09 03:40:43', '2019-12-09 03:40:43', 0),
(1853, 'Breather Drain', NULL, NULL, '2', 'Pcs', 700000, 0, NULL, '2019-12-09 03:40:43', '2019-12-09 03:42:31', 35),
(1854, 'Controller M221 40 IO relay ethernet : 24 DI  16 DO', NULL, 'Schneider', NULL, 'Unit', 6897000, 0, NULL, '2019-12-13 07:34:06', '2019-12-13 07:34:06', 0),
(1855, 'MCB 6A, 2P,', NULL, 'Schneider', '2', 'Pcs', 337150, 25, NULL, '2019-12-13 07:34:06', '2019-12-13 07:47:37', 35),
(1856, 'Emergency Stop', NULL, 'Schneider', '1', 'Pcs', 195000, 25, NULL, '2019-12-13 07:34:06', '2019-12-13 07:49:18', 35),
(1857, 'Preassure Transmitter ', NULL, NULL, NULL, 'pcs', 4500000, 0, NULL, '2019-12-13 07:44:29', '2019-12-13 07:44:29', 0),
(1858, 'Multicore 1 pair', NULL, NULL, NULL, 'mtr', 10000, NULL, NULL, '2019-12-16 01:39:58', '2019-12-16 01:39:58', 0),
(1859, 'Cementing Stud/ Glue Mounting Pad', NULL, NULL, NULL, 'pcs', 50000, NULL, NULL, '2019-12-16 01:39:58', '2019-12-16 01:39:58', 0),
(1860, 'SERVICE KIT EPDM LKH-40/60', NULL, NULL, '1', 'pcs', 19950000, 10, NULL, '2019-12-16 07:41:36', '2019-12-16 07:43:03', 35),
(1861, 'Paket Mikrokontroller', 'Raspyberry', 'Raspberry', NULL, 'Unit', 760000, 0, NULL, '2019-12-23 07:24:30', '2019-12-23 07:24:30', 0),
(1862, 'Relay ', '2 Channel', 'Rajacell', NULL, 'Pcs', 19000, 0, NULL, '2019-12-23 07:24:30', '2019-12-23 07:24:30', 0),
(1863, 'Battery Raspberry', 'Power Input', 'Toko Electrikku', NULL, 'Pcs', 287000, 0, NULL, '2019-12-23 07:24:30', '2019-12-23 07:24:30', 0),
(1864, 'Modbus RTU', 'RS 485', 'AisyahArduino', NULL, 'Pcs', 9500, 0, NULL, '2019-12-23 07:24:30', '2019-12-23 07:24:30', 0),
(1865, 'Power Supply', '220 v to 24 v', 'Alzena', NULL, 'Pcs', 80000, 0, NULL, '2019-12-23 07:24:30', '2019-12-23 07:24:30', 0),
(1866, 'Step down 5 v ', 'Step down', 'Rajacell', NULL, 'Pcs', 37500, 0, NULL, '2019-12-23 07:24:30', '2019-12-23 07:24:30', 0),
(1867, 'Box', NULL, NULL, NULL, 'Pcs', 500000, 0, NULL, '2019-12-23 07:24:30', '2019-12-23 07:24:30', 0),
(1868, 'LCD 7\"', 'LCD Touchscreen', 'NA Robotics', NULL, 'Pcs', 1055000, 0, NULL, '2019-12-23 07:24:30', '2019-12-23 07:24:30', 0),
(1869, 'Printer Struck', 'T88IV', 'Epson', NULL, 'Pcs', 800000, 0, NULL, '2019-12-23 07:24:30', '2019-12-23 07:24:30', 0),
(1870, 'Wiremesh SUS 304  50x50x3000 mm', NULL, NULL, NULL, 'btg', 375000, 0, NULL, '2020-01-06 04:05:57', '2020-01-06 04:05:57', 0),
(1871, 'Jointing', NULL, NULL, NULL, 'pcs', 35000, 0, NULL, '2020-01-06 04:05:57', '2020-01-06 04:05:57', 0),
(1872, 'clamp', NULL, NULL, NULL, 'pcs', 27500, 0, NULL, '2020-01-06 04:05:57', '2020-01-06 04:05:57', 0),
(1873, 'Long drat 1 mtr', NULL, NULL, NULL, 'btg', 55000, 0, NULL, '2020-01-06 04:05:57', '2020-01-06 04:05:57', 0),
(1874, 'bracket', NULL, NULL, NULL, 'pcs', 50000, 0, NULL, '2020-01-06 04:05:57', '2020-01-06 04:05:57', 0),
(2049, 'Panel MS 400Hx300Wx210D ', NULL, 'Local', NULL, 'unit', 700000, 0, NULL, '2020-01-24 06:25:09', '2020-01-24 06:25:09', 0),
(2050, 'Circuit breaker Easypact EZC100N - TMD - 60 A - 4 poles 3d', 'EZC100N4060', 'Schneider', NULL, 'Pcs', 1708200, 0, NULL, '2020-01-24 06:25:09', '2020-01-24 06:25:09', 0),
(2051, 'Busbar 12mmx2mm', NULL, NULL, NULL, 'Btg', 600000, 0, NULL, '2020-01-24 06:25:09', '2020-01-24 06:25:09', 0),
(2052, 'Isolator Bulat 30mmx30mm', NULL, NULL, NULL, 'Pcs', 10000, 0, NULL, '2020-01-24 06:25:09', '2020-01-24 06:25:09', 0),
(2053, 'Baut M6, ring, nut', NULL, NULL, NULL, 'Pcs', 5000, 0, NULL, '2020-01-24 06:25:09', '2020-01-24 06:25:09', 0),
(2054, 'MCB  - 1P - 6A - C curve', 'A9F74106', 'Schneider', NULL, 'Pcs', 153650, 0, NULL, '2020-01-24 06:25:09', '2020-01-24 06:25:09', 0),
(2055, 'Relay 220VAC, 4 contact C/O', 'RXM4AB2P7', 'Schneider', NULL, 'Pcs', 123400, 0, NULL, '2020-01-24 06:25:09', '2020-01-24 06:25:09', 0),
(2056, 'Socket for relay RXM2/4', 'RXZE2M114M', 'Schneider', NULL, 'Pcs', 52350, 0, NULL, '2020-01-24 06:25:09', '2020-01-24 06:25:09', 0),
(2057, 'Red flush complete illum pushbutton Ø22 spring return 1NO+1NC 220...240V', 'XB5AW34M5', 'Schneider', NULL, 'Pcs', 187750, 0, NULL, '2020-01-24 06:25:09', '2020-01-24 06:25:09', 0),
(2058, 'Green flush complete illum pushbutton Ø22 spring return 1NO+1NC 220...240V', 'XB5AW33M5', 'Schneider', NULL, 'Pcs', 187750, 0, NULL, '2020-01-24 06:25:09', '2020-01-24 06:25:09', 0),
(2059, 'Green complete pilot light Ø22 plain lens with integral LED 230...240V', 'XB5AVM3', 'Schneider', NULL, 'Pcs', 99650, 0, NULL, '2020-01-24 06:25:09', '2020-01-24 06:25:09', 0),
(2060, 'MCB 1P - 2A - C curve', 'A9F74102', 'Schneider', NULL, 'Pcs', 156300, 0, NULL, '2020-01-24 06:25:09', '2020-01-24 06:25:09', 0),
(2061, 'Green flush complete pushbutton Ø22 spring return 1NO unmarked', 'XB5AA31', 'Schneider', NULL, 'Pcs', 73250, 0, NULL, '2020-01-24 06:25:09', '2020-01-24 06:25:09', 0),
(2062, 'Red flush complete pushbutton Ø22 spring return 1NC unmarked', 'XB5AA42', 'Schneider', NULL, 'Pcs', 73250, 0, NULL, '2020-01-24 06:25:09', '2020-01-24 06:25:09', 0),
(2063, '2 position selector switch, black', 'XB5AD21', 'Schneider', NULL, 'Pcs', 121200, 0, NULL, '2020-01-24 06:25:09', '2020-01-24 06:25:09', 0),
(2064, 'Relay 220VAC, 4 contact C/O', 'RXM4AB2P7', 'Schneider', NULL, 'Pcs', 123400, 0, NULL, '2020-01-24 06:25:09', '2020-01-24 06:25:09', 0),
(2065, 'Socket for relay RXM2/4', 'RXZE2M114M', 'Schneider', NULL, 'Pcs', 52350, 0, NULL, '2020-01-24 06:25:09', '2020-01-24 06:25:09', 0),
(2066, 'Orange complete pilot light Ø22 plain lens with integral LED 230...240V', 'XB5AVM5', 'Schneider', NULL, 'Pcs', 99650, 0, NULL, '2020-01-24 06:25:09', '2020-01-24 06:25:09', 0),
(2067, 'Relay 220VAC, 4 contact C/O', 'RXM4AB2P7', 'Schneider', NULL, 'Pcs', 123400, 0, NULL, '2020-01-24 06:25:09', '2020-01-24 06:25:09', 0),
(2068, 'Socket for relay RXM2/4', 'RXZE2M114M', 'Schneider', NULL, 'Pcs', 52350, 0, NULL, '2020-01-24 06:25:09', '2020-01-24 06:25:09', 0),
(2069, 'adapter GV2 - LC1D', 'GV2AF3', 'Schneider', NULL, 'Pcs', 64500, 0, NULL, '2020-01-24 06:25:09', '2020-01-24 06:25:09', 0),
(2070, 'C Spool Assy 805084 Yamada ', NULL, NULL, NULL, 'unit', 4500000, 0, NULL, '2020-01-24 07:06:01', '2020-01-24 07:06:01', 0),
(2071, 'Preassure Transmitter ', '7MF1565-3CA00-6AA1', 'siemens', NULL, 'pcs', 4500000, 0, NULL, '2020-01-24 07:17:01', '2020-01-24 07:17:01', 0),
(2079, 'Stratix 2000 5 Port Unmanaged Switch', '1783-US5T', 'Allen Bradley', NULL, 'Pcs', 0, 0, NULL, '2020-02-04 08:01:58', '2020-02-04 08:01:58', 0),
(2080, 'Stratix 2000 8 Port Unmanaged Switch', '1783-US8T', 'Allen Bradley', NULL, 'Pcs', 0, 0, NULL, '2020-02-04 08:01:58', '2020-02-04 08:01:58', 0),
(2083, 'Cable Multicore 3x6mm', 'YSLY-JZ', 'SMI', NULL, 'M', 0, 0, NULL, '2020-02-04 08:01:58', '2020-02-04 08:01:58', 0),
(2084, 'Cable Multicore 3x2,5mm', 'YSLY-JZ', 'SMI', NULL, 'M', 0, 0, NULL, '2020-02-04 08:01:58', '2020-02-04 08:01:58', 0),
(2118, 'Compact Logix 5370 L3 Controller , Dual Ethernet w/DLR , 1 MB Memory , 8 I/O Expansion, 16 Ethernet IP Nodes , Controller  Are Shipped with 1 GB SD Card and Support up to 2 GB Card', '1769-L30ER', 'Allen Bradley', NULL, 'Pcs', 29640000, 0, NULL, '2020-02-05 02:21:56', '2020-02-05 02:21:56', 0),
(2119, 'Power Supply 120/240 VAC Input 2 Amp @ 5 VDC Output', '1769-PA 2', 'Allen Bradley', NULL, 'Pcs', 0, 0, NULL, '2020-02-05 02:21:56', '2020-02-05 02:21:56', 0),
(2120, '16 Channel Compact High- density Analaog Current Input Module', '1769-IF16C', 'Allen Bradley', NULL, 'Pcs', 16568000, 0, NULL, '2020-02-05 02:21:56', '2020-02-05 02:21:56', 0),
(2121, 'Combo 6Pt 24 VDC Snk/Srn In, 4Pt VAC/VDC Relay Out', '1769-IQ6XOW4', 'Allen Bradley', NULL, 'Pcs', 3572000, 0, NULL, '2020-02-05 02:21:56', '2020-02-05 02:21:56', 0),
(2122, 'Micro850 controller, 14 -24 DC/v AC Input . 10-24 V DC Source Output Conroller', '2080-LC50-24QBB', 'Allen Bradley', NULL, 'Pcs', 6718400, 0, NULL, '2020-02-05 02:21:56', '2020-02-05 02:21:56', 0),
(2123, '4-Channel Analog , 12 Bit Isolated Voltage/Current Output', '2085-OF4', 'Allen Bradley', NULL, 'Pcs', 3374400, 0, NULL, '2020-02-05 02:21:56', '2020-02-05 02:21:56', 0),
(2124, 'Expansion I/O End Cap/Bus Terminator', '2085-ECR', 'Allen Bradley', NULL, 'Pcs', 231040, 0, NULL, '2020-02-05 02:21:56', '2020-02-05 02:21:56', 0),
(2125, 'Stratix 2000 5 Port Unmanaged Switch', '1783-US5T', 'Allen Bradley', NULL, 'Pcs', 1808800, 0, NULL, '2020-02-05 02:21:56', '2020-02-05 02:21:56', 0),
(2126, 'Stratix 2000 8 Port Unmanaged Switch', '1783-US8T', 'Allen Bradley', NULL, 'Pcs', 2477600, 0, NULL, '2020-02-05 02:21:56', '2020-02-05 02:21:56', 0),
(2127, 'Cable Multicore 3x35mm', 'YSLY-JZ', 'SMI', NULL, 'M', 0, 0, NULL, '2020-02-05 02:21:56', '2020-02-05 02:21:56', 0),
(2128, 'Cable Multicore 3x16mm', 'YSLY-JZ', 'SMI', NULL, 'M', 0, 0, NULL, '2020-02-05 02:21:56', '2020-02-05 02:21:56', 0),
(2129, 'Cable Multicore 3x6mm', 'YSLY-JZ', 'SMI', NULL, 'M', 0, 0, NULL, '2020-02-05 02:21:56', '2020-02-05 02:21:56', 0),
(2130, 'Cable Multicore 3x2,5mm', 'YSLY-JZ', 'SMI', NULL, 'M', 0, 0, NULL, '2020-02-05 02:21:56', '2020-02-05 02:21:56', 0),
(2131, 'Cable Multicore 3x1,5mm', 'YSLY-JZ', 'SMI', NULL, 'M', 0, 0, NULL, '2020-02-05 02:21:56', '2020-02-05 02:21:56', 0),
(2132, 'Cable Multicore 14x1,5mm', 'YSLYCY-JZ', 'SMI', NULL, 'M', 0, 0, NULL, '2020-02-05 02:21:56', '2020-02-05 02:21:56', 0),
(2133, 'Cable Multicore 20x1,5mm', 'YSLYCY-JZ', 'SMI', NULL, 'M', 0, 0, NULL, '2020-02-05 02:21:56', '2020-02-05 02:21:56', 0),
(2134, 'Cable Multicore 30x1,5mm', 'YSLYCY-JZ', 'SMI', NULL, 'M', 0, 0, NULL, '2020-02-05 02:21:56', '2020-02-05 02:21:56', 0),
(2135, 'Cable Multicore 3x1,5mm', 'YSLYCY-JZ', 'SMI', NULL, 'M', 0, 0, NULL, '2020-02-05 02:21:56', '2020-02-05 02:21:56', 0),
(2136, 'Cable Ethernet Cat 6', NULL, 'Belden', NULL, 'Box', 1900000, 0, NULL, '2020-02-05 02:21:56', '2020-02-05 02:21:56', 0),
(2137, 'Cable 4 Core single mode Outdoor Direct Buried, Double Jacket 9/125um', NULL, NULL, NULL, 'M', 0, 0, NULL, '2020-02-05 02:21:56', '2020-02-05 02:21:56', 0),
(2138, 'Panel Box MS H600xW400xD250', NULL, NULL, NULL, 'Pcs', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2139, 'Circuit breaker Easypact EZC250H - TMD - 125 A - 2 poles 2d', 'EZC250H2125', 'Schneider', NULL, 'Pcs', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2140, 'IC60N - miniature circuit breaker - 2P - 63A - C curve', 'A9F74263', 'Schneider', NULL, 'Pcs', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2141, 'IC60N - miniature circuit breaker - 2P - 6A - C curve', 'A9F74206', 'Schneider', NULL, 'Pcs', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2142, 'Cable 6mm Merah', NULL, 'Federal', NULL, 'Roll', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2143, 'Cable 6mm Biru', NULL, 'Federal', NULL, 'Roll', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2144, 'Skun Ring 16mm ', NULL, NULL, NULL, 'Pcs', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2145, 'Skun Y 16mm ', NULL, NULL, NULL, 'Pcs', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2146, 'Skun Ferules 16mm ', NULL, NULL, NULL, 'Pcs', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2147, 'IC60N - miniature circuit breaker - 2P - 32A - C curve', 'A9F74232', 'Schneider', NULL, NULL, 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2148, 'Panel Box MS H400xW300xD250', NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2149, 'DIN-rail power supplies for 1-phase systems 24VDC, 5A', 'CS5.241', 'PULS', NULL, 'Pcs', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2150, 'DIN socket iPC -2P+E -16A-250VAC-NFC15100 -french std-with volt.pres.indic.light', 'A9A15307', 'Schneider', NULL, 'Pcs', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2151, ' Ethernet-to-Fiber Media Converters', 'IMC-21 Series', 'Moxa', NULL, 'Pcs', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2152, 'Feed-through terminal, Screw connection, 2.5 mm², 800 V, 24 A, dark beige', '1020000000', 'Weidmuller', NULL, 'Pcs', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2153, 'Feed-through terminal, Double-tier terminal, Screw connection, 2.5 mm², 400 V, 24 A, dark beige', '1021500000', 'Weidmuller', NULL, 'Pcs', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2154, 'W-Series, Initiator/actuator terminal, Rated cross-section: 2.5 mm², Screw connection', '1784180000', 'Weidmuller', NULL, 'Pcs', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2155, 'PE terminal, Screw connection, 2.5 mm², 300 A (2.5 mm²), green / yellow', '1020000000', 'Weidmueller', NULL, 'Ea', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2156, 'Roset 4 Core + Adapter SC FTTH/Fiber Optical Terminal Box/OTB FO/Optik', NULL, NULL, NULL, 'Pcs', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2157, 'Patchcord SC-SC Simplex Single Mode [1--5Meter]', NULL, NULL, NULL, 'Pcs', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2158, 'Cable 2,5mm Biru', NULL, 'Federal', NULL, 'Roll', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2159, 'Cable 2,5mm Biru muda', NULL, 'Jembo', NULL, 'Roll', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2160, 'Cable 2,5mm merah', NULL, 'Federal', NULL, 'Roll', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2161, 'Cable 1,5mm Biru', NULL, 'Federal', NULL, 'Roll', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2162, 'Cable 1,5mm Biru muda', NULL, 'Jembo', NULL, 'Roll', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2163, 'Cable 1,5mm merah', NULL, 'Federal', NULL, 'Roll', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2164, 'Cable 0,75mm Biru', NULL, 'Federal', NULL, 'Roll', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2165, 'Cable 0,75mm Biru muda', NULL, 'Jembo', NULL, 'Roll', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2166, 'Cable 0,5mm Biru', NULL, 'Federal', NULL, 'Roll', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2167, 'Skun Ferules 4mm', NULL, NULL, NULL, 'Pcs', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2168, 'Skun Ferules 2,5mm', NULL, NULL, NULL, 'Pcs', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2169, 'Skun Ferules 1,5mm', NULL, NULL, NULL, 'Pcs', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2170, 'Skun Ferules 0,75mm', NULL, NULL, NULL, 'Pcs', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2171, 'Skun Ferules 0,5mm', NULL, NULL, NULL, 'Pcs', 0, 0, NULL, '2020-02-05 03:04:57', '2020-02-05 03:04:57', 0),
(2172, 'Cisco ASA 5500-X with FirePOWER Services 8Port', NULL, 'Cisco', NULL, 'Pcs', 0, 0, NULL, '2020-02-05 08:49:35', '2020-02-05 08:49:35', 0),
(2173, 'W-Series, Initiator/actuator terminal, Rated cross-section: 2.5 mm², Screw connection', '1784180000', 'Weidmuller', NULL, 'Pcs', 0, 0, NULL, '2020-02-05 08:49:35', '2020-02-05 08:49:35', 0),
(2174, 'Roset 4 Core + Adapter SC FTTH/Fiber Optical Terminal Box/OTB FO/Optik', NULL, NULL, NULL, 'Pcs', 0, 0, NULL, '2020-02-05 08:49:35', '2020-02-05 08:49:35', 0),
(2175, 'Patchcord SC-SC Simplex Single Mode [1--5Meter]', NULL, NULL, NULL, 'Pcs', 0, 0, NULL, '2020-02-05 08:49:35', '2020-02-05 08:49:35', 0),
(2176, 'Connector RJ45', NULL, NULL, NULL, NULL, 0, 0, NULL, '2020-02-05 08:49:35', '2020-02-05 08:49:35', 0),
(2177, 'Cable Multicore 3x10mm', 'YSLY-JZ', 'SMI', NULL, 'M', 0, 0, NULL, '2020-02-05 08:49:35', '2020-02-05 08:49:35', 0),
(2178, 'Cable Multicore 9x1,5mm', 'YSLYCY-JZ', 'SMI', NULL, 'M', 0, 0, NULL, '2020-02-05 08:49:35', '2020-02-05 08:49:35', 0),
(2179, 'Cable Multicore 16x1,5mm', 'YSLYCY-JZ', 'SMI', NULL, 'M', 0, 0, NULL, '2020-02-05 08:49:35', '2020-02-05 08:49:35', 0),
(2180, 'Cable Multicore 3x1,5mm', 'YSLYCY-JZ', 'SMI', NULL, 'M', 0, 0, NULL, '2020-02-05 08:49:35', '2020-02-05 08:49:35', 0),
(2181, 'Cable Fiber optic', NULL, NULL, NULL, 'M', 0, 0, NULL, '2020-02-05 08:49:35', '2020-02-05 08:49:35', 0),
(2182, 'PC Desktop ( Prosesor Intel Core i7 -8700)', 'PC Intel Core I7', NULL, '1', 'Pcs', 7000000, NULL, NULL, '2020-02-14 07:18:28', '2020-02-14 07:18:28', 0),
(2183, 'Software Intouch 2017 Runtime 1K Without I/O', 'Software Intouch 2017', NULL, '1', 'Pcs', 0, NULL, NULL, '2020-02-14 07:26:42', '2020-02-14 07:26:42', 0),
(2184, 'PC Dekstop Server (Prosesor Xeon E3-1220 V6)', 'Prosesor Xeon E3-1220 V6', NULL, '1', 'Pcs', 0, NULL, NULL, '2020-02-14 07:27:51', '2020-02-14 07:27:51', 0),
(2185, 'Software Intouch 2017 And DA Server', 'Software Intouch 2017 And DA Server', NULL, '1', 'Pcs', 0, NULL, NULL, '2020-02-14 07:28:40', '2020-02-14 07:28:40', 0),
(2186, 'Printer Dot Matrix', 'Printer Dot Matrix', NULL, '1', 'Pcs', 0, NULL, NULL, '2020-02-14 07:29:12', '2020-02-14 07:29:12', 0),
(2187, 'Software Intouch 2017 Read Only 60K Tag Without RDS', 'Software Intouch 2017 Read Only 60K Tag Without RDS', NULL, '1', 'Pcs', 0, NULL, NULL, '2020-02-14 07:30:32', '2020-02-14 07:30:32', 0),
(2188, 'UPS Eaton E Series DX 300 VA', 'E Series', NULL, '1', 'Pcs', 0, NULL, NULL, '2020-02-14 07:31:35', '2020-02-14 07:31:35', 0),
(2189, 'Pipa Tubing Stainless Steel 304 OD 8 mm', 'Stainless Steel', NULL, '1', 'Pcs', 0, NULL, NULL, '2020-02-14 07:32:34', '2020-02-14 07:32:34', 0),
(2190, 'Helm Safety', 'APD', NULL, '1', 'Pcs', 18000, NULL, NULL, '2020-02-17 01:56:48', '2020-02-17 01:56:48', 0),
(2191, 'Body Harnest', 'Body Harnest', NULL, '1', 'Pcs', 0, NULL, NULL, '2020-02-17 01:57:29', '2020-02-17 01:57:29', 0),
(2192, 'Tali Tambang', '-', NULL, '1', 'Pcs', 0, NULL, NULL, '2020-02-17 01:57:59', '2020-02-17 01:57:59', 0),
(2193, 'Handy Talky', 'V80 ICV 80', 'ICOM', '1', 'Pcs', 0, NULL, NULL, '2020-02-17 01:58:44', '2020-02-17 01:58:44', 0),
(2194, 'Antenna Handy Talky', 'GNR-21P', 'ICOM', '1', 'Pcs', 0, NULL, NULL, '2020-02-17 01:59:31', '2020-02-17 01:59:31', 0),
(2195, 'Mesin Bor Listrik', 'Mesin Bor', 'Krisbow', '1', 'Pcs', 0, NULL, NULL, '2020-02-17 02:00:04', '2020-02-17 02:00:04', 0),
(2196, 'Kabel Hitam 1 x 35 mm', 'Kabel', 'Jembo', '5', 'Meter', 0, NULL, NULL, '2020-02-17 02:34:44', '2020-02-17 02:34:44', 0),
(2197, 'kabel Hitam 1 x 16 mm', '16 mm', 'Jembo', '5', 'Meter', 0, NULL, NULL, '2020-02-17 02:36:36', '2020-02-17 02:36:36', 0),
(2198, 'Skun Y', '35 mm', NULL, '20', 'Pcs', 0, NULL, NULL, '2020-02-17 02:37:20', '2020-02-17 02:37:20', 0),
(2199, 'Skun Ring 35 mm', 'Skun Ring 35 mm', NULL, '20', 'Pcs', 0, NULL, NULL, '2020-02-17 02:38:06', '2020-02-17 02:38:06', 0),
(2200, 'Skun Ring 16 mm', 'Skun Ring 16 mm', NULL, '20', 'Pcs', 0, NULL, NULL, '2020-02-17 02:38:31', '2020-02-17 02:38:31', 0),
(2201, 'Skun Ferul 16 mm', 'Skun Ferul 16 mm', NULL, '20', 'Pcs', 0, NULL, NULL, '2020-02-17 02:39:08', '2020-02-17 02:39:08', 0),
(2202, 'Vynil Biru 35 mm', 'Vynil Biru 35 mm', NULL, '20', 'Pcs', 0, NULL, NULL, '2020-02-17 02:48:07', '2020-02-17 02:48:07', 0),
(2203, 'Vynil Biru 16 mm', 'Vynil Biru 16 mm', NULL, '20', 'Pcs', 0, NULL, NULL, '2020-02-17 02:50:47', '2020-02-17 02:50:47', 0),
(2204, 'Vynil Biru 10 mm', 'Vynil Biru 10 mm', NULL, '20', 'Pcs', 0, NULL, NULL, '2020-02-17 02:51:07', '2020-02-17 02:51:07', 0),
(2205, 'Vynil Merah 35 mm', 'Vynil Merah 35 mm', NULL, '20', 'Pcs', 0, NULL, NULL, '2020-02-17 03:14:04', '2020-02-17 03:14:04', 0),
(2206, 'Vynil Merah 16 mm', 'Vynil Merah 16 mm', NULL, '20', 'Pcs', 0, NULL, NULL, '2020-02-17 03:16:51', '2020-02-17 03:16:51', 0),
(2207, 'Vynyl Merah 10 mm', 'Vynil Merah 10 mm', NULL, '20', 'Pcs', 0, NULL, NULL, '2020-02-17 03:17:35', '2020-02-17 03:17:35', 0),
(2208, 'Cable Gland M20 Hitam', 'Cable Gland M20 HItam', NULL, '30', 'Pcs', 0, NULL, NULL, '2020-02-17 03:18:28', '2020-02-17 03:18:28', 0),
(2209, 'Cable Gland M16 Hitam', 'Cable Gland M16 HItam', NULL, '30', 'Pcs', 0, NULL, NULL, '2020-02-17 03:19:00', '2020-02-17 03:19:00', 0),
(2210, 'Cable MUlticore 3 x 35 mm', '3 X 35 mm', 'SMI', '35', 'Meter', 0, NULL, NULL, '2020-02-17 04:37:30', '2020-02-17 04:37:30', 0),
(2211, 'Cable Multicore 3 x 16 mm', 'Multicore 3 x 16 mm', 'SMI', '25', 'Meter', 0, NULL, NULL, '2020-02-17 06:48:13', '2020-02-17 06:48:13', 0),
(2212, 'Cable Multicore 3 x 6 mm', 'Multicore 3 x 6 mm', 'SMI', '150', 'Meter', 0, NULL, NULL, '2020-02-17 06:49:02', '2020-02-17 06:49:02', 0),
(2213, 'Cable Multicore 3 x 2.5 mm', 'Multicore  3 x 2.5 mm', 'SMI', '265', 'Meter', 0, NULL, NULL, '2020-02-17 06:50:47', '2020-02-17 06:50:47', 0),
(2214, 'Cable Multicore 3 x 1.5 mm', 'Multicore 3 x 1.5 mm', 'SMI', '140', 'Meter', 0, NULL, NULL, '2020-02-17 06:54:12', '2020-02-17 06:54:12', 0),
(2215, 'skun Y 16mm', NULL, NULL, NULL, 'pcs', 0, 0, NULL, '2020-02-17 09:05:15', '2020-02-17 09:05:15', 0),
(2216, 'skun Y 16mm', NULL, NULL, NULL, 'pcs', 0, 0, NULL, '2020-02-17 09:05:15', '2020-02-17 09:05:15', 0),
(2217, 'skun ferules 6mm', NULL, NULL, NULL, 'pcs', 0, 0, NULL, '2020-02-17 09:05:15', '2020-02-17 09:05:15', 0),
(2218, 'skun ferules 6mm', NULL, NULL, NULL, 'pcs', 0, 0, NULL, '2020-02-17 09:05:15', '2020-02-17 09:05:15', 0),
(2229, 'Cable Multicore 14x1,5mm', 'YSLYCY-JZ', 'SMI', NULL, 'M', 0, 0, NULL, '2020-02-17 09:13:19', '2020-02-17 09:13:19', 0),
(2230, 'Cable Multicore 20x1,5mm', 'YSLYCY-JZ', 'SMI', NULL, 'M', 0, 0, NULL, '2020-02-17 09:13:19', '2020-02-17 09:13:19', 0),
(2231, 'Cable Multicore 30x1,5mm', 'YSLYCY-JZ', 'SMI', NULL, 'M', 0, 0, NULL, '2020-02-17 09:13:19', '2020-02-17 09:13:19', 0),
(2232, 'Cable Multicore 3x1,5mm', 'YSLYCY-JZ', 'SMI', NULL, 'M', 0, 0, NULL, '2020-02-17 09:13:19', '2020-02-17 09:13:19', 0),
(2233, 'Cable Ethernet Cat 6', NULL, 'Belden', NULL, 'Box', 0, 0, NULL, '2020-02-17 09:13:19', '2020-02-17 09:13:19', 0),
(2234, 'Cable 4 Core single mode Outdoor Direct Buried, Double Jacket 9/125um', NULL, NULL, NULL, 'M', 0, 0, NULL, '2020-02-17 09:13:19', '2020-02-17 09:13:19', 0),
(2235, 'Bolt & nut M8 x 40L', NULL, NULL, NULL, 'pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2236, 'Grounding Bar,copper tine,400mm x 50 mm x 6mm', NULL, 'Jembo', NULL, 'pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2237, 'Grounding Cable 35sqmm', 'Power earth bar-1 to power earth bar-3', 'Jembo', NULL, 'M', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2238, 'Grounding Cable 70sqmm', 'Field to control room', 'Jembo', NULL, 'M', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2239, 'Panel Single Door (HxWxD)1500X800X400 free standing', NULL, 'Cometal', NULL, 'Unit', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2240, 'PLC', '2080-LC70-24QBB', 'Allen Bradley', NULL, 'Unit', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2241, 'Modul DI  24 VDC 16 Chanel', '2085-IQ16', 'Allen Bradley', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2242, 'Modul DO 24 VDC 16 Chanel', '2085-OB16', 'Allen Bradley', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2243, 'Modul AI 4-20mA 8 Chanel', '2085-IF8', 'Allen Bradley', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2244, 'HMI 7\"', '2711R-T7T', 'Allen Bradley', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2245, 'IC60N - miniature circuit breaker - 1P - 10A - C curve', 'A9F74110', 'Schneider', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2246, 'Fuse 2A', NULL, NULL, NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2247, 'DIN-rail power supplies for 1-phase systems 24V, 20A', 'PIC240.241C', 'Puls', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2248, 'Relay 24VDC, 4 contact C/O', 'RXM4AB2BD', 'Schneider', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2249, 'Socket for relay RXM2/4', 'RXZE1M4C', 'Schneider', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2250, 'Selector switch (auto / manual)', NULL, 'salzer', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2251, 'PLC', '2080-LC70-24QBB', 'Allen Bradley', NULL, 'Unit', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2252, 'Modul AI 4-20mA 8 Chanel', '2085-IF8', 'Allen Bradley', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2253, 'Modul AO 4-20mA 8 Chanel', '2085-OF4', 'Allen Bradley', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2254, 'HMI 7\"', '2711R-T7T', 'Allen Bradley', NULL, 'Lot', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2255, 'MCB 10A', 'A9F74110', 'Schneider', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2256, 'Fuse 2A', NULL, NULL, NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2257, 'DIN-rail power supplies for 1-phase systems 24V, 20A', 'PIC240.241C', 'Puls', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2258, 'Relay 24VDC, 4 contact C/O', 'RXM4AB2BD', 'Schneider', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2259, 'Socket for relay RXM2/4', 'RXZE1M4C', 'Schneider', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2260, 'Selector switch (auto / manual)', NULL, 'salzer', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2261, 'Din Rill', 'Ts 35/x7,5', 'Weidmuller', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2262, 'Panel Single Door (HxWxD)1500X800X400 free standing', NULL, 'Cometal', NULL, 'Unit', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2263, 'PLC', '2080-LC70-24QBB', 'Allen Bradley', NULL, 'Unit', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2264, 'Modul DI  24 VDC 16 Chanel', '2085-IQ16', 'Allen Bradley', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2265, 'Modul DO 24 VDC 16 Chanel', '2085-OB16', 'Allen Bradley', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2266, 'DIN-rail power supplies for 1-phase systems 24V, 20A', 'PIC240.241C', 'Puls', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2267, 'MCB 10A', 'A9F74110', 'Schneider', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2268, 'Fuse 2A', NULL, NULL, NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2269, 'Relay 24VDC, 4 contact C/O', 'RXM4AB2BD', 'Schneider', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2270, 'Socket for relay RXM2/4', 'RXZE1M4C', 'Schneider', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2271, 'Selector switch (auto / manual)', NULL, 'salzer', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2272, 'Pressure Gauge 1,6 Bar c/w Accessories', NULL, 'Wika', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2273, 'Pressure Gauge 6 Bar c/w Accessories', NULL, 'Wika', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2274, 'Pressure Gauge 60 Bar c/w Accessories', NULL, 'Wika', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2275, 'Cable Gland 1/2\" NPT', NULL, NULL, NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2276, 'Cable Gland 3/4\" NPT', NULL, NULL, NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2277, 'Ethernet Cable (Cat6)', '1 roll 300meter', NULL, NULL, 'ROLL', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2278, 'Isolasi PVC Tape 1/2\"(W)', 'Hitam', 'PVC', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2279, 'Isolasi PVC Tape 1/2\"(W)', 'Hijau', 'PVC', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2280, 'Isolasi PVC Tape 1/2\"(W)', 'merah', 'PVC', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2281, 'Isolasi PVC Tape 1/2\"(W)', 'Kuning', 'PVC', NULL, 'Pcs', 0, 0, NULL, '2020-02-18 02:16:18', '2020-02-18 02:16:18', 0),
(2282, 'Panel Box MS H600 x W500 x D250', 'Panel Box MS', NULL, '1', 'Pcs', 0, NULL, NULL, '2020-02-18 04:03:40', '2020-02-18 04:03:40', 0);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_10_11_014556_create_roles_table', 2),
(4, '2019_10_11_014738_create_role_user_table', 2),
(5, '2019_10_11_090637_create_departements_table', 3),
(6, '2019_10_13_020624_alter_users_table', 4),
(7, '2019_10_13_022931_create_privileges_table', 5),
(10, '2019_10_13_023220_create_privilege_departement_table', 6),
(11, '2019_10_13_025755_rename_table_privilege_departement', 6),
(12, '2019_10_15_015250_alter_users_table', 7),
(13, '2019_10_16_013955_create_items_table', 8),
(14, '2019_10_16_015854_alter_items_table', 9),
(15, '2019_10_16_154549_create_customers_table', 9),
(16, '2019_10_16_163328_create_projects_table', 10),
(17, '2019_10_18_095413_create_project_items', 11),
(18, '2019_10_18_101312_alter_project_items_table', 12),
(19, '2019_10_18_155529_create_purchase_requests_table', 13),
(20, '2019_10_21_101633_create_purchase_requisitions_table', 14),
(21, '2019_10_23_094251_create_purchase_requisition_items_table', 15),
(22, '2019_10_25_103851_create_purchase_orders_table', 16),
(23, '2019_10_25_155027_create_purchase_order_items', 17),
(24, '2019_10_28_105718_alter_purchase_orders_table', 18),
(25, '2019_10_28_110649_alter_purchase_requisitions_table', 19),
(26, '2019_10_28_134749_alter_purchase_order_items_table', 20),
(27, '2019_10_29_093657_alter_purchase_orders_table', 21),
(28, '2019_10_29_132952_alter_purchase_orders_table', 22),
(30, '2019_10_29_144748_create_vendors_table', 23),
(31, '2019_10_31_111510_create_warehouse_items_table', 24);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `privileges`
--

CREATE TABLE `privileges` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `privileges`
--

INSERT INTO `privileges` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(7, 'Dashboard', '', NULL, NULL),
(8, 'UsersView', '', NULL, NULL),
(9, 'UsersCreate', '', NULL, NULL),
(10, 'UsersEdit', '', NULL, NULL),
(11, 'UsersDelete', '', NULL, NULL),
(12, 'DepartementsView', '', NULL, NULL),
(13, 'DepartementsCreate', '', NULL, NULL),
(14, 'DepartementsEdit', '', NULL, NULL),
(15, 'DepartementsDelete', '', NULL, NULL),
(16, 'ItemsView', '', NULL, NULL),
(17, 'ItemsCreate', '', NULL, NULL),
(18, 'ItemsEdit', '', NULL, NULL),
(19, 'ItemsDelete', '', NULL, NULL),
(20, 'CustomersView', '', NULL, NULL),
(21, 'CustomersCreate', '', NULL, NULL),
(22, 'CustomersEdit', '', NULL, NULL),
(23, 'CustomersDelete', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `project_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `project_number`, `name`, `description`, `customer_id`, `created_at`, `updated_at`) VALUES
(7, '19.12.002', 'Automation Control', NULL, '13', '2019-12-06 07:38:39', '2019-12-06 07:38:39'),
(8, '19.12.003', 'indofood Punchlist 1', NULL, '14', '2019-12-09 02:47:35', '2019-12-09 02:47:35'),
(9, '19.12.004', 'indofood punchlist 2', NULL, '14', '2019-12-09 02:49:10', '2019-12-09 02:49:10'),
(10, '19.12.005', 'RB Conductivity', NULL, '14', '2019-12-09 02:49:57', '2019-12-09 02:49:57'),
(11, '19.12.006', 'indofood punchlist 3', NULL, '14', '2019-12-09 02:50:55', '2019-12-09 02:50:55'),
(12, '19.12.007', 'Service kit EPDM', NULL, '14', '2019-12-09 02:51:54', '2019-12-09 02:53:30'),
(13, '19.12.008', 'Jetec Additional Bounty Segar Indonesia', NULL, '15', '2019-12-09 03:48:15', '2019-12-09 03:48:15'),
(15, '19.12.009', 'material Pressure Transmitter', NULL, '16', '2019-12-13 07:41:19', '2019-12-13 07:41:19'),
(17, '19.12.011', 'SPBU IOT', NULL, '18', '2019-12-23 07:15:22', '2019-12-23 07:15:22'),
(18, '20.01.012', 'material Wiremesh SUS 304', NULL, '19', '2020-01-06 03:40:03', '2020-01-06 03:40:03'),
(19, '20.01.013', 'additional material', NULL, '13', '2020-01-15 08:56:10', '2020-01-15 08:56:10'),
(20, '20.01.014', 'Material sparepart Yamada', NULL, '14', '2020-01-24 07:02:28', '2020-01-24 07:02:28'),
(21, '20.01.015', 'Material Pressure Transmitter siemens', NULL, '20', '2020-01-24 07:16:37', '2020-01-24 07:16:37'),
(22, '20.01.016', 'Training Plc Siemens', NULL, '21', '2020-01-24 07:25:16', '2020-01-24 07:25:16'),
(23, '20.01.017', 'Man hour Teknisi', NULL, '22', '2020-01-24 07:26:38', '2020-01-24 07:26:38'),
(24, '20.01.018', 'NEW UHT INSTALLATION', NULL, '23', '2020-01-27 01:26:48', '2020-01-27 01:26:48'),
(25, '20.01.019', 'Pekerjaan Remote Control Monitoring System', NULL, '24', '2020-01-27 02:02:41', '2020-01-27 02:02:41'),
(27, '20.02.020', 'CEMS SURALAYA', NULL, '25', '2020-02-04 02:37:03', '2020-02-04 02:37:03'),
(30, '20.02.021', 'RAMA TEST123', 'tsa', '23', '2020-02-14 04:40:17', '2020-02-14 04:43:24'),
(31, '20.02.022', 'automation & instalasi', NULL, '26', '2020-02-18 02:15:50', '2020-02-18 02:15:50');

-- --------------------------------------------------------

--
-- Table structure for table `project_items`
--

CREATE TABLE `project_items` (
  `id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mfg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `disc` int(11) DEFAULT NULL,
  `total_cost` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_items`
--

INSERT INTO `project_items` (`id`, `item_id`, `description`, `type`, `mfg`, `qty`, `unit`, `price`, `disc`, `total_cost`, `created_by`, `created_at`, `updated_at`, `project_id`) VALUES
(11, 1850, 'Condumax', 'CLS16D-3E1P1', 'Endress Hauser', '1', 'unit', 13500000, 0, NULL, 35, '2019-12-09 03:30:42', '2019-12-09 03:30:42', 10),
(12, 1851, 'Ceraliquid ', 'CPS41D-7BC2B1', 'Endress Hauser', '1', 'unit', 6510000, 0, NULL, 35, '2019-12-09 03:30:53', '2019-12-09 03:30:53', 10),
(14, 1852, 'Panel Box Eex 640x860x205mm ', NULL, NULL, '1', 'Pcs', 17800000, 0, NULL, 35, '2019-12-09 03:41:27', '2019-12-09 03:41:27', 9),
(15, 1853, 'Breather Drain', NULL, NULL, '2', 'Pcs', 700000, 0, NULL, 35, '2019-12-09 03:43:24', '2019-12-09 03:43:24', 9),
(16, 1674, 'PC Socket 2 pole + neutral 10/16A 250V din Rail', 'A9A15307', 'Schneider', '1', 'Pcs', 342300, 0, NULL, 35, '2019-12-09 07:20:09', '2019-12-09 07:20:09', 7),
(17, 1627, 'Power Supply 100-240VAC/24VDC, 5A', NULL, 'PULS', '1', 'Pcs', 1100000, 0, NULL, 35, '2019-12-09 07:22:43', '2019-12-09 07:22:43', 7),
(18, 1735, 'Terminal PE, Screw connection, 2.5 mm², 300 A (2.5 mm²), green / yellow', '1010000000', 'Weidmuller', '1', 'pcs', 41000, 0, NULL, 35, '2019-12-09 07:28:32', '2019-12-09 07:28:32', 7),
(19, 1678, 'Socket for relay RXM2/4', 'RXZE1M4C', 'Schneider', '1', 'Pcs', 30498, 0, NULL, 35, '2019-12-09 07:33:12', '2019-12-09 07:33:12', 7),
(20, 1513, 'Fan 230VAC 172 x 172', NULL, 'Fort', '1', 'Pcs', 175000, 0, NULL, 35, '2019-12-09 07:35:21', '2019-12-09 07:35:21', 7),
(21, 1514, 'Fan Fillter 204 x 204', NULL, 'Fort', '1', 'Pcs', 95000, 0, NULL, 35, '2019-12-09 07:35:38', '2019-12-09 07:35:38', 7),
(22, 1583, 'Limit Switch Door NO & NC', NULL, 'Local', '1', 'Pcs', 72500, 0, NULL, 35, '2019-12-09 07:38:28', '2019-12-09 07:38:28', 7),
(29, 1643, 'Lamp LED 220VAC Green', 'XB4BVM3', 'Schneider', '1', 'Pcs', 112255, 0, NULL, 35, '2019-12-09 07:58:06', '2019-12-09 07:58:06', 7),
(30, 1644, 'Lamp LED 220VAC red', 'XB4BVM4', 'Schneider', '1', 'Pcs', 112255, 0, NULL, 35, '2019-12-09 07:58:41', '2019-12-09 07:58:41', 7),
(31, 1645, 'Lamp LED 220VAC Yellow', 'XB4BVM5', 'Schneider', '1', 'Pcs', 112255, 0, NULL, 35, '2019-12-09 07:58:58', '2019-12-09 07:58:58', 7),
(36, 1503, 'Cable 1x2.5mm2 (blue)', 'NYAF', 'Federal', '2', 'Pcs', 336000, 0, NULL, 35, '2019-12-09 08:36:14', '2019-12-09 08:36:14', 7),
(37, 1505, 'Cable 1x2.5mm2 (red)', 'NYAF', 'Federal', '2', 'roll', 336000, 0, NULL, 35, '2019-12-09 08:36:26', '2019-12-09 08:36:26', 7),
(38, 1530, 'Cable 1x2.5mm2 (Black)', 'NYAF', 'Jembo', '2', 'Roll', 384000, 0, NULL, 35, '2019-12-09 08:37:16', '2019-12-09 08:37:16', 7),
(41, 1666, 'MCB iC60NN 2P 4A', 'A9F74204', 'Schneider', '2', 'pcs', 404250, 0, NULL, 35, '2019-12-09 08:52:17', '2019-12-09 08:52:17', 7),
(42, 1523, 'Cable 1x1.5mm2 (black)', 'NYAF', 'Jembo', '2', 'Roll', 203000, 0, NULL, 35, '2019-12-09 08:59:17', '2019-12-09 08:59:17', 7),
(43, 1524, 'Cable 1x1.5mm2 (white)', 'NYAF', 'Jembo', '2', 'Roll', 220000, 0, 220000, 35, '2019-12-09 08:59:21', '2019-12-09 08:59:21', 7),
(44, 1665, 'MCB iC60NN 2P 2A', 'A9F74202', 'Schneider', '2', 'pcs', 404250, 0, NULL, 35, '2019-12-09 09:11:14', '2019-12-09 09:11:14', 7),
(52, 1856, 'Emergency Stop', NULL, 'Schneider', '1', 'Pcs', 195000, 0, NULL, 35, '2019-12-13 07:35:05', '2019-12-13 07:35:05', 7),
(56, 1857, 'Preassure Transmitter ', NULL, NULL, '1', 'pcs', 4500000, 0, NULL, 35, '2019-12-13 07:45:16', '2019-12-13 07:45:16', 15),
(57, 1855, 'MCB 6A, 2P,', NULL, 'Schneider', '2', 'Pcs', 337150, 25, NULL, 35, '2019-12-13 07:49:42', '2019-12-13 07:49:42', 7),
(61, 1860, 'SERVICE KIT EPDM LKH-40/60', NULL, NULL, '1', 'pcs', 19950000, 10, NULL, 35, '2019-12-16 07:43:31', '2019-12-16 07:43:31', 12),
(62, 1862, 'Relay ', '2 Channel', 'Rajacell', '1', 'Pcs', 19000, 0, NULL, 35, '2019-12-23 07:26:13', '2019-12-23 07:26:13', 17),
(63, 1861, 'Paket Mikrokontroller', 'Raspyberry', 'Raspberry', '1', 'Unit', 760000, 0, NULL, 35, '2019-12-23 07:26:29', '2019-12-23 07:26:29', 17),
(64, 1863, 'Battery Raspberry', 'Power Input', 'Toko Electrikku', '1', 'Pcs', 287000, 0, NULL, 35, '2019-12-23 07:26:44', '2019-12-23 07:26:44', 17),
(65, 1864, 'Modbus RTU', 'RS 485', 'AisyahArduino', '1', 'Pcs', 9500, 0, NULL, 35, '2019-12-23 07:27:08', '2019-12-23 07:27:08', 17),
(66, 1865, 'Power Supply', '220 v to 24 v', 'Alzena', '1', 'Pcs', 80000, 0, NULL, 35, '2019-12-23 07:27:25', '2019-12-23 07:27:25', 17),
(67, 1866, 'Step down 5 v ', 'Step down', 'Rajacell', '1', 'Pcs', 37500, 0, NULL, 35, '2019-12-23 07:27:42', '2019-12-23 07:27:42', 17),
(68, 1867, 'Box', NULL, NULL, '1', 'Pcs', 500000, 0, NULL, 35, '2019-12-23 07:27:55', '2019-12-23 07:27:55', 17),
(69, 1868, 'LCD 7\"', 'LCD Touchscreen', 'NA Robotics', '1', 'Pcs', 1055000, 0, NULL, 35, '2019-12-23 07:28:10', '2019-12-23 07:28:10', 17),
(70, 1869, 'Printer Struck', 'T88IV', 'Epson', '1', 'Pcs', 800000, 0, NULL, 35, '2019-12-23 07:28:30', '2019-12-23 07:28:30', 17),
(72, 1874, 'bracket', NULL, NULL, '20', 'pcs', 50000, 0, NULL, 35, '2020-01-06 04:07:50', '2020-01-06 04:07:50', 18),
(73, 1873, 'Long drat 1 mtr', NULL, NULL, '10', 'btg', 55000, 0, NULL, 35, '2020-01-06 04:08:04', '2020-01-06 04:08:04', 18),
(74, 1872, 'clamp', NULL, NULL, '40', 'pcs', 27500, 0, NULL, 35, '2020-01-06 04:19:03', '2020-01-06 04:19:03', 18),
(75, 1871, 'Jointing', NULL, NULL, '30', 'pcs', 35000, 0, NULL, 35, '2020-01-06 04:19:32', '2020-01-06 04:19:32', 18),
(78, 2049, 'Panel MS 400Hx300Wx210D ', NULL, 'Local', '1', 'unit', 700000, 0, NULL, 35, '2020-01-24 06:25:56', '2020-01-24 06:25:56', 19),
(79, 2050, 'Circuit breaker Easypact EZC100N - TMD - 60 A - 4 poles 3d', 'EZC100N4060', 'Schneider', '1', 'Pcs', 1708200, 0, NULL, 35, '2020-01-24 06:26:40', '2020-01-24 06:26:40', 19),
(80, 2051, 'Busbar 12mmx2mm', NULL, NULL, '1', 'Btg', 600000, 0, NULL, 35, '2020-01-24 06:26:57', '2020-01-24 06:26:57', 19),
(83, 2054, 'MCB  - 1P - 6A - C curve', 'A9F74106', 'Schneider', '1', 'Pcs', 153650, 0, NULL, 35, '2020-01-24 06:27:50', '2020-01-24 06:27:50', 19),
(86, 2057, 'Red flush complete illum pushbutton Ø22 spring return 1NO+1NC 220...240V', 'XB5AW34M5', 'Schneider', '4', 'Pcs', 187750, 0, NULL, 35, '2020-01-24 06:29:27', '2020-01-24 06:29:27', 19),
(87, 2058, 'Green flush complete illum pushbutton Ø22 spring return 1NO+1NC 220...240V', 'XB5AW33M5', 'Schneider', '4', 'Pcs', 187750, 0, NULL, 35, '2020-01-24 06:29:45', '2020-01-24 06:29:45', 19),
(88, 2059, 'Green complete pilot light Ø22 plain lens with integral LED 230...240V', 'XB5AVM3', 'Schneider', '3', 'Pcs', 99650, 0, NULL, 35, '2020-01-24 06:30:13', '2020-01-24 06:30:13', 19),
(89, 2060, 'MCB 1P - 2A - C curve', 'A9F74102', 'Schneider', '1', 'Pcs', 156300, 0, NULL, 35, '2020-01-24 06:30:32', '2020-01-24 06:30:32', 19),
(90, 2061, 'Green flush complete pushbutton Ø22 spring return 1NO unmarked', 'XB5AA31', 'Schneider', '3', 'Pcs', 73250, 0, NULL, 35, '2020-01-24 06:30:59', '2020-01-24 06:30:59', 19),
(91, 2062, 'Red flush complete pushbutton Ø22 spring return 1NC unmarked', 'XB5AA42', 'Schneider', '3', 'Pcs', 73250, 0, NULL, 35, '2020-01-24 06:31:26', '2020-01-24 06:31:26', 19),
(92, 2063, '2 position selector switch, black', 'XB5AD21', 'Schneider', '1', 'Pcs', 121200, 0, NULL, 35, '2020-01-24 06:31:51', '2020-01-24 06:31:51', 19),
(94, 2066, 'Orange complete pilot light Ø22 plain lens with integral LED 230...240V', 'XB5AVM5', 'Schneider', '1', 'Pcs', 99650, 0, NULL, 35, '2020-01-24 06:36:03', '2020-01-24 06:36:03', 19),
(97, 2069, 'adapter GV2 - LC1D', 'GV2AF3', 'Schneider', '1', 'Pcs', 64500, 0, NULL, 35, '2020-01-24 06:37:28', '2020-01-24 06:37:28', 19),
(98, 2064, 'Relay 220VAC, 4 contact C/O', 'RXM4AB2P7', 'Schneider', '5', 'Pcs', 123400, 0, NULL, 35, '2020-01-24 06:43:14', '2020-01-24 06:43:14', 19),
(99, 2068, 'Socket for relay RXM2/4', 'RXZE2M114M', 'Schneider', '5', 'Pcs', 52350, 0, NULL, 35, '2020-01-24 06:47:55', '2020-01-24 06:47:55', 19),
(100, 2053, 'Baut M6, ring, nut', NULL, NULL, '50', 'Pcs', 5000, 0, NULL, 35, '2020-01-24 06:54:02', '2020-01-24 06:54:02', 19),
(101, 2052, 'Isolator Bulat 30mmx30mm', NULL, NULL, '10', 'Pcs', 10000, 0, NULL, 35, '2020-01-24 06:55:14', '2020-01-24 06:55:14', 19),
(102, 1870, 'Wiremesh SUS 304  50x50x3000 mm', NULL, NULL, '10', 'btg', 375000, 0, NULL, 35, '2020-01-24 06:58:20', '2020-01-24 06:58:20', 18),
(103, 2070, 'C Spool Assy 805084 Yamada ', NULL, NULL, '1', 'unit', 4500000, 0, NULL, 35, '2020-01-24 07:06:19', '2020-01-24 07:06:19', 20),
(105, 2071, 'Preassure Transmitter ', '7MF1565-3CA00-6AA1', 'siemens', '3', 'pcs', 4500000, 0, NULL, 35, '2020-01-24 07:18:50', '2020-01-24 07:18:50', 21),
(106, 1855, 'MCB 6A, 2P,', NULL, 'Schneider', '1', 'Pcs', 337150, 25, NULL, 35, '2020-01-27 01:43:58', '2020-01-27 01:43:58', 24),
(108, 2118, 'Compact Logix 5370 L3 Controller , Dual Ethernet w/DLR , 1 MB Memory , 8 I/O Expansion, 16 Ethernet IP Nodes , Controller  Are Shipped with 1 GB SD Card and Support up to 2 GB Card', '1769-L30ER', 'Allen Bradley', '1', 'Pcs', 29640000, 0, NULL, 35, '2020-02-05 02:26:45', '2020-02-05 02:26:45', 27),
(109, 2119, 'Power Supply 120/240 VAC Input 2 Amp @ 5 VDC Output', '1769-PA 2', 'Allen Bradley', '1', 'Pcs', 0, 0, NULL, 35, '2020-02-05 02:27:12', '2020-02-05 02:27:12', 27),
(110, 2120, '16 Channel Compact High- density Analaog Current Input Module', '1769-IF16C', 'Allen Bradley', '1', 'Pcs', 16568000, 0, NULL, 35, '2020-02-05 02:27:29', '2020-02-05 02:27:29', 27),
(111, 2121, 'Combo 6Pt 24 VDC Snk/Srn In, 4Pt VAC/VDC Relay Out', '1769-IQ6XOW4', 'Allen Bradley', '1', 'Pcs', 3572000, 0, NULL, 35, '2020-02-05 02:28:04', '2020-02-05 02:28:04', 27),
(112, 2122, 'Micro850 controller, 14 -24 DC/v AC Input . 10-24 V DC Source Output Conroller', '2080-LC50-24QBB', 'Allen Bradley', '1', 'Pcs', 6718400, 0, NULL, 35, '2020-02-05 02:28:19', '2020-02-05 02:28:19', 27),
(113, 2123, '4-Channel Analog , 12 Bit Isolated Voltage/Current Output', '2085-OF4', 'Allen Bradley', '4', 'Pcs', 3374400, 0, NULL, 35, '2020-02-05 02:28:37', '2020-02-05 02:28:37', 27),
(114, 2124, 'Expansion I/O End Cap/Bus Terminator', '2085-ECR', 'Allen Bradley', '1', 'Pcs', 231040, 0, NULL, 35, '2020-02-05 02:28:57', '2020-02-05 02:28:57', 27),
(115, 2125, 'Stratix 2000 5 Port Unmanaged Switch', '1783-US5T', 'Allen Bradley', '2', 'Pcs', 1808800, 0, NULL, 35, '2020-02-05 02:29:25', '2020-02-05 02:29:25', 27),
(116, 2080, 'Stratix 2000 8 Port Unmanaged Switch', '1783-US8T', 'Allen Bradley', '1', 'Pcs', 0, 0, NULL, 35, '2020-02-05 02:29:41', '2020-02-05 02:29:41', 27),
(118, 1597, 'Skun Ferullus 6 mm', NULL, 'Local', '100', 'Pcs', 400, 0, NULL, 35, '2020-02-05 02:36:34', '2020-02-05 02:36:34', 27),
(119, 1593, 'Skun Ferullus 2.5 mm', NULL, 'Local', '100', 'Pcs', 200, 0, NULL, 35, '2020-02-05 02:37:15', '2020-02-05 02:37:15', 27),
(120, 1591, 'Skun Ferullus 1.5mm', NULL, 'Local', '100', 'Pcs', 175, 0, NULL, 35, '2020-02-05 02:37:36', '2020-02-05 02:37:36', 27),
(121, 1738, 'Terminal, Screw connection, 2.5 mm², 800 V, 24 A, Dark Beige', '1020000000', 'Weidmuller', '16', 'pcs', 8000, 0, NULL, 35, '2020-02-05 02:39:15', '2020-02-05 02:39:15', 27),
(124, 1470, 'HMI Beijer 7\"', 'X2Base7', 'Beijer', '1', 'Unit', 0, 0, NULL, 35, '2020-02-05 02:42:01', '2020-02-05 02:42:01', 27),
(125, 2138, 'Panel Box MS H600xW400xD250', NULL, NULL, '4', 'Pcs', 0, 0, NULL, 35, '2020-02-05 03:07:02', '2020-02-05 03:07:02', 27),
(126, 2139, 'Circuit breaker Easypact EZC250H - TMD - 125 A - 2 poles 2d', 'EZC250H2125', 'Schneider', '1', 'Pcs', 0, 0, NULL, 35, '2020-02-05 03:08:05', '2020-02-05 03:08:05', 27),
(127, 2140, 'IC60N - miniature circuit breaker - 2P - 63A - C curve', 'A9F74263', 'Schneider', '1', 'Pcs', 0, 0, NULL, 35, '2020-02-05 03:08:46', '2020-02-05 03:08:46', 27),
(128, 2141, 'IC60N - miniature circuit breaker - 2P - 6A - C curve', 'A9F74206', 'Schneider', '9', 'Pcs', 0, 0, NULL, 35, '2020-02-05 03:09:58', '2020-02-05 03:09:58', 27),
(129, 2142, 'Cable 6mm Merah', NULL, 'Federal', '1', 'Roll', 0, 0, NULL, 35, '2020-02-05 03:10:48', '2020-02-05 03:10:48', 27),
(130, 2143, 'Cable 6mm Biru', NULL, 'Federal', '1', 'Roll', 0, 0, NULL, 35, '2020-02-05 03:11:20', '2020-02-05 03:11:20', 27),
(131, 2144, 'Skun Ring 16mm ', NULL, NULL, '4', 'Pcs', 0, 0, NULL, 35, '2020-02-05 03:20:32', '2020-02-05 03:20:32', 27),
(132, 2145, 'Skun Y 16mm ', NULL, NULL, '10', 'Pcs', 0, 0, NULL, 35, '2020-02-05 03:20:55', '2020-02-05 03:20:55', 27),
(133, 2146, 'Skun Ferules 16mm ', NULL, NULL, '20', 'Pcs', 0, 0, NULL, 35, '2020-02-05 03:21:23', '2020-02-05 03:21:23', 27),
(134, 2147, 'IC60N - miniature circuit breaker - 2P - 32A - C curve', 'A9F74232', 'Schneider', '1', NULL, 0, 0, NULL, 35, '2020-02-05 03:21:55', '2020-02-05 03:21:55', 27),
(135, 2148, 'Panel Box MS H400xW300xD250', NULL, NULL, '1', NULL, 0, 0, NULL, 35, '2020-02-05 03:22:58', '2020-02-05 03:22:58', 27),
(141, 2154, 'W-Series, Initiator/actuator terminal, Rated cross-section: 2.5 mm², Screw connection', '1784180000', 'Weidmuller', '5', 'Pcs', 0, 0, NULL, 35, '2020-02-05 03:27:09', '2020-02-05 03:27:09', 27),
(142, 2155, 'PE terminal, Screw connection, 2.5 mm², 300 A (2.5 mm²), green / yellow', '1020000000', 'Weidmueller', '20', 'Ea', 0, 0, NULL, 35, '2020-02-05 03:27:38', '2020-02-05 03:27:38', 27),
(143, 2156, 'Roset 4 Core + Adapter SC FTTH/Fiber Optical Terminal Box/OTB FO/Optik', NULL, NULL, '1', 'Pcs', 0, 0, NULL, 35, '2020-02-05 03:27:56', '2020-02-05 03:27:56', 27),
(144, 2157, 'Patchcord SC-SC Simplex Single Mode [1--5Meter]', NULL, NULL, '2', 'Pcs', 0, 0, NULL, 35, '2020-02-05 03:28:16', '2020-02-05 03:28:16', 27),
(145, 2158, 'Cable 2,5mm Biru', NULL, 'Federal', '1', 'Roll', 0, 0, NULL, 35, '2020-02-05 03:29:18', '2020-02-05 03:29:18', 27),
(146, 2159, 'Cable 2,5mm Biru muda', NULL, 'Jembo', '1', 'Roll', 0, 0, NULL, 35, '2020-02-05 03:29:40', '2020-02-05 03:29:40', 27),
(147, 2160, 'Cable 2,5mm merah', NULL, 'Federal', '1', 'Roll', 0, 0, NULL, 35, '2020-02-05 03:29:58', '2020-02-05 03:29:58', 27),
(148, 2161, 'Cable 1,5mm Biru', NULL, 'Federal', '1', 'Roll', 0, 0, NULL, 35, '2020-02-05 03:30:23', '2020-02-05 03:30:23', 27),
(149, 2162, 'Cable 1,5mm Biru muda', NULL, 'Jembo', '1', 'Roll', 0, 0, NULL, 35, '2020-02-05 03:30:36', '2020-02-05 03:30:36', 27),
(150, 2163, 'Cable 1,5mm merah', NULL, 'Federal', '1', 'Roll', 0, 0, NULL, 35, '2020-02-05 03:30:58', '2020-02-05 03:30:58', 27),
(151, 2164, 'Cable 0,75mm Biru', NULL, 'Federal', '1', 'Roll', 0, 0, NULL, 35, '2020-02-05 03:35:01', '2020-02-05 03:35:01', 27),
(152, 2165, 'Cable 0,75mm Biru muda', NULL, 'Jembo', '1', 'Roll', 0, 0, NULL, 35, '2020-02-05 03:35:33', '2020-02-05 03:35:33', 27),
(153, 2166, 'Cable 0,5mm Biru', NULL, 'Federal', '3', 'Roll', 0, 0, NULL, 35, '2020-02-05 03:46:27', '2020-02-05 03:46:27', 27),
(154, 2167, 'Skun Ferules 4mm', NULL, NULL, '100', 'Pcs', 0, 0, NULL, 35, '2020-02-05 03:47:05', '2020-02-05 03:47:05', 27),
(155, 2168, 'Skun Ferules 2,5mm', NULL, NULL, '100', 'Pcs', 0, 0, NULL, 35, '2020-02-05 03:47:49', '2020-02-05 03:47:49', 27),
(156, 2169, 'Skun Ferules 1,5mm', NULL, NULL, '100', 'Pcs', 0, 0, NULL, 35, '2020-02-05 03:48:24', '2020-02-05 03:48:24', 27),
(157, 2170, 'Skun Ferules 0,75mm', NULL, NULL, '200', 'Pcs', 0, 0, NULL, 35, '2020-02-05 03:49:15', '2020-02-05 03:49:15', 27),
(158, 2171, 'Skun Ferules 0,5mm', NULL, NULL, '300', 'Pcs', 0, 0, NULL, 35, '2020-02-05 03:50:51', '2020-02-05 03:50:51', 27),
(159, 1663, 'MCB iC60NN 1P 4A', 'A9F74104', 'Schneider', '2', 'Pcs', 121000, 0, NULL, 35, '2020-02-05 03:58:06', '2020-02-05 03:58:06', 27),
(160, 1666, 'MCB iC60NN 2P 4A', 'A9F74204', 'Schneider', '2', 'pcs', 404250, 0, NULL, 35, '2020-02-05 03:58:46', '2020-02-05 03:58:46', 27),
(161, 2149, 'DIN-rail power supplies for 1-phase systems 24VDC, 5A', 'CS5.241', 'PULS', '2', 'Pcs', 0, 0, NULL, 35, '2020-02-05 04:04:43', '2020-02-05 04:04:43', 27),
(162, 2150, 'DIN socket iPC -2P+E -16A-250VAC-NFC15100 -french std-with volt.pres.indic.light', 'A9A15307', 'Schneider', '3', 'Pcs', 0, 0, NULL, 35, '2020-02-05 04:13:09', '2020-02-05 04:13:09', 27),
(163, 2151, ' Ethernet-to-Fiber Media Converters', 'IMC-21 Series', 'Moxa', '2', 'Pcs', 0, 0, NULL, 35, '2020-02-05 04:44:42', '2020-02-05 04:44:42', 27),
(164, 2152, 'Feed-through terminal, Screw connection, 2.5 mm², 800 V, 24 A, dark beige', '1020000000', 'Weidmuller', '36', 'Pcs', 0, 0, NULL, 35, '2020-02-05 07:11:44', '2020-02-05 07:11:44', 27),
(165, 2153, 'Feed-through terminal, Double-tier terminal, Screw connection, 2.5 mm², 400 V, 24 A, dark beige', '1021500000', 'Weidmuller', '70', 'Pcs', 0, 0, NULL, 35, '2020-02-05 07:12:16', '2020-02-05 07:12:16', 27),
(166, 1735, 'Terminal PE, Screw connection, 2.5 mm², 300 A (2.5 mm²), green / yellow', '1010000000', 'Weidmuller', '35', 'pcs', 41000, 0, NULL, 35, '2020-02-05 07:14:14', '2020-02-05 07:14:14', 27),
(167, 2127, 'Cable Multicore 3x35mm', 'YSLY-JZ', 'SMI', '100', 'M', 0, 0, NULL, 35, '2020-02-05 07:15:24', '2020-02-05 07:15:24', 27),
(168, 2128, 'Cable Multicore 3x16mm', 'YSLY-JZ', 'SMI', '100', 'M', 0, 0, NULL, 35, '2020-02-05 07:15:42', '2020-02-05 07:15:42', 27),
(169, 2084, 'Cable Multicore 3x2,5mm', 'YSLY-JZ', 'SMI', '400', 'M', 0, 0, NULL, 35, '2020-02-05 07:19:59', '2020-02-05 07:19:59', 27),
(170, 2135, 'Cable Multicore 3x1,5mm', 'YSLYCY-JZ', 'SMI', '400', 'M', 0, 0, NULL, 35, '2020-02-05 07:20:46', '2020-02-05 07:20:46', 27),
(171, 2134, 'Cable Multicore 30x1,5mm', 'YSLYCY-JZ', 'SMI', '70', 'M', 0, 0, NULL, 35, '2020-02-05 07:25:47', '2020-02-05 07:25:47', 27),
(172, 2136, 'Cable Ethernet Cat 6', NULL, 'Belden', '2', 'Box', 1900000, 0, NULL, 35, '2020-02-05 07:31:05', '2020-02-05 07:31:05', 27),
(173, 2172, 'Cisco ASA 5500-X with FirePOWER Services 8Port', NULL, 'Cisco', '1', 'Pcs', 0, 0, NULL, 35, '2020-02-05 08:51:38', '2020-02-05 08:51:38', 27),
(174, 2173, 'W-Series, Initiator/actuator terminal, Rated cross-section: 2.5 mm², Screw connection', '1784180000', 'Weidmuller', '3', 'Pcs', 0, 0, NULL, 35, '2020-02-05 08:51:57', '2020-02-05 08:51:57', 27),
(175, 2174, 'Roset 4 Core + Adapter SC FTTH/Fiber Optical Terminal Box/OTB FO/Optik', NULL, NULL, '1', 'Pcs', 0, 0, NULL, 35, '2020-02-05 08:52:12', '2020-02-05 08:52:12', 27),
(176, 2175, 'Patchcord SC-SC Simplex Single Mode [1--5Meter]', NULL, NULL, '2', 'Pcs', 0, 0, NULL, 35, '2020-02-05 08:52:30', '2020-02-05 08:52:30', 27),
(177, 2176, 'Connector RJ45', NULL, NULL, '100', NULL, 0, 0, NULL, 35, '2020-02-05 08:52:56', '2020-02-05 08:52:56', 27),
(178, 2177, 'Cable Multicore 3x10mm', 'YSLY-JZ', 'SMI', '100', 'M', 0, 0, NULL, 35, '2020-02-05 08:53:58', '2020-02-05 08:53:58', 27),
(179, 2178, 'Cable Multicore 9x1,5mm', 'YSLYCY-JZ', 'SMI', '120', 'M', 0, 0, NULL, 35, '2020-02-05 08:54:25', '2020-02-05 08:54:25', 27),
(182, 2181, 'Cable Fiber optic', NULL, NULL, '600', 'M', 0, 0, NULL, 35, '2020-02-05 08:55:57', '2020-02-05 08:55:57', 27),
(183, 2181, 'Cable Fiber optic', NULL, NULL, '1', 'M', 0, 0, NULL, 35, '2020-02-14 04:40:29', '2020-02-14 04:40:29', 30),
(184, 2179, 'Cable Multicore 16x1,5mm', 'YSLYCY-JZ', 'SMI', '1', 'M', 0, 0, NULL, 35, '2020-02-14 04:40:30', '2020-02-14 04:40:30', 30),
(185, 2180, 'Cable Multicore 3x1,5mm', 'YSLYCY-JZ', 'SMI', '3', 'M', 0, 0, NULL, 35, '2020-02-14 07:15:29', '2020-02-14 07:15:29', 30),
(186, 2182, 'PC Desktop ( Prosesor Intel Core i7 -8700)', 'PC Intel Core I7', NULL, '1', 'Pcs', 7000000, NULL, NULL, 35, '2020-02-14 07:20:05', '2020-02-14 07:20:05', 27),
(188, 2185, 'Software Intouch 2017 And DA Server', 'Software Intouch 2017 And DA Server', NULL, '1', 'Pcs', 0, NULL, NULL, 35, '2020-02-14 07:38:45', '2020-02-14 07:38:45', 27),
(189, 2187, 'Software Intouch 2017 Read Only 60K Tag Without RDS', 'Software Intouch 2017 Read Only 60K Tag Without RDS', NULL, '1', 'Pcs', 0, NULL, NULL, 35, '2020-02-14 07:38:46', '2020-02-14 07:38:46', 27),
(190, 2184, 'PC Dekstop Server (Prosesor Xeon E3-1220 V6)', 'Prosesor Xeon E3-1220 V6', NULL, '1', 'Pcs', 0, NULL, NULL, 35, '2020-02-14 07:39:05', '2020-02-14 07:39:05', 27),
(191, 2189, 'Pipa Tubing Stainless Steel 304 OD 8 mm', 'Stainless Steel', NULL, '1', 'Pcs', 0, NULL, NULL, 35, '2020-02-14 07:39:13', '2020-02-14 07:39:13', 27),
(192, 2188, 'UPS Eaton E Series DX 300 VA', 'E Series', NULL, '1', 'Pcs', 0, NULL, NULL, 35, '2020-02-14 07:39:29', '2020-02-14 07:39:29', 27),
(193, 2186, 'Printer Dot Matrix', 'Printer Dot Matrix', NULL, '1', 'Pcs', 0, NULL, NULL, 35, '2020-02-14 07:39:39', '2020-02-14 07:39:39', 27),
(194, 2183, 'Software Intouch 2017 Runtime 1K Without I/O', 'Software Intouch 2017', NULL, '2', 'Pcs', 0, NULL, NULL, 35, '2020-02-14 07:40:16', '2020-02-14 07:40:16', 27),
(195, 2190, 'Helm Safety', 'APD', NULL, '5', 'Pcs', 18000, NULL, NULL, 39, '2020-02-17 02:01:12', '2020-02-17 02:01:12', 27),
(196, 2191, 'Body Harnest', 'Body Harnest', NULL, '1', 'Pcs', 0, NULL, NULL, 39, '2020-02-17 02:01:22', '2020-02-17 02:01:22', 27),
(197, 2192, 'Tali Tambang', '-', NULL, '150', 'Pcs', 0, NULL, NULL, 39, '2020-02-17 02:01:32', '2020-02-17 02:01:32', 27),
(198, 2194, 'Antenna Handy Talky', 'GNR-21P', 'ICOM', '2', 'Pcs', 0, NULL, NULL, 39, '2020-02-17 02:01:57', '2020-02-17 02:01:57', 27),
(199, 2193, 'Handy Talky', 'V80 ICV 80', 'ICOM', '4', 'Pcs', 0, NULL, NULL, 39, '2020-02-17 02:01:59', '2020-02-17 02:01:59', 27),
(200, 2195, 'Mesin Bor Listrik', 'Mesin Bor', 'Krisbow', '1', 'Pcs', 0, NULL, NULL, 39, '2020-02-17 02:02:05', '2020-02-17 02:02:05', 27),
(201, 2197, 'kabel Hitam 1 x 16 mm', '16 mm', 'Jembo', '15', 'Meter', 0, NULL, NULL, 39, '2020-02-17 03:21:13', '2020-02-17 03:21:13', 27),
(202, 2196, 'Kabel Hitam 1 x 35 mm', 'Kabel', 'Jembo', '5', 'Meter', 0, NULL, NULL, 39, '2020-02-17 03:21:15', '2020-02-17 03:21:15', 27),
(203, 2201, 'Skun Ferul 16 mm', 'Skun Ferul 16 mm', NULL, '20', 'Pcs', 0, NULL, NULL, 39, '2020-02-17 03:22:38', '2020-02-17 03:22:38', 27),
(204, 2199, 'Skun Ring 35 mm', 'Skun Ring 35 mm', NULL, '20', 'Pcs', 0, NULL, NULL, 39, '2020-02-17 03:22:39', '2020-02-17 03:22:39', 27),
(205, 2200, 'Skun Ring 16 mm', 'Skun Ring 16 mm', NULL, '20', 'Pcs', 0, NULL, NULL, 39, '2020-02-17 03:22:40', '2020-02-17 03:22:40', 27),
(206, 2198, 'Skun Y', '35 mm', NULL, '20', 'Pcs', 0, NULL, NULL, 39, '2020-02-17 03:22:41', '2020-02-17 03:22:41', 27),
(207, 2202, 'Vynil Biru 35 mm', 'Vynil Biru 35 mm', NULL, '20', 'Pcs', 0, NULL, NULL, 39, '2020-02-17 03:23:10', '2020-02-17 03:23:10', 27),
(208, 2207, 'Vynyl Merah 10 mm', 'Vynil Merah 10 mm', NULL, '20', 'Pcs', 0, NULL, NULL, 39, '2020-02-17 03:23:12', '2020-02-17 03:23:12', 27),
(209, 2205, 'Vynil Merah 35 mm', 'Vynil Merah 35 mm', NULL, '20', 'Pcs', 0, NULL, NULL, 39, '2020-02-17 03:23:12', '2020-02-17 03:23:12', 27),
(210, 2206, 'Vynil Merah 16 mm', 'Vynil Merah 16 mm', NULL, '20', 'Pcs', 0, NULL, NULL, 39, '2020-02-17 03:23:13', '2020-02-17 03:23:13', 27),
(211, 2203, 'Vynil Biru 16 mm', 'Vynil Biru 16 mm', NULL, '20', 'Pcs', 0, NULL, NULL, 39, '2020-02-17 03:23:14', '2020-02-17 03:23:14', 27),
(212, 2204, 'Vynil Biru 10 mm', 'Vynil Biru 10 mm', NULL, '20', 'Pcs', 0, NULL, NULL, 39, '2020-02-17 03:23:15', '2020-02-17 03:23:15', 27),
(213, 2209, 'Cable Gland M16 Hitam', 'Cable Gland M16 HItam', NULL, '30', 'Pcs', 0, NULL, NULL, 39, '2020-02-17 03:23:32', '2020-02-17 03:23:32', 27),
(214, 2208, 'Cable Gland M20 Hitam', 'Cable Gland M20 HItam', NULL, '30', 'Pcs', 0, NULL, NULL, 39, '2020-02-17 03:23:33', '2020-02-17 03:23:33', 27),
(215, 2216, 'skun Y 16mm', NULL, NULL, '10', 'pcs', 0, 0, NULL, 35, '2020-02-17 09:06:07', '2020-02-17 09:06:07', 27),
(216, 2218, 'skun ferules 6mm', NULL, NULL, '100', 'pcs', 0, 0, NULL, 35, '2020-02-17 09:06:53', '2020-02-17 09:06:53', 27),
(217, 2210, 'Cable MUlticore 3 x 35 mm', '3 X 35 mm', 'SMI', '35', 'Meter', 0, NULL, NULL, 35, '2020-02-17 09:17:20', '2020-02-17 09:17:20', 27),
(218, 2211, 'Cable Multicore 3 x 16 mm', 'Multicore 3 x 16 mm', 'SMI', '25', 'Meter', 0, NULL, NULL, 35, '2020-02-17 09:17:42', '2020-02-17 09:17:42', 27),
(219, 2212, 'Cable Multicore 3 x 6 mm', 'Multicore 3 x 6 mm', 'SMI', '150', 'Meter', 0, NULL, NULL, 35, '2020-02-17 09:18:09', '2020-02-17 09:18:09', 27),
(220, 2213, 'Cable Multicore 3 x 2.5 mm', 'Multicore  3 x 2.5 mm', 'SMI', '265', 'Meter', 0, NULL, NULL, 35, '2020-02-17 09:18:34', '2020-02-17 09:18:34', 27),
(221, 2214, 'Cable Multicore 3 x 1.5 mm', 'Multicore 3 x 1.5 mm', 'SMI', '140', 'Meter', 0, NULL, NULL, 35, '2020-02-17 09:18:53', '2020-02-17 09:18:53', 27),
(222, 2229, 'Cable Multicore 14x1,5mm', 'YSLYCY-JZ', 'SMI', '160', 'M', 0, 0, NULL, 35, '2020-02-17 09:19:16', '2020-02-17 09:19:16', 27),
(223, 2230, 'Cable Multicore 20x1,5mm', 'YSLYCY-JZ', 'SMI', '30', 'M', 0, 0, NULL, 35, '2020-02-17 09:19:33', '2020-02-17 09:19:33', 27),
(224, 2231, 'Cable Multicore 30x1,5mm', 'YSLYCY-JZ', 'SMI', '30', 'M', 0, 0, NULL, 35, '2020-02-17 09:19:53', '2020-02-17 09:19:53', 27),
(225, 2232, 'Cable Multicore 3x1,5mm', 'YSLYCY-JZ', 'SMI', '250', 'M', 0, 0, NULL, 35, '2020-02-17 09:20:08', '2020-02-17 09:20:08', 27),
(226, 2233, 'Cable Ethernet Cat 6', NULL, 'Belden', '1', 'Box', 0, 0, NULL, 35, '2020-02-17 09:21:13', '2020-02-17 09:21:13', 27),
(227, 2234, 'Cable 4 Core single mode Outdoor Direct Buried, Double Jacket 9/125um', NULL, NULL, '450', 'M', 0, 0, NULL, 35, '2020-02-17 09:22:29', '2020-02-17 09:22:29', 27),
(228, 2235, 'Bolt & nut M8 x 40L', NULL, NULL, '12', 'pcs', 0, 0, NULL, 35, '2020-02-18 02:20:33', '2020-02-18 02:20:33', 31),
(229, 2236, 'Grounding Bar,copper tine,400mm x 50 mm x 6mm', NULL, 'Jembo', '6', 'pcs', 0, 0, NULL, 35, '2020-02-18 03:41:50', '2020-02-18 03:41:50', 31),
(230, 2237, 'Grounding Cable 35sqmm', 'Power earth bar-1 to power earth bar-3', 'Jembo', '639', 'M', 0, 0, NULL, 35, '2020-02-18 03:42:25', '2020-02-18 03:42:25', 31),
(231, 2238, 'Grounding Cable 70sqmm', 'Field to control room', 'Jembo', '48', 'M', 0, 0, NULL, 35, '2020-02-18 03:42:41', '2020-02-18 03:42:41', 31),
(232, 2262, 'Panel Single Door (HxWxD)1500X800X400 free standing', NULL, 'Cometal', '1', 'Unit', 0, 0, NULL, 35, '2020-02-18 03:43:08', '2020-02-18 03:43:08', 31),
(233, 2263, 'PLC', '2080-LC70-24QBB', 'Allen Bradley', '1', 'Unit', 0, 0, NULL, 35, '2020-02-18 03:43:28', '2020-02-18 03:43:28', 31),
(234, 2264, 'Modul DI  24 VDC 16 Chanel', '2085-IQ16', 'Allen Bradley', '2', 'Pcs', 0, 0, NULL, 35, '2020-02-18 03:44:21', '2020-02-18 03:44:21', 31),
(235, 2265, 'Modul DO 24 VDC 16 Chanel', '2085-OB16', 'Allen Bradley', '2', 'Pcs', 0, 0, NULL, 35, '2020-02-18 03:46:02', '2020-02-18 03:46:02', 31),
(236, 2252, 'Modul AI 4-20mA 8 Chanel', '2085-IF8', 'Allen Bradley', '1', 'Pcs', 0, 0, NULL, 35, '2020-02-18 03:46:26', '2020-02-18 03:46:26', 31),
(237, 2254, 'HMI 7\"', '2711R-T7T', 'Allen Bradley', '1', 'Lot', 0, 0, NULL, 35, '2020-02-18 03:46:47', '2020-02-18 03:46:47', 31),
(238, 2245, 'IC60N - miniature circuit breaker - 1P - 10A - C curve', 'A9F74110', 'Schneider', '1', 'Pcs', 0, 0, NULL, 35, '2020-02-18 03:47:04', '2020-02-18 03:47:04', 31),
(239, 2268, 'Fuse 2A', NULL, NULL, '8', 'Pcs', 0, 0, NULL, 35, '2020-02-18 03:47:23', '2020-02-18 03:47:23', 31),
(240, 2266, 'DIN-rail power supplies for 1-phase systems 24V, 20A', 'PIC240.241C', 'Puls', '1', 'Pcs', 0, 0, NULL, 35, '2020-02-18 03:47:45', '2020-02-18 03:47:45', 31),
(241, 2269, 'Relay 24VDC, 4 contact C/O', 'RXM4AB2BD', 'Schneider', '8', 'Pcs', 0, 0, NULL, 35, '2020-02-18 03:48:09', '2020-02-18 03:48:09', 31),
(242, 2282, 'Panel Box MS H600 x W500 x D250', 'Panel Box MS', NULL, '1', 'Pcs', 0, NULL, NULL, 39, '2020-02-18 04:04:34', '2020-02-18 04:04:34', 27),
(243, 2270, 'Socket for relay RXM2/4', 'RXZE1M4C', 'Schneider', '8', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:24:41', '2020-02-18 08:24:41', 31),
(244, 2271, 'Selector switch (auto / manual)', NULL, 'salzer', '2', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:25:01', '2020-02-18 08:25:01', 31),
(245, 2251, 'PLC', '2080-LC70-24QBB', 'Allen Bradley', '1', 'Unit', 0, 0, NULL, 35, '2020-02-18 08:25:17', '2020-02-18 08:25:17', 31),
(246, 2243, 'Modul AI 4-20mA 8 Chanel', '2085-IF8', 'Allen Bradley', '1', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:25:30', '2020-02-18 08:25:30', 31),
(247, 2253, 'Modul AO 4-20mA 8 Chanel', '2085-OF4', 'Allen Bradley', '2', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:25:42', '2020-02-18 08:25:42', 31),
(248, 2244, 'HMI 7\"', '2711R-T7T', 'Allen Bradley', '1', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:25:58', '2020-02-18 08:25:58', 31),
(249, 2124, 'Expansion I/O End Cap/Bus Terminator', '2085-ECR', 'Allen Bradley', '1', 'Pcs', 231040, 0, NULL, 35, '2020-02-18 08:26:26', '2020-02-18 08:26:26', 31),
(250, 2267, 'MCB 10A', 'A9F74110', 'Schneider', '1', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:26:47', '2020-02-18 08:26:47', 31),
(251, 2256, 'Fuse 2A', NULL, NULL, '16', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:27:00', '2020-02-18 08:27:00', 31),
(252, 2257, 'DIN-rail power supplies for 1-phase systems 24V, 20A', 'PIC240.241C', 'Puls', '1', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:27:19', '2020-02-18 08:27:19', 31),
(253, 2258, 'Relay 24VDC, 4 contact C/O', 'RXM4AB2BD', 'Schneider', '8', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:27:36', '2020-02-18 08:27:36', 31),
(254, 2259, 'Socket for relay RXM2/4', 'RXZE1M4C', 'Schneider', '8', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:27:58', '2020-02-18 08:27:58', 31),
(255, 2260, 'Selector switch (auto / manual)', NULL, 'salzer', '2', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:28:12', '2020-02-18 08:28:12', 31),
(256, 2261, 'Din Rill', 'Ts 35/x7,5', 'Weidmuller', '5', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:28:31', '2020-02-18 08:28:31', 31),
(257, 2239, 'Panel Single Door (HxWxD)1500X800X400 free standing', NULL, 'Cometal', '1', 'Unit', 0, 0, NULL, 35, '2020-02-18 08:30:07', '2020-02-18 08:30:07', 31),
(258, 2240, 'PLC', '2080-LC70-24QBB', 'Allen Bradley', '1', 'Unit', 0, 0, NULL, 35, '2020-02-18 08:31:55', '2020-02-18 08:31:55', 31),
(259, 2241, 'Modul DI  24 VDC 16 Chanel', '2085-IQ16', 'Allen Bradley', '1', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:32:18', '2020-02-18 08:32:18', 31),
(260, 2242, 'Modul DO 24 VDC 16 Chanel', '2085-OB16', 'Allen Bradley', '1', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:32:27', '2020-02-18 08:32:27', 31),
(261, 2247, 'DIN-rail power supplies for 1-phase systems 24V, 20A', 'PIC240.241C', 'Puls', '1', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:33:01', '2020-02-18 08:33:01', 31),
(262, 2255, 'MCB 10A', 'A9F74110', 'Schneider', '1', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:33:23', '2020-02-18 08:33:23', 31),
(263, 2246, 'Fuse 2A', NULL, NULL, '8', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:33:38', '2020-02-18 08:33:38', 31),
(264, 2248, 'Relay 24VDC, 4 contact C/O', 'RXM4AB2BD', 'Schneider', '16', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:33:53', '2020-02-18 08:33:53', 31),
(265, 2249, 'Socket for relay RXM2/4', 'RXZE1M4C', 'Schneider', '16', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:34:16', '2020-02-18 08:34:16', 31),
(266, 2250, 'Selector switch (auto / manual)', NULL, 'salzer', '3', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:34:32', '2020-02-18 08:34:32', 31),
(267, 2272, 'Pressure Gauge 1,6 Bar c/w Accessories', NULL, 'Wika', '2', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:34:44', '2020-02-18 08:34:44', 31),
(268, 2274, 'Pressure Gauge 60 Bar c/w Accessories', NULL, 'Wika', '1', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:34:57', '2020-02-18 08:34:57', 31),
(269, 2273, 'Pressure Gauge 6 Bar c/w Accessories', NULL, 'Wika', '1', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:35:53', '2020-02-18 08:35:53', 31),
(270, 2275, 'Cable Gland 1/2\" NPT', NULL, NULL, '195', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:37:25', '2020-02-18 08:37:25', 31),
(271, 2276, 'Cable Gland 3/4\" NPT', NULL, NULL, '5', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:37:39', '2020-02-18 08:37:39', 31),
(272, 2277, 'Ethernet Cable (Cat6)', '1 roll 300meter', NULL, '6', 'ROLL', 0, 0, NULL, 35, '2020-02-18 08:40:35', '2020-02-18 08:40:35', 31),
(273, 2278, 'Isolasi PVC Tape 1/2\"(W)', 'Hitam', 'PVC', '10', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:41:03', '2020-02-18 08:41:03', 31),
(274, 2279, 'Isolasi PVC Tape 1/2\"(W)', 'Hijau', 'PVC', '10', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:41:22', '2020-02-18 08:41:22', 31),
(275, 2280, 'Isolasi PVC Tape 1/2\"(W)', 'merah', 'PVC', '10', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:41:37', '2020-02-18 08:41:37', 31),
(276, 2281, 'Isolasi PVC Tape 1/2\"(W)', 'Kuning', 'PVC', '10', 'Pcs', 0, 0, NULL, 35, '2020-02-18 08:41:49', '2020-02-18 08:41:49', 31);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `po_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vendor` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `purchase_requisition_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `delivered_at` date DEFAULT NULL,
  `warehouse_at` timestamp NULL DEFAULT NULL,
  `verified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `po_number`, `vendor`, `status`, `purchase_requisition_id`, `created_by`, `created_at`, `updated_at`, `deleted_at`, `delivered_at`, `warehouse_at`, `verified_by`) VALUES
(4, 'PO 001 - PR 001 - 19.12.009', 'BEIJER', 0, 4, 35, '2019-12-13 02:31:30', '2019-12-13 02:32:53', '2019-12-13 02:32:53', NULL, NULL, NULL),
(5, 'PO 001 - PR 001 - 20.02.021', 'ROCKWELL', 0, 15, 35, '2020-02-14 04:43:47', '2020-02-14 04:43:47', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_items`
--

CREATE TABLE `purchase_order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `item_id` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mfg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty_po` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `price_po` int(11) NOT NULL,
  `disc` int(11) DEFAULT NULL,
  `disc_po` int(11) DEFAULT NULL,
  `net_price` int(11) DEFAULT NULL,
  `total_cost` int(11) DEFAULT NULL,
  `vendor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_order_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_order_items`
--

INSERT INTO `purchase_order_items` (`id`, `item_id`, `description`, `type`, `mfg`, `qty`, `qty_po`, `unit`, `price`, `price_po`, `disc`, `disc_po`, `net_price`, `total_cost`, `vendor`, `purchase_order_id`, `created_by`, `created_at`, `updated_at`, `status`) VALUES
(4, 403, 'Copper Busbar 10x100x4000mm', '4PMCM101', 'PM', '4', '2', 'Btg', 3852000, 20000, 0, 10, 18000, NULL, 'SCHNEIDER', 3, 35, '2019-11-07 02:24:40', '2019-11-07 02:25:05', 2),
(5, 1753, 'cable Skun SC 25 3 warna', NULL, NULL, '2', '2', 'Pcs', 500, 1000, 0, 2, 980, NULL, 'BEIJER', 4, 35, '2019-12-13 02:32:37', '2019-12-13 02:32:37', 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_requisitions`
--

CREATE TABLE `purchase_requisitions` (
  `id` int(10) UNSIGNED NOT NULL,
  `pr_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `project_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_requisitions`
--

INSERT INTO `purchase_requisitions` (`id`, `pr_number`, `status`, `project_id`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 'PR 001 - 20.01.019', 0, '25', 35, '2020-01-27 02:26:45', '2020-01-28 03:05:33', '2020-01-28 03:05:33'),
(6, 'PR 001 - 20.01.015', 0, '21', 35, '2020-01-27 02:27:34', '2020-01-28 03:05:53', '2020-01-28 03:05:53'),
(7, 'PR 002 - 20.01.019', 0, '25', 39, '2020-01-27 07:03:02', '2020-01-28 03:05:37', '2020-01-28 03:05:37'),
(8, 'PR 001 - 20.01.017', 0, '23', 39, '2020-01-28 09:50:07', '2020-01-28 09:50:07', NULL),
(9, 'PR 001 - 20.01.013', 0, '19', 39, '2020-01-28 09:50:41', '2020-01-28 09:50:41', NULL),
(10, 'PR 001 - 20.01.018', 0, '24', 35, '2020-02-04 09:12:53', '2020-02-04 09:12:53', NULL),
(11, 'PR 001 - 20.02.020', 0, '27', 35, '2020-02-05 09:12:04', '2020-02-05 09:15:33', '2020-02-05 09:15:33'),
(15, 'PR 001 - 20.02.021', 1, '30', 35, '2020-02-14 04:41:15', '2020-02-14 04:41:47', NULL),
(16, 'PR 002 - 20.02.020', 0, '27', 39, '2020-02-17 02:00:31', '2020-02-17 02:00:31', NULL),
(17, 'PR 003 - 20.02.020', 0, '27', 39, '2020-02-17 02:31:54', '2020-02-17 02:31:54', NULL),
(18, 'PR 004 - 20.02.020', 0, '27', 39, '2020-02-17 03:20:00', '2020-02-17 03:20:00', NULL),
(19, 'PR 005 - 20.02.020', 0, '27', 39, '2020-02-17 04:16:35', '2020-02-17 04:16:35', NULL),
(20, 'PR 006 - 20.02.020', 0, '27', 39, '2020-02-17 04:29:54', '2020-02-17 04:29:54', NULL),
(21, 'PR 007 - 20.02.020', 0, '27', 39, '2020-02-18 02:19:47', '2020-02-18 02:19:47', NULL),
(22, 'PR 001 - 20.02.022', 0, '31', 39, '2020-02-19 04:02:42', '2020-02-19 04:02:42', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_requisition_items`
--

CREATE TABLE `purchase_requisition_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `item_id` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mfg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `disc` int(11) DEFAULT NULL,
  `total_cost` int(11) DEFAULT NULL,
  `purchase_requisition_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `purchase_requisition_items`
--

INSERT INTO `purchase_requisition_items` (`id`, `item_id`, `description`, `type`, `mfg`, `qty`, `unit`, `price`, `disc`, `total_cost`, `purchase_requisition_id`, `created_by`, `created_at`, `updated_at`) VALUES
(4, 401, 'Busbar support', ' PM EL-270', 'PM', '2', 'Pcs', 62000, 0, NULL, 2, 35, '2019-11-07 02:14:36', '2019-11-07 02:14:36'),
(5, 405, 'Copper Busbar 5x50x4000mm', '4PMCM550', 'PM', '3', 'Btg', 963000, 0, NULL, 2, 35, '2019-11-07 02:14:42', '2019-11-07 02:14:42'),
(6, 403, 'Copper Busbar 10x100x4000mm', '4PMCM101', 'PM', '4', 'Btg', 3852000, 0, NULL, 2, 35, '2019-11-07 02:14:48', '2019-11-07 02:14:48'),
(8, 1753, 'cable Skun SC 25 3 warna', NULL, NULL, '2', 'Pcs', 500, 0, NULL, 4, 35, '2019-12-13 02:31:10', '2019-12-13 02:31:10'),
(10, 2066, 'Orange complete pilot light Ø22 plain lens with integral LED 230...240V', 'XB5AVM5', 'Schneider', '2', 'Pcs', 99650, 0, NULL, 9, 39, '2020-01-28 09:50:54', '2020-01-28 09:50:54'),
(14, 2179, 'Cable Multicore 16x1,5mm', 'YSLYCY-JZ', 'SMI', '100', 'M', 0, 0, NULL, 15, 35, '2020-02-14 04:41:29', '2020-02-14 04:41:29'),
(15, 2183, 'Software Intouch 2017 Runtime 1K Without I/O', 'Software Intouch 2017', NULL, '2', 'Pcs', 0, NULL, NULL, 11, 39, '2020-02-14 08:26:55', '2020-02-14 08:26:55'),
(16, 2186, 'Printer Dot Matrix', 'Printer Dot Matrix', NULL, '1', 'Pcs', 0, NULL, NULL, 11, 39, '2020-02-14 08:27:06', '2020-02-14 08:27:06'),
(17, 2188, 'UPS Eaton E Series DX 300 VA', 'E Series', NULL, '1', 'Pcs', 0, NULL, NULL, 11, 39, '2020-02-14 08:27:14', '2020-02-14 08:27:14'),
(18, 2189, 'Pipa Tubing Stainless Steel 304 OD 8 mm', 'Stainless Steel', NULL, '300', 'Pcs', 0, NULL, NULL, 11, 39, '2020-02-14 08:27:22', '2020-02-14 08:27:22'),
(19, 2184, 'PC Dekstop Server (Prosesor Xeon E3-1220 V6)', 'Prosesor Xeon E3-1220 V6', NULL, '1', 'Pcs', 0, NULL, NULL, 11, 39, '2020-02-14 08:27:32', '2020-02-14 08:27:32'),
(20, 2187, 'Software Intouch 2017 Read Only 60K Tag Without RDS', 'Software Intouch 2017 Read Only 60K Tag Without RDS', NULL, '1', 'Pcs', 0, NULL, NULL, 11, 39, '2020-02-14 08:27:40', '2020-02-14 08:27:40'),
(21, 2185, 'Software Intouch 2017 And DA Server', 'Software Intouch 2017 And DA Server', NULL, '1', 'Pcs', 0, NULL, NULL, 11, 39, '2020-02-14 08:27:46', '2020-02-14 08:27:46'),
(22, 2182, 'PC Desktop ( Prosesor Intel Core i7 -8700)', 'PC Intel Core I7', NULL, '1', 'Pcs', 7000000, NULL, NULL, 11, 39, '2020-02-14 08:28:47', '2020-02-14 08:28:47'),
(23, 2195, 'Mesin Bor Listrik', 'Mesin Bor', 'Krisbow', '1', 'Pcs', 0, NULL, NULL, 16, 39, '2020-02-17 02:02:45', '2020-02-17 02:02:45'),
(24, 2194, 'Antenna Handy Talky', 'GNR-21P', 'ICOM', '2', 'Pcs', 0, NULL, NULL, 16, 39, '2020-02-17 02:02:57', '2020-02-17 02:02:57'),
(25, 2193, 'Handy Talky', 'V80 ICV 80', 'ICOM', '4', 'Pcs', 0, NULL, NULL, 16, 39, '2020-02-17 02:03:06', '2020-02-17 02:03:06'),
(26, 2192, 'Tali Tambang', '-', NULL, '150', 'Pcs', 0, NULL, NULL, 16, 39, '2020-02-17 02:03:16', '2020-02-17 02:03:16'),
(27, 2191, 'Body Harnest', 'Body Harnest', NULL, '1', 'Pcs', 0, NULL, NULL, 16, 39, '2020-02-17 02:03:27', '2020-02-17 02:03:27'),
(28, 2190, 'Helm Safety', 'APD', NULL, '5', 'Pcs', 18000, NULL, NULL, 16, 39, '2020-02-17 02:03:36', '2020-02-17 02:03:36'),
(29, 2193, 'Handy Talky', 'V80 ICV 80', 'ICOM', '2', 'Pcs', 0, NULL, NULL, 17, 39, '2020-02-17 02:32:34', '2020-02-17 02:32:34'),
(30, 2194, 'Antenna Handy Talky', 'GNR-21P', 'ICOM', '2', 'Pcs', 0, NULL, NULL, 17, 39, '2020-02-17 02:32:44', '2020-02-17 02:32:44'),
(32, 2208, 'Cable Gland M20 Hitam', 'Cable Gland M20 HItam', NULL, '30', 'Pcs', 0, NULL, NULL, 18, 39, '2020-02-17 03:48:06', '2020-02-17 03:48:06'),
(33, 2209, 'Cable Gland M16 Hitam', 'Cable Gland M16 HItam', NULL, '30', 'Pcs', 0, NULL, NULL, 18, 39, '2020-02-17 03:48:20', '2020-02-17 03:48:20'),
(34, 2204, 'Vynil Biru 10 mm', 'Vynil Biru 10 mm', NULL, '20', 'Pcs', 0, NULL, NULL, 18, 39, '2020-02-17 03:48:30', '2020-02-17 03:48:30'),
(35, 2203, 'Vynil Biru 16 mm', 'Vynil Biru 16 mm', NULL, '20', 'Pcs', 0, NULL, NULL, 18, 39, '2020-02-17 03:48:38', '2020-02-17 03:48:38'),
(36, 2206, 'Vynil Merah 16 mm', 'Vynil Merah 16 mm', NULL, '20', 'Pcs', 0, NULL, NULL, 18, 39, '2020-02-17 03:49:35', '2020-02-17 03:49:35'),
(37, 2205, 'Vynil Merah 35 mm', 'Vynil Merah 35 mm', NULL, '20', 'Pcs', 0, NULL, NULL, 18, 39, '2020-02-17 03:49:43', '2020-02-17 03:49:43'),
(38, 2207, 'Vynyl Merah 10 mm', 'Vynil Merah 10 mm', NULL, '20', 'Pcs', 0, NULL, NULL, 18, 39, '2020-02-17 03:49:49', '2020-02-17 03:49:49'),
(41, 2202, 'Vynil Biru 35 mm', 'Vynil Biru 35 mm', NULL, '20', 'Pcs', 0, NULL, NULL, 18, 39, '2020-02-17 03:50:01', '2020-02-17 03:50:01'),
(42, 2198, 'Skun Y', '35 mm', NULL, '20', 'Pcs', 0, NULL, NULL, 18, 39, '2020-02-17 03:50:34', '2020-02-17 03:50:34'),
(43, 2200, 'Skun Ring 16 mm', 'Skun Ring 16 mm', NULL, '20', 'Pcs', 0, NULL, NULL, 18, 39, '2020-02-17 03:50:44', '2020-02-17 03:50:44'),
(44, 2199, 'Skun Ring 35 mm', 'Skun Ring 35 mm', NULL, '20', 'Pcs', 0, NULL, NULL, 18, 39, '2020-02-17 03:50:51', '2020-02-17 03:50:51'),
(45, 2201, 'Skun Ferul 16 mm', 'Skun Ferul 16 mm', NULL, '20', 'Pcs', 0, NULL, NULL, 18, 39, '2020-02-17 03:51:11', '2020-02-17 03:51:11'),
(46, 2196, 'Kabel Hitam 1 x 35 mm', 'Kabel', 'Jembo', '5', 'Meter', 0, NULL, NULL, 18, 39, '2020-02-17 03:51:20', '2020-02-17 03:51:20'),
(47, 2197, 'kabel Hitam 1 x 16 mm', '16 mm', 'Jembo', '5', 'Meter', 0, NULL, NULL, 18, 39, '2020-02-17 03:51:30', '2020-02-17 03:51:30'),
(48, 2118, 'Compact Logix 5370 L3 Controller , Dual Ethernet w/DLR , 1 MB Memory , 8 I/O Expansion, 16 Ethernet IP Nodes , Controller  Are Shipped with 1 GB SD Card and Support up to 2 GB Card', '1769-L30ER', 'Allen Bradley', '1', 'Pcs', 29640000, 0, NULL, 19, 39, '2020-02-17 04:27:17', '2020-02-17 04:27:17'),
(49, 2119, 'Power Supply 120/240 VAC Input 2 Amp @ 5 VDC Output', '1769-PA 2', 'Allen Bradley', '1', 'Pcs', 0, 0, NULL, 19, 39, '2020-02-17 04:27:36', '2020-02-17 04:27:36'),
(50, 2120, '16 Channel Compact High- density Analaog Current Input Module', '1769-IF16C', 'Allen Bradley', '1', 'Pcs', 16568000, 0, NULL, 19, 39, '2020-02-17 04:27:56', '2020-02-17 04:27:56'),
(51, 2121, 'Combo 6Pt 24 VDC Snk/Srn In, 4Pt VAC/VDC Relay Out', '1769-IQ6XOW4', 'Allen Bradley', '1', 'Pcs', 3572000, 0, NULL, 19, 39, '2020-02-17 04:28:08', '2020-02-17 04:28:08'),
(52, 2122, 'Micro850 controller, 14 -24 DC/v AC Input . 10-24 V DC Source Output Conroller', '2080-LC50-24QBB', 'Allen Bradley', '1', 'Pcs', 6718400, 0, NULL, 19, 39, '2020-02-17 04:28:22', '2020-02-17 04:28:22'),
(53, 2123, '4-Channel Analog , 12 Bit Isolated Voltage/Current Output', '2085-OF4', 'Allen Bradley', '4', 'Pcs', 3374400, 0, NULL, 19, 39, '2020-02-17 04:28:35', '2020-02-17 04:28:35'),
(54, 2124, 'Expansion I/O End Cap/Bus Terminator', '2085-ECR', 'Allen Bradley', '1', 'Pcs', 231040, 0, NULL, 19, 39, '2020-02-17 04:28:49', '2020-02-17 04:28:49'),
(55, 2125, 'Stratix 2000 5 Port Unmanaged Switch', '1783-US5T', 'Allen Bradley', '2', 'Pcs', 1808800, 0, NULL, 19, 39, '2020-02-17 04:29:05', '2020-02-17 04:29:05'),
(56, 2080, 'Stratix 2000 8 Port Unmanaged Switch', '1783-US8T', 'Allen Bradley', '1', 'Pcs', 0, 0, NULL, 19, 39, '2020-02-17 04:29:17', '2020-02-17 04:29:17'),
(59, 2234, 'Cable 4 Core single mode Outdoor Direct Buried, Double Jacket 9/125um', NULL, NULL, '450', 'M', 0, 0, NULL, 20, 39, '2020-02-18 02:17:19', '2020-02-18 02:17:19'),
(60, 2233, 'Cable Ethernet Cat 6', NULL, 'Belden', '1', 'Box', 0, 0, NULL, 20, 39, '2020-02-18 02:17:35', '2020-02-18 02:17:35'),
(61, 2232, 'Cable Multicore 3x1,5mm', 'YSLYCY-JZ', 'SMI', '250', 'M', 0, 0, NULL, 20, 39, '2020-02-18 02:17:56', '2020-02-18 02:17:56'),
(62, 2231, 'Cable Multicore 30x1,5mm', 'YSLYCY-JZ', 'SMI', '30', 'M', 0, 0, NULL, 20, 39, '2020-02-18 02:18:11', '2020-02-18 02:18:11'),
(63, 2230, 'Cable Multicore 20x1,5mm', 'YSLYCY-JZ', 'SMI', '30', 'M', 0, 0, NULL, 20, 39, '2020-02-18 02:18:21', '2020-02-18 02:18:21'),
(64, 2229, 'Cable Multicore 14x1,5mm', 'YSLYCY-JZ', 'SMI', '160', 'M', 0, 0, NULL, 20, 39, '2020-02-18 02:18:31', '2020-02-18 02:18:31'),
(65, 2214, 'Cable Multicore 3 x 1.5 mm', 'Multicore 3 x 1.5 mm', 'SMI', '140', 'Meter', 0, NULL, NULL, 20, 39, '2020-02-18 02:18:42', '2020-02-18 02:18:42'),
(66, 2213, 'Cable Multicore 3 x 2.5 mm', 'Multicore  3 x 2.5 mm', 'SMI', '265', 'Meter', 0, NULL, NULL, 20, 39, '2020-02-18 02:18:52', '2020-02-18 02:18:52'),
(67, 2212, 'Cable Multicore 3 x 6 mm', 'Multicore 3 x 6 mm', 'SMI', '150', 'Meter', 0, NULL, NULL, 20, 39, '2020-02-18 02:19:01', '2020-02-18 02:19:01'),
(68, 2211, 'Cable Multicore 3 x 16 mm', 'Multicore 3 x 16 mm', 'SMI', '25', 'Meter', 0, NULL, NULL, 20, 39, '2020-02-18 02:19:14', '2020-02-18 02:19:14'),
(69, 2210, 'Cable MUlticore 3 x 35 mm', '3 X 35 mm', 'SMI', '35', 'Meter', 0, NULL, NULL, 20, 39, '2020-02-18 02:19:21', '2020-02-18 02:19:21'),
(70, 2138, 'Panel Box MS H600xW400xD250', NULL, NULL, '3', 'Pcs', 0, 0, NULL, 21, 39, '2020-02-18 02:20:04', '2020-02-18 03:43:31'),
(71, 2139, 'Circuit breaker Easypact EZC250H - TMD - 125 A - 2 poles 2d', 'EZC250H2125', 'Schneider', '1', 'Pcs', 0, 0, NULL, 21, 39, '2020-02-18 02:20:21', '2020-02-18 02:20:21'),
(72, 2140, 'IC60N - miniature circuit breaker - 2P - 63A - C curve', 'A9F74263', 'Schneider', '1', 'Pcs', 0, 0, NULL, 21, 39, '2020-02-18 02:20:43', '2020-02-18 02:20:43'),
(73, 2141, 'IC60N - miniature circuit breaker - 2P - 6A - C curve', 'A9F74206', 'Schneider', '9', 'Pcs', 0, 0, NULL, 21, 39, '2020-02-18 02:20:58', '2020-02-18 02:24:17'),
(74, 2142, 'Cable 6mm Merah', NULL, 'Federal', '1', 'Roll', 0, 0, NULL, 21, 39, '2020-02-18 02:21:21', '2020-02-18 02:21:21'),
(75, 2143, 'Cable 6mm Biru', NULL, 'Federal', '1', 'Roll', 0, 0, NULL, 21, 39, '2020-02-18 02:21:31', '2020-02-18 02:21:31'),
(76, 2200, 'Skun Ring 16 mm', 'Skun Ring 16 mm', NULL, '4', 'Pcs', 0, NULL, NULL, 21, 39, '2020-02-18 02:21:49', '2020-02-18 02:21:49'),
(77, 2216, 'skun Y 16mm', NULL, NULL, '10', 'pcs', 0, 0, NULL, 21, 39, '2020-02-18 02:22:04', '2020-02-18 02:22:04'),
(78, 2201, 'Skun Ferul 16 mm', 'Skun Ferul 16 mm', NULL, '20', 'Pcs', 0, NULL, NULL, 21, 39, '2020-02-18 02:22:19', '2020-02-18 02:22:19'),
(79, 2218, 'skun ferules 6mm', NULL, NULL, '100', 'pcs', 0, 0, NULL, 21, 39, '2020-02-18 02:22:36', '2020-02-18 02:22:36'),
(80, 2168, 'Skun Ferules 2,5mm', NULL, NULL, '100', 'Pcs', 0, 0, NULL, 21, 39, '2020-02-18 02:22:52', '2020-02-18 02:22:52'),
(81, 1591, 'Skun Ferullus 1.5mm', NULL, 'Local', '100', 'Pcs', 175, 0, NULL, 21, 39, '2020-02-18 02:23:00', '2020-02-18 02:23:00'),
(82, 2148, 'Panel Box MS H400xW300xD250', NULL, NULL, '1', NULL, 0, 0, NULL, 21, 39, '2020-02-18 02:23:20', '2020-02-18 02:23:20'),
(83, 2147, 'IC60N - miniature circuit breaker - 2P - 32A - C curve', 'A9F74232', 'Schneider', '1', NULL, 0, 0, NULL, 21, 39, '2020-02-18 02:23:36', '2020-02-18 02:23:36'),
(84, 2153, 'Feed-through terminal, Double-tier terminal, Screw connection, 2.5 mm², 400 V, 24 A, dark beige', '1021500000', 'Weidmuller', '86', 'Pcs', 0, 0, NULL, 21, 39, '2020-02-18 03:43:13', '2020-02-18 07:07:00'),
(85, 1666, 'MCB iC60NN 2P 4A', 'A9F74204', 'Schneider', '2', 'pcs', 404250, 0, NULL, 21, 39, '2020-02-18 03:44:27', '2020-02-18 06:20:11'),
(86, 1663, 'MCB iC60NN 1P 4A', 'A9F74104', 'Schneider', '2', 'Pcs', 121000, 0, NULL, 21, 39, '2020-02-18 03:44:43', '2020-02-18 06:20:37'),
(87, 2149, 'DIN-rail power supplies for 1-phase systems 24VDC, 5A', 'CS5.241', 'PULS', '2', 'Pcs', 0, 0, NULL, 21, 39, '2020-02-18 03:45:07', '2020-02-18 06:20:58'),
(88, 2150, 'DIN socket iPC -2P+E -16A-250VAC-NFC15100 -french std-with volt.pres.indic.light', 'A9A15307', 'Schneider', '3', 'Pcs', 0, 0, NULL, 21, 39, '2020-02-18 03:45:24', '2020-02-18 06:21:15'),
(89, 2151, ' Ethernet-to-Fiber Media Converters', 'IMC-21 Series', 'Moxa', '2', 'Pcs', 0, 0, NULL, 21, 39, '2020-02-18 03:46:36', '2020-02-18 06:21:30'),
(90, 1470, 'HMI Beijer 7\"', 'X2Base7', 'Beijer', '1', 'Unit', 0, 0, NULL, 21, 39, '2020-02-18 03:46:46', '2020-02-18 03:46:46'),
(91, 2152, 'Feed-through terminal, Screw connection, 2.5 mm², 800 V, 24 A, dark beige', '1020000000', 'Weidmuller', '20', 'Pcs', 0, 0, NULL, 21, 39, '2020-02-18 03:47:18', '2020-02-18 06:22:06'),
(92, 2173, 'W-Series, Initiator/actuator terminal, Rated cross-section: 2.5 mm², Screw connection', '1784180000', 'Weidmuller', '8', 'Pcs', 0, 0, NULL, 21, 39, '2020-02-18 03:48:43', '2020-02-18 07:07:17'),
(93, 2155, 'PE terminal, Screw connection, 2.5 mm², 300 A (2.5 mm²), green / yellow', '1020000000', 'Weidmueller', '55', 'Ea', 0, 0, NULL, 21, 39, '2020-02-18 03:49:00', '2020-02-18 07:07:33'),
(94, 2174, 'Roset 4 Core + Adapter SC FTTH/Fiber Optical Terminal Box/OTB FO/Optik', NULL, NULL, '2', 'Pcs', 0, 0, NULL, 21, 39, '2020-02-18 03:49:14', '2020-02-18 07:07:46'),
(95, 2157, 'Patchcord SC-SC Simplex Single Mode [1--5Meter]', NULL, NULL, '4', 'Pcs', 0, 0, NULL, 21, 39, '2020-02-18 03:49:29', '2020-02-18 07:08:03'),
(96, 2158, 'Cable 2,5mm Biru', NULL, 'Federal', '1', 'Roll', 0, 0, NULL, 21, 39, '2020-02-18 03:49:51', '2020-02-18 03:49:51'),
(97, 2160, 'Cable 2,5mm merah', NULL, 'Federal', '1', 'Roll', 0, 0, NULL, 21, 39, '2020-02-18 03:50:04', '2020-02-18 03:50:04'),
(98, 2159, 'Cable 2,5mm Biru muda', NULL, 'Jembo', '1', 'Roll', 0, 0, NULL, 21, 39, '2020-02-18 03:50:12', '2020-02-18 03:50:12'),
(99, 2163, 'Cable 1,5mm merah', NULL, 'Federal', '1', 'Roll', 0, 0, NULL, 21, 39, '2020-02-18 03:50:23', '2020-02-18 03:50:23'),
(100, 2162, 'Cable 1,5mm Biru muda', NULL, 'Jembo', '1', 'Roll', 0, 0, NULL, 21, 39, '2020-02-18 03:50:36', '2020-02-18 03:50:36'),
(101, 2161, 'Cable 1,5mm Biru', NULL, 'Federal', '1', 'Roll', 0, 0, NULL, 21, 39, '2020-02-18 03:50:45', '2020-02-18 03:50:45'),
(102, 2165, 'Cable 0,75mm Biru muda', NULL, 'Jembo', '1', 'Roll', 0, 0, NULL, 21, 39, '2020-02-18 03:51:18', '2020-02-18 03:51:18'),
(103, 2164, 'Cable 0,75mm Biru', NULL, 'Federal', '1', 'Roll', 0, 0, NULL, 21, 39, '2020-02-18 03:51:30', '2020-02-18 03:51:30'),
(104, 2166, 'Cable 0,5mm Biru', NULL, 'Federal', '1', 'Roll', 0, 0, NULL, 21, 39, '2020-02-18 03:51:40', '2020-02-18 03:51:40'),
(105, 2167, 'Skun Ferules 4mm', NULL, NULL, '100', 'Pcs', 0, 0, NULL, 21, 39, '2020-02-18 03:52:54', '2020-02-18 03:52:54'),
(106, 1593, 'Skun Ferullus 2.5 mm', NULL, 'Local', '100', 'Pcs', 200, 0, NULL, 21, 39, '2020-02-18 03:53:20', '2020-02-18 03:53:20'),
(107, 2169, 'Skun Ferules 1,5mm', NULL, NULL, '100', 'Pcs', 0, 0, NULL, 21, 39, '2020-02-18 03:53:38', '2020-02-18 03:53:42'),
(108, 2170, 'Skun Ferules 0,75mm', NULL, NULL, '200', 'Pcs', 0, 0, NULL, 21, 39, '2020-02-18 03:54:02', '2020-02-18 03:54:02'),
(109, 2171, 'Skun Ferules 0,5mm', NULL, NULL, '300', 'Pcs', 0, 0, NULL, 21, 39, '2020-02-18 03:54:13', '2020-02-18 03:54:13'),
(110, 2282, 'Panel Box MS H600 x W500 x D250', 'Panel Box MS', NULL, '1', 'Pcs', 0, NULL, NULL, 21, 39, '2020-02-18 04:05:40', '2020-02-18 04:05:40'),
(111, 2172, 'Cisco ASA 5500-X with FirePOWER Services 8Port', NULL, 'Cisco', '1', 'Pcs', 0, 0, NULL, 21, 39, '2020-02-18 06:21:48', '2020-02-18 06:21:48'),
(112, 2176, 'Connector RJ45', NULL, NULL, '100', NULL, 0, 0, NULL, 21, 39, '2020-02-18 07:08:42', '2020-02-18 07:08:42'),
(113, 2235, 'Bolt & nut M8 x 40L', NULL, NULL, '12', 'pcs', 0, 0, NULL, 22, 39, '2020-02-19 04:05:42', '2020-02-19 04:05:42'),
(114, 2236, 'Grounding Bar,copper tine,400mm x 50 mm x 6mm', NULL, 'Jembo', '6', 'pcs', 0, 0, NULL, 22, 39, '2020-02-19 04:06:08', '2020-02-19 04:06:08'),
(115, 2237, 'Grounding Cable 35sqmm', 'Power earth bar-1 to power earth bar-3', 'Jembo', '639', 'M', 0, 0, NULL, 22, 39, '2020-02-19 04:06:28', '2020-02-19 04:06:28'),
(116, 2238, 'Grounding Cable 70sqmm', 'Field to control room', 'Jembo', '48', 'M', 0, 0, NULL, 22, 39, '2020-02-19 04:06:38', '2020-02-19 04:06:38'),
(117, 2262, 'Panel Single Door (HxWxD)1500X800X400 free standing', NULL, 'Cometal', '2', 'Unit', 0, 0, NULL, 22, 39, '2020-02-19 04:06:56', '2020-02-19 04:21:41'),
(118, 2240, 'PLC', '2080-LC70-24QBB', 'Allen Bradley', '2', 'Unit', 0, 0, NULL, 22, 39, '2020-02-19 04:08:42', '2020-02-19 04:17:52'),
(119, 2241, 'Modul DI  24 VDC 16 Chanel', '2085-IQ16', 'Allen Bradley', '3', 'Pcs', 0, 0, NULL, 22, 39, '2020-02-19 04:09:01', '2020-02-19 04:22:19'),
(120, 2242, 'Modul DO 24 VDC 16 Chanel', '2085-OB16', 'Allen Bradley', '3', 'Pcs', 0, 0, NULL, 22, 39, '2020-02-19 04:09:14', '2020-02-19 04:22:32'),
(121, 2243, 'Modul AI 4-20mA 8 Chanel', '2085-IF8', 'Allen Bradley', '2', 'Pcs', 0, 0, NULL, 22, 39, '2020-02-19 04:10:02', '2020-02-19 04:18:15'),
(122, 2244, 'HMI 7\"', '2711R-T7T', 'Allen Bradley', '2', 'Pcs', 0, 0, NULL, 22, 39, '2020-02-19 04:10:17', '2020-02-19 04:18:45'),
(123, 2124, 'Expansion I/O End Cap/Bus Terminator', '2085-ECR', 'Allen Bradley', '2', 'Pcs', 231040, 0, NULL, 22, 39, '2020-02-19 04:12:33', '2020-02-19 04:18:58'),
(124, 2245, 'IC60N - miniature circuit breaker - 1P - 10A - C curve', 'A9F74110', 'Schneider', '3', 'Pcs', 0, 0, NULL, 22, 39, '2020-02-19 04:12:46', '2020-02-19 04:23:06'),
(125, 2246, 'Fuse 2A', NULL, NULL, '32', 'Pcs', 0, 0, NULL, 22, 39, '2020-02-19 04:13:11', '2020-02-19 04:23:18'),
(126, 2247, 'DIN-rail power supplies for 1-phase systems 24V, 20A', 'PIC240.241C', 'Puls', '3', 'Pcs', 0, 0, NULL, 22, 39, '2020-02-19 04:13:26', '2020-02-19 04:22:45'),
(127, 2258, 'Relay 24VDC, 4 contact C/O', 'RXM4AB2BD', 'Schneider', '32', 'Pcs', 0, 0, NULL, 22, 39, '2020-02-19 04:13:45', '2020-02-19 04:23:41'),
(128, 2249, 'Socket for relay RXM2/4', 'RXZE1M4C', 'Schneider', '32', 'Pcs', 0, 0, NULL, 22, 39, '2020-02-19 04:16:49', '2020-02-19 04:23:32'),
(129, 2250, 'Selector switch (auto / manual)', NULL, 'salzer', '7', 'Pcs', 0, 0, NULL, 22, 39, '2020-02-19 04:17:28', '2020-02-19 04:23:55'),
(130, 2253, 'Modul AO 4-20mA 8 Chanel', '2085-OF4', 'Allen Bradley', '2', 'Pcs', 0, 0, NULL, 22, 39, '2020-02-19 04:18:33', '2020-02-19 04:18:33'),
(131, 2261, 'Din Rill', 'Ts 35/x7,5', 'Weidmuller', '5', 'Pcs', 0, 0, NULL, 22, 39, '2020-02-19 04:21:31', '2020-02-19 04:21:31'),
(132, 2263, 'PLC', '2080-LC70-24QBB', 'Allen Bradley', '1', 'Unit', 0, 0, NULL, 22, 39, '2020-02-19 04:21:58', '2020-02-19 04:21:58'),
(133, 2272, 'Pressure Gauge 1,6 Bar c/w Accessories', NULL, 'Wika', '2', 'Pcs', 0, 0, NULL, 22, 39, '2020-02-19 04:24:14', '2020-02-19 04:24:14'),
(134, 2273, 'Pressure Gauge 6 Bar c/w Accessories', NULL, 'Wika', '1', 'Pcs', 0, 0, NULL, 22, 39, '2020-02-19 04:24:28', '2020-02-19 04:24:28'),
(135, 2274, 'Pressure Gauge 60 Bar c/w Accessories', NULL, 'Wika', '1', 'Pcs', 0, 0, NULL, 22, 39, '2020-02-19 04:24:34', '2020-02-19 04:24:34'),
(136, 2275, 'Cable Gland 1/2\" NPT', NULL, NULL, '195', 'Pcs', 0, 0, NULL, 22, 39, '2020-02-19 04:24:45', '2020-02-19 04:24:45'),
(137, 2276, 'Cable Gland 3/4\" NPT', NULL, NULL, '5', 'Pcs', 0, 0, NULL, 22, 39, '2020-02-19 04:24:56', '2020-02-19 04:24:56'),
(138, 2277, 'Ethernet Cable (Cat6)', '1 roll 300meter', NULL, '6', 'ROLL', 0, 0, NULL, 22, 39, '2020-02-19 04:25:10', '2020-02-19 04:25:10'),
(139, 2281, 'Isolasi PVC Tape 1/2\"(W)', 'Kuning', 'PVC', '40', 'Pcs', 0, 0, NULL, 22, 39, '2020-02-19 04:25:35', '2020-02-19 04:25:35');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'ROLE_ADMIN', 'A User with admin Privilege', NULL, NULL),
(2, 'ROLE_SUPERADMIN', 'A User with superadmin Privilege', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 2, 1, NULL, NULL),
(5, 1, 31, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `departement_id` int(11) NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `departement_id`, `avatar`) VALUES
(33, 'Ardhi Ramadhan', 'ardhi@gmail.com', NULL, '$2y$10$9dyxcNswlIk5N9aQqRq4YeCyEvao2f.F6tm6JO.19v8jBVBEoSDB2', 'kbEUlH8AgkFAVIBI8FncueNHqgpuTa5YVYDSCMKoxkiG2DK3OaJkV4VGU6Kz', '2019-10-15 01:38:12', '2019-10-31 03:49:46', 46, '1571140965.png'),
(35, 'ROOT USER', 'root@root.com', NULL, '$2y$10$K6LmBu.NT6/16xW1LGANeuJ3rXYsBzrAZBkIBom6k1L1Cnjv3axsq', 'Mje8JxYjHinMSXbFboWnPTnAnvtqj1ZI5p6CIeosVd46YLRbqQJKweZVdUjk', '2019-10-15 05:05:41', '2019-10-15 05:05:41', 46, '1571141141.png'),
(36, 'Udin', 'sofyan@jpa-automation.com', NULL, '$2y$10$eghSupuI.31ZDG6EQWYoOOyYh/OzARkiEse.D51FHsyl/NYodtD26', 'lxl0wuPKUESFzwy9uDdE7PIQBy9f1UhZHXFluVeE4Bx41UVt0U5Bprc6WStn', '2019-11-06 03:34:37', '2019-11-06 03:46:17', 48, '1573011277.jpg'),
(37, 'Bedul', 'rohman@jpa-automation.com', NULL, '$2y$10$owv8dAWo4/DtX5UioIWkdeDf/matqJibhSvhD2Yg36w8y2E4/w8AG', '7YvNshV5vLgkwwwNBhOqL0wr75KXkAR6rXVsBbtGgm8zu8LZb6CU05clo5q8', '2019-11-06 03:42:51', '2019-11-06 03:42:51', 49, '1573011771.jpg'),
(38, 'Nita', 'husnita@jpa-automation.com', NULL, '$2y$10$d9yjsyWTneZ7ynko9e9CVOkhcfsMlWyERnH30hsR8p5wzaAX8LipK', 'jY1eMFF5CXDHXMqqHul7HRhZpLuQb7hIDLcQspsoYfGt05PPBwum39V2EV9T', '2019-11-06 03:49:26', '2019-11-06 03:49:26', 50, '1573012165.jpeg'),
(39, 'Gudang', 'Workshop@jpa-automation.com', NULL, '$2y$10$alEms0pmUFVhVSQDZWTx2eOTO72wu.0VGtr/PMVCH1PDC7AIBLeSO', 'o9cGwjVyhdWBdzxkPuiP7Y8JsN59PnUFBwo3yEbugzvRmrvZTJ0VeZZdaQ2j', '2020-01-27 07:01:29', '2020-01-29 04:24:01', 46, '1580108489.png');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'SCHNEIDER', NULL, '2019-10-30 09:06:55'),
(3, 'BEIJER', NULL, '2019-10-30 09:06:50'),
(4, 'ROCKWELL', NULL, '2019-10-30 09:06:46'),
(5, 'SIEMENS', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_in_items`
--

CREATE TABLE `warehouse_in_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `item_id` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mfg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `disc` int(11) DEFAULT NULL,
  `net_price` int(11) DEFAULT NULL,
  `total_cost` int(11) DEFAULT NULL,
  `vendor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_order_id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse_in_items`
--

INSERT INTO `warehouse_in_items` (`id`, `item_id`, `description`, `type`, `mfg`, `qty`, `unit`, `price`, `disc`, `net_price`, `total_cost`, `vendor`, `purchase_order_id`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(3, 403, 'Copper Busbar 10x100x4000mm', '4PMCM101', 'PM', '2', 'Btg', 20000, 10, 18000, NULL, 'SCHNEIDER', 3, 1, 35, '2019-11-07 02:25:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_items`
--

CREATE TABLE `warehouse_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `item_id` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mfg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `disc` int(11) DEFAULT NULL,
  `net_price` int(11) DEFAULT NULL,
  `total_cost` int(11) DEFAULT NULL,
  `vendor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_order_id` bigint(20) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouse_items`
--

INSERT INTO `warehouse_items` (`id`, `item_id`, `description`, `type`, `mfg`, `qty`, `unit`, `price`, `disc`, `net_price`, `total_cost`, `vendor`, `purchase_order_id`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(3, 403, 'Copper Busbar 10x100x4000mm', '4PMCM101', 'PM', '2', 'Btg', 20000, 10, 18000, NULL, 'SCHNEIDER', 3, 1, 35, '2019-11-07 02:25:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_out_items`
--

CREATE TABLE `warehouse_out_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `item_id` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mfg` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `disc` int(11) DEFAULT NULL,
  `net_price` int(11) DEFAULT NULL,
  `total_cost` int(11) DEFAULT NULL,
  `vendor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_order_id` bigint(20) UNSIGNED NOT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departements`
--
ALTER TABLE `departements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departement_privilege`
--
ALTER TABLE `departement_privilege`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `description` (`description`),
  ADD KEY `type` (`type`),
  ADD KEY `mfg` (`mfg`),
  ADD KEY `qty` (`qty`),
  ADD KEY `unit` (`unit`),
  ADD KEY `price` (`price`,`disc`,`total_cost`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `privileges`
--
ALTER TABLE `privileges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `project_number` (`project_number`);

--
-- Indexes for table `project_items`
--
ALTER TABLE `project_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchase_orders_po_number_unique` (`po_number`);

--
-- Indexes for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchase_requisitions`
--
ALTER TABLE `purchase_requisitions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchase_requisitions_pr_number_unique` (`pr_number`);

--
-- Indexes for table `purchase_requisition_items`
--
ALTER TABLE `purchase_requisition_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouse_in_items`
--
ALTER TABLE `warehouse_in_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouse_items`
--
ALTER TABLE `warehouse_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouse_out_items`
--
ALTER TABLE `warehouse_out_items`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `departements`
--
ALTER TABLE `departements`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `departement_privilege`
--
ALTER TABLE `departement_privilege`
  MODIFY `id` bigint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=270;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2283;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `privileges`
--
ALTER TABLE `privileges`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `project_items`
--
ALTER TABLE `project_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=277;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `purchase_requisitions`
--
ALTER TABLE `purchase_requisitions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `purchase_requisition_items`
--
ALTER TABLE `purchase_requisition_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=140;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `warehouse_in_items`
--
ALTER TABLE `warehouse_in_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `warehouse_items`
--
ALTER TABLE `warehouse_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `warehouse_out_items`
--
ALTER TABLE `warehouse_out_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
