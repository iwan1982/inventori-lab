-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2023 at 02:01 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inv2`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_alatnonperaga_keluar`
--

CREATE TABLE `tb_alatnonperaga_keluar` (
  `id` int(10) NOT NULL,
  `id_transaksi` varchar(50) NOT NULL,
  `tanggal_masuk` varchar(20) NOT NULL,
  `tanggal_keluar` varchar(20) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `nama_alat` varchar(100) NOT NULL,
  `merk` varchar(50) NOT NULL,
  `kondisi` varchar(50) NOT NULL,
  `pj` varchar(50) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `hp` varchar(50) NOT NULL,
  `jumlah` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_alatnonperaga_keluar`
--

INSERT INTO `tb_alatnonperaga_keluar` (`id`, `id_transaksi`, `tanggal_masuk`, `tanggal_keluar`, `jenis`, `satuan`, `nama_alat`, `merk`, `kondisi`, `pj`, `nim`, `hp`, `jumlah`) VALUES
(33, 'ANP-202353986271', '07/03/2023', '16/02/2023', 'Kaca', '', 'LABU UKUR 25ml', 'Herma', 'Baik', 'Masyitha', '21013057', '085895573709', '1');

--
-- Triggers `tb_alatnonperaga_keluar`
--
DELIMITER $$
CREATE TRIGGER `TB_ALATNONPERAGA_KELUAR` AFTER INSERT ON `tb_alatnonperaga_keluar` FOR EACH ROW BEGIN
 UPDATE tb_alat_nonperaga SET jumlah=jumlah-NEW.jumlah
 WHERE nama_alat=NEW.nama_alat;
 DELETE FROM tb_alat_nonperaga WHERE jumlah = 0;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_alatnonperaga_kembali`
--

CREATE TABLE `tb_alatnonperaga_kembali` (
  `id` int(10) NOT NULL,
  `id_transaksi` varchar(50) NOT NULL,
  `tanggal_masuk` varchar(20) NOT NULL,
  `tanggal_keluar` varchar(20) NOT NULL,
  `jenis` varchar(50) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `nama_alat` varchar(100) NOT NULL,
  `merk` varchar(50) NOT NULL,
  `kondisi` varchar(50) NOT NULL,
  `pj` varchar(50) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `hp` varchar(50) NOT NULL,
  `jumlah` varchar(10) NOT NULL,
  `tanggal_kembali` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_alatnonperaga_kembali`
--

INSERT INTO `tb_alatnonperaga_kembali` (`id`, `id_transaksi`, `tanggal_masuk`, `tanggal_keluar`, `jenis`, `satuan`, `nama_alat`, `merk`, `kondisi`, `pj`, `nim`, `hp`, `jumlah`, `tanggal_kembali`) VALUES
(31, 'ANP-202368120549', '07/03/2023', '16/02/2023', 'Kaca', '', 'LABU UKUR 50ml', 'Herma', 'Baik', 'Masyitha', '21013057', '085895573709', '1', '20/03/2023'),
(32, 'ANP-202302641859', '09/03/2023', '10/03/2023', 'Keramik', '', 'CAWAN PORSELEN 35ml', 'herma', 'Baik', 'anggi', '010101', '0000000', '1', '20/03/2023'),
(33, 'ANP-202320856739', '07/03/2023', '27/02/2023', 'Kaca', '', 'LABU UKUR 100ml', 'Herma', 'Baik', 'Masyitha', '21013057', '085895573709', '1', '20/03/2023'),
(34, 'ANP-202364312085', '07/03/2023', '27/02/2023', 'Kaca', '', 'BEAKER GLASS 500ml', 'Herma', 'Baik', 'Masyitha', '21013057', '085895573709', '1', '20/03/2023'),
(35, 'ANP-202362540387', '08/03/2023', '04/03/2023', 'Keramik', '', 'CAWAN PORSELEN 150ml', 'Herma', 'Baik', 'Lia Oktaviani 5B', '20012059', '085799927994', '1', '20/03/2023');

--
-- Triggers `tb_alatnonperaga_kembali`
--
DELIMITER $$
CREATE TRIGGER `TB_ALATNONPERAGA_KEMBALI` AFTER INSERT ON `tb_alatnonperaga_kembali` FOR EACH ROW BEGIN
 UPDATE tb_alatnonperaga_keluar SET jumlah=jumlah-NEW.jumlah
 WHERE nama_alat=NEW.nama_alat;
 DELETE FROM tb_alatnonperaga_keluar WHERE jumlah = 0;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TB_ALATNONPERAGA_UPDATE` AFTER INSERT ON `tb_alatnonperaga_kembali` FOR EACH ROW BEGIN
 UPDATE tb_alat_nonperaga SET jumlah=jumlah+NEW.jumlah
 WHERE id_transaksi=NEW.id_transaksi;
 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_alatperaga_keluar`
--

CREATE TABLE `tb_alatperaga_keluar` (
  `id` int(10) NOT NULL,
  `id_transaksi` varchar(50) NOT NULL,
  `tanggal_masuk` varchar(20) NOT NULL,
  `tanggal_keluar` varchar(20) NOT NULL,
  `laboratorium` varchar(100) NOT NULL,
  `nomor_seri` varchar(100) NOT NULL,
  `nama_alat` varchar(100) NOT NULL,
  `merk` varchar(50) NOT NULL,
  `kondisi` varchar(50) NOT NULL,
  `pj` varchar(50) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `hp` varchar(50) NOT NULL,
  `jumlah` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_alatperaga_keluar`
--

INSERT INTO `tb_alatperaga_keluar` (`id`, `id_transaksi`, `tanggal_masuk`, `tanggal_keluar`, `laboratorium`, `nomor_seri`, `nama_alat`, `merk`, `kondisi`, `pj`, `nim`, `hp`, `jumlah`) VALUES
(24, 'AP-202337196502', '08/03/2023', '20/03/2023', 'Steril', '1212', 'piring', 'goo', 'rusak', 'nafis', '000112', '212121', '8');

--
-- Triggers `tb_alatperaga_keluar`
--
DELIMITER $$
CREATE TRIGGER `TB_ALATPERAGA_KELUAR` AFTER INSERT ON `tb_alatperaga_keluar` FOR EACH ROW BEGIN
 UPDATE tb_alat_peraga SET jumlah=jumlah-NEW.jumlah
 WHERE nomor_seri=NEW.nomor_seri;
 DELETE FROM tb_alat_peraga WHERE jumlah = 0;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_alatperaga_kembali`
--

CREATE TABLE `tb_alatperaga_kembali` (
  `id` int(10) NOT NULL,
  `id_transaksi` varchar(50) NOT NULL,
  `tanggal_masuk` varchar(20) NOT NULL,
  `tanggal_keluar` varchar(20) NOT NULL,
  `laboratorium` varchar(100) NOT NULL,
  `nomor_seri` varchar(100) NOT NULL,
  `nama_alat` varchar(100) NOT NULL,
  `merk` varchar(50) NOT NULL,
  `kondisi` varchar(50) NOT NULL,
  `pj` varchar(50) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `hp` varchar(50) NOT NULL,
  `jumlah` varchar(10) NOT NULL,
  `tanggal_kembali` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_alatperaga_kembali`
--

INSERT INTO `tb_alatperaga_kembali` (`id`, `id_transaksi`, `tanggal_masuk`, `tanggal_keluar`, `laboratorium`, `nomor_seri`, `nama_alat`, `merk`, `kondisi`, `pj`, `nim`, `hp`, `jumlah`, `tanggal_kembali`) VALUES
(25, 'AP-202337196502', '08/03/2023', '20/03/2023', 'Steril', '1212', 'piring', 'hjhj', 'Baik', 'bambang', '223230', '0908080', '2', ''),
(26, 'AP-202337196502', '08/03/2023', '20/03/2023', 'Steril', '1212', 'piring', 'hjhj', 'Baik', 'bambang', '223230', '0908080', '3', '28/02/2023');

--
-- Triggers `tb_alatperaga_kembali`
--
DELIMITER $$
CREATE TRIGGER `TB_ALATPERAGA_KEMBALI` AFTER INSERT ON `tb_alatperaga_kembali` FOR EACH ROW BEGIN
 UPDATE tb_alatperaga_keluar SET jumlah=jumlah-NEW.jumlah
 WHERE nama_alat=NEW.nama_alat;
 DELETE FROM tb_alatperaga_keluar WHERE jumlah = 0;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `TB_ALATPERAGA_UPDATE` AFTER INSERT ON `tb_alatperaga_kembali` FOR EACH ROW BEGIN
 UPDATE tb_alat_peraga SET jumlah=jumlah+NEW.jumlah
 WHERE id_transaksi=NEW.id_transaksi;
 
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_alat_nonperaga`
--

CREATE TABLE `tb_alat_nonperaga` (
  `id_transaksi` varchar(50) NOT NULL,
  `tanggal` varchar(20) NOT NULL,
  `jenis` varchar(100) NOT NULL,
  `nama_alat` varchar(100) NOT NULL,
  `satuan` varchar(100) NOT NULL,
  `letak` varchar(50) NOT NULL,
  `jumlah` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_alat_nonperaga`
--

INSERT INTO `tb_alat_nonperaga` (`id_transaksi`, `tanggal`, `jenis`, `nama_alat`, `satuan`, `letak`, `jumlah`) VALUES
('ANP-202302641859', '09/03/2023', 'Keramik', 'CAWAN PORSELEN 35ml', 'Biji', 'R. Peny. Alat', '5'),
('ANP-202304397165', '09/03/2023', 'Plastik', 'MIKROPIPET', 'Biji', 'R. Peny. Alat', '4'),
('ANP-202305412376', '07/03/2023', 'Kaca', 'PIKNOMETER 25ml', 'Biji', 'R. Peny. Alat', '23'),
('ANP-202305829471', '07/03/2023', 'Kaca', 'PIPET UKUR 1ml', 'Biji', 'R. Peny. Alat', '7'),
('ANP-202305914286', '07/03/2023', 'Kaca', 'BEAKER GLASS 250ml', 'Biji', 'R. Peny. Alat', '60'),
('ANP-202307956312', '07/03/2023', 'Kaca', 'GELAS UKUR 50ml', 'Biji', 'R. Peny. Alat', '44'),
('ANP-202308526479', '07/03/2023', 'Kaca', 'KACA ARLOJI 10cm', 'Biji', 'R. Peny. Alat', '9'),
('ANP-202310459863', '09/03/2023', 'Keramik', 'CAWAN PORSELEN 100ml', 'Biji', 'R. Peny. Alat', '40'),
('ANP-202310839657', '07/03/2023', 'Kaca', 'CORONG KACA 60ml', 'Biji', 'R. Peny. Alat', '23'),
('ANP-202312389057', '07/03/2023', 'Kaca', 'GELAS UKUR 25ml', 'Biji', 'R. Peny. Alat', '31'),
('ANP-202316234095', '07/03/2023', 'Kaca', 'PIPET UKUR 5ml', 'Biji', 'R. Peny. Alat', '3'),
('ANP-202317620984', '09/03/2023', 'Besi', 'CETAKAN SUPPOSITORIA', 'Biji', 'R. Peny. Alat', '1'),
('ANP-202318923456', '07/03/2023', 'Kaca', 'ERLENMEYER 500ml', 'Biji', 'R. Peny. Alat', '22'),
('ANP-202320856739', '07/03/2023', 'Kaca', 'LABU UKUR 100ml', 'Biji', 'R. Peny. Alat', '44'),
('ANP-202321940857', '07/03/2023', 'Kaca', 'GELAS UKUR 5ml', 'Biji', 'R. Peny. Alat', '44'),
('ANP-202323698174', '07/03/2023', 'Kaca', 'KACA ARLOJI 8cm', 'Biji', 'R. Peny. Alat', '6'),
('ANP-202323750946', '07/03/2023', 'Kaca', 'KACA ARLOJI 6cm', 'Biji', 'R. Peny. Alat', '21'),
('ANP-202326957843', '07/03/2023', 'Kaca', 'TERMOMETER 100 C', 'Biji', 'R. Peny. Alat', '9'),
('ANP-202327398401', '07/03/2023', 'Kaca', 'ERLENMEYER 250ml', 'Biji', 'R. Peny. Alat', '63'),
('ANP-202331064582', '07/03/2023', 'Kaca', 'PIPET VOLUME 20ml', 'Biji', 'R. Peny. Alat', '7'),
('ANP-202331840527', '07/03/2023', 'Kaca', 'BEAKER GLASS 100ml', 'Biji', 'R. Peny. Alat', '80'),
('ANP-202334027915', '07/03/2023', 'Kaca', 'PIPET VOLUME 1ml', 'Biji', 'R. Peny. Alat', '9'),
('ANP-202335218496', '09/03/2023', 'Besi', 'HARDNES TESTER', 'Biji', 'R. Peny. Alat', '6'),
('ANP-202335670248', '08/03/2023', 'Kaca', 'SOKLET SET 500ml', 'Biji', 'R. Peny. Alat', '1'),
('ANP-202337652980', '07/03/2023', 'Kaca', 'GELAS UKUR 1L', 'Biji', 'R. Peny. Alat', '11'),
('ANP-202340185376', '07/03/2023', 'Kaca', 'TERMOMETER 300 C', 'Biji', 'R. Peny. Alat', '7'),
('ANP-202341257638', '07/03/2023', 'Kaca', 'CORONG KACA 75ml', 'Biji', 'R. Peny. Alat', '19'),
('ANP-202341276583', '09/03/2023', 'Keramik', 'CAWAN PORSELEN 60ml', 'Biji', 'R. Peny. Alat', '1'),
('ANP-202341328560', '07/03/2023', 'Kaca', 'KUVET ', 'Biji', 'R. Peny. Alat', '15'),
('ANP-202349165203', '09/03/2023', 'Besi', 'CETAKAN KAPSUL', 'Biji', 'R. Peny. Alat', '1'),
('ANP-202350789132', '07/03/2023', 'Kaca', 'LABU DISOLUSI', 'Biji', 'R. Peny. Alat', '2'),
('ANP-202352048637', '07/03/2023', 'Kaca', 'LABU UKUR 250ml', 'Biji', 'R. Peny. Alat', '21'),
('ANP-202353986271', '07/03/2023', 'Kaca', 'LABU UKUR 25ml', 'Biji', 'R. Peny. Alat', '17'),
('ANP-202354328719', '07/03/2023', 'Kaca', 'PIPET VOLUME 2ml', 'Biji', 'R. Peny. Alat', '7'),
('ANP-202358471632', '07/03/2023', 'Kaca', 'TABUNG REAKSI ', 'Biji', 'R. Peny. Alat', '200'),
('ANP-202358902613', '07/03/2023', 'Kaca', 'LABU ALAS BULAT 250ml', 'Biji', 'R. Peny. Alat', '4'),
('ANP-202360758234', '07/03/2023', 'Kaca', 'BURET 100ml', 'Biji', 'R. Peny. Alat', '1'),
('ANP-202361083794', '07/03/2023', 'Kaca', 'GELAS UKUR 250ml', 'Biji', 'R. Peny. Alat', '21'),
('ANP-202361497805', '07/03/2023', 'Kaca', 'ERLENMEYER 1L', 'Biji', 'R. Peny. Alat', '2'),
('ANP-202361703248', '07/03/2023', 'Kaca', 'LABU ALAS BULAT 500ml', 'Biji', 'R. Peny. Alat', '2'),
('ANP-202362540387', '08/03/2023', 'Keramik', 'CAWAN PORSELEN 150ml', 'Biji', 'R. Peny. Alat', '40'),
('ANP-202362745913', '07/03/2023', 'Kaca', 'PIKNOMETER 50ml', 'Biji', 'R. Peny. Alat', '22'),
('ANP-202364312085', '07/03/2023', 'Kaca', 'BEAKER GLASS 500ml', 'Biji', 'R. Peny. Alat', '48'),
('ANP-202364891573', '08/03/2023', 'Kaca', 'SOKLET SET 250ml', 'Biji', 'R. Peny. Alat', '3'),
('ANP-202364925871', '07/03/2023', 'Kaca', 'CAWAN PETRI', 'Biji', 'R. Peny. Alat', '117'),
('ANP-202365271438', '07/03/2023', 'Kaca', 'LABU UKUR 1L', 'Biji', 'R. Peny. Alat', '8'),
('ANP-202367234085', '07/03/2023', 'Kaca', 'BEAKER GLASS 1L', 'Biji', 'R. Peny. Alat', '27'),
('ANP-202368120549', '07/03/2023', 'Kaca', 'LABU UKUR 50ml', 'Biji', 'R. Peny. Alat', '48'),
('ANP-202369125803', '09/03/2023', 'Besi', 'JANGKA SORONG', 'Biji', 'R. Peny. Alat', '12'),
('ANP-202369715843', '08/03/2023', 'Kaca', 'PERKOLASI 250ml', 'Biji', 'R. Peny. Alat', '2'),
('ANP-202370861324', '07/03/2023', 'Kaca', 'PIPET VOLUME 25ml', 'Biji', 'R. Peny. Alat', '9'),
('ANP-202370921483', '08/03/2023', 'Kaca', 'BOTOL TIMBANG', 'Biji', 'R. Peny. Alat', '20'),
('ANP-202372463915', '07/03/2023', 'Kaca', 'CORONG PISAH 250ml', 'Biji', 'R. Peny. Alat', '5'),
('ANP-202372910635', '07/03/2023', 'Kaca', 'PIPET VOLUME 5ml', 'Biji', 'R. Peny. Alat', '15'),
('ANP-202375362910', '07/03/2023', 'Kaca', 'CORONG KACA 100ml', 'Biji', 'R. Peny. Alat', '14'),
('ANP-202376105984', '07/03/2023', 'Kaca', 'BEAKER GLASS 50ml', 'Biji', 'R. Peny. Alat', '100'),
('ANP-202376128053', '09/03/2023', 'Keramik', 'CAWAN PORSELEN 125ml', 'Biji', 'R. Peny. Alat', '40'),
('ANP-202376904358', '07/03/2023', 'Kaca', 'LABU UKUR 10ml', 'Biji', 'R. Peny. Alat', '101'),
('ANP-202378315694', '07/03/2023', 'Kaca', 'GELAS UKUR 100ml', 'Biji', 'R. Peny. Alat', '16'),
('ANP-202378459362', '07/03/2023', 'Kaca', 'PIPET UKUR 25ml', 'Biji', 'R. Peny. Alat', '15'),
('ANP-202378465209', '07/03/2023', 'Kaca', 'CORONG KACA 50ml', 'Biji', 'R. Peny. Alat', '11'),
('ANP-202379213584', '07/03/2023', 'Kaca', 'PIPET UKUR 10ml', 'Biji', 'R. Peny. Alat', '24'),
('ANP-202381062974', '07/03/2023', 'Kaca', 'BEAKER GLASS 2L', 'Biji', 'R. Peny. Alat', '14'),
('ANP-202381275609', '09/03/2023', 'Stainless', 'SONDE', 'Biji', 'R. Peny. Alat', '8'),
('ANP-202383651709', '07/03/2023', 'Kaca', 'LABU UKUR 500ml', 'Biji', 'R. Peny. Alat', '19'),
('ANP-202387195240', '07/03/2023', 'Kaca', 'CORONG KACA 90ml', 'Biji', 'R. Peny. Alat', '4'),
('ANP-202390457362', '07/03/2023', 'Kaca', 'GELAS UKUR 10ml', 'Biji', 'R. Peny. Alat', '26'),
('ANP-202391762845', '07/03/2023', 'Kaca', 'LABU ALAS BULAT LEHER 3', 'Biji', 'R. Peny. Alat', '6'),
('ANP-202392160874', '07/03/2023', 'Kaca', 'ERLENMEYER 100ml', 'Biji', 'R. Peny. Alat', '33'),
('ANP-202392453068', '09/03/2023', 'Besi', 'MAGNETIK', 'Biji', 'R. Peny. Alat', '5'),
('ANP-202393850627', '07/03/2023', 'Kaca', 'ERLENMEYER 50ml', 'Biji', 'R. Peny. Alat', '11'),
('ANP-202394670358', '08/03/2023', 'Kaca', 'PERKOLASI 500ml', 'Biji', 'R. Peny. Alat', '1'),
('ANP-202397653280', '07/03/2023', 'Kayu', 'GELAS UKUR 500ml', 'Biji', 'R. Peny. Alat', '45');

-- --------------------------------------------------------

--
-- Table structure for table `tb_alat_peraga`
--

CREATE TABLE `tb_alat_peraga` (
  `id_transaksi` varchar(50) NOT NULL,
  `tanggal` varchar(20) NOT NULL,
  `laboratorium` varchar(100) NOT NULL,
  `nomor_seri` varchar(100) NOT NULL,
  `nama_alat` varchar(100) NOT NULL,
  `kondisi` varchar(50) NOT NULL,
  `jumlah` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_alat_peraga`
--

INSERT INTO `tb_alat_peraga` (`id_transaksi`, `tanggal`, `laboratorium`, `nomor_seri`, `nama_alat`, `kondisi`, `jumlah`) VALUES
('AP-202337196502', '08/03/2023', 'Steril', '1212', 'piring', 'Baik', '10'),
('AP-202338672109', '13/03/2023', 'Steril', '01', 'oven', 'Baik', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang_keluar`
--

CREATE TABLE `tb_barang_keluar` (
  `id` int(10) NOT NULL,
  `id_transaksi` varchar(50) NOT NULL,
  `tanggal_masuk` varchar(20) NOT NULL,
  `tanggal_keluar` varchar(20) NOT NULL,
  `lokasi` varchar(100) NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `penerima` varchar(50) NOT NULL,
  `jumlah` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang_keluar`
--

INSERT INTO `tb_barang_keluar` (`id`, `id_transaksi`, `tanggal_masuk`, `tanggal_keluar`, `lokasi`, `kode_barang`, `nama_barang`, `satuan`, `penerima`, `jumlah`) VALUES
(20, 'WG-202306392875', '20/02/2023', '01/03/2023', 'Cair', 'BRATACO', 'AQUADEST', 'L', 'TEKNOLOGI FARMASI', '20'),
(21, 'WG-202306392875', '20/02/2023', '02/03/2023', 'Cair', 'BRATACO', 'AQUADEST', 'L', 'TEKNOLOGI FARMASI', '20'),
(22, 'WG-202306392875', '20/02/2023', '03/03/2023', 'Cair', 'BRATACO', 'AQUADEST', 'L', 'KIMIA FARMASI', '20'),
(23, 'WG-202306392875', '20/02/2023', '04/03/2023', 'Cair', 'BRATACO', 'AQUADEST', 'L', 'FARMASETIKA', '40'),
(24, 'WG-202306392875', '20/02/2023', '06/03/2023', 'Cair', 'BRATACO', 'AQUADEST', 'L', '20', '100');

--
-- Triggers `tb_barang_keluar`
--
DELIMITER $$
CREATE TRIGGER `TG_BARANG_KELUAR` AFTER INSERT ON `tb_barang_keluar` FOR EACH ROW BEGIN
 UPDATE tb_barang_masuk SET jumlah=jumlah-NEW.jumlah
 WHERE kode_barang=NEW.kode_barang;
 DELETE FROM tb_barang_masuk WHERE jumlah = 0;

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang_masuk`
--

CREATE TABLE `tb_barang_masuk` (
  `id_transaksi` varchar(50) NOT NULL,
  `tanggal` varchar(20) NOT NULL,
  `lokasi` varchar(100) NOT NULL,
  `kode_barang` varchar(100) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `satuan` varchar(50) NOT NULL,
  `jumlah` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_barang_masuk`
--

INSERT INTO `tb_barang_masuk` (`id_transaksi`, `tanggal`, `lokasi`, `kode_barang`, `nama_barang`, `satuan`, `jumlah`) VALUES
('WG-202301736549', '07/03/2023', 'Serbuk', 'RAJAWALI', 'CMC Na ', 'Gr', '2500'),
('WG-202308637215', '07/03/2023', 'Cair', 'RAJAWALI', 'PROPILENE GLICOL', 'L', '1'),
('WG-202308769432', '07/03/2023', 'Cair', 'BRATACO', 'OLEUM ANISI', 'L', '1'),
('WG-202309762435', '07/03/2023', 'Serbuk', 'RAJAWALI', 'CARBOMER', 'Kg', '1'),
('WG-202310672348', '07/03/2023', 'Serbuk', 'RAJAWALI', 'CAFFEIN ANHYDROUS', 'Gr', '500'),
('WG-202313029478', '07/03/2023', 'Serbuk', 'RAJAWALI', 'AMINOPHYLLINE ANHYDROUS', 'Gr', '500'),
('WG-202314092653', '07/03/2023', 'Serbuk', 'BRATACO', 'POWDER GOM ARAB (PGA)', 'Gr', '2500'),
('WG-202315647208', '11/02/2023', 'Cair', 'BIOMEDIKA', 'REAGENKIT ASAM URAT', 'Ml', '100'),
('WG-202321657439', '07/03/2023', 'Serbuk', 'RAJAWALI', 'ACETOSAL (ACIDUM ACETIL SALYCILICUM)', 'Kg', '1'),
('WG-202321794038', '07/03/2023', 'Cair', 'BRATACO', 'BENZALKONIUM CHLORIDE 80', 'L', '1'),
('WG-202323519478', '07/03/2023', 'Semi Solid', 'BRATACO', 'WHITE VASELINE', 'Kg', '3'),
('WG-202325360497', '07/03/2023', 'Cair', 'RAJAWALI', 'SOLUTIO AMMONIAE SPIRITUOSA ANISATA (SASA)', 'L', '1'),
('WG-202329306158', '02/01/2023', 'Cair', 'BRATACO', 'ALKOHOL 96%', 'Mg', '10'),
('WG-202329360571', '07/03/2023', 'Cair', 'BRATACO', 'PEG 400', 'L', '4'),
('WG-202329603875', '07/03/2023', 'Cair', 'BRATACO', 'METHYL SALISILAT (GANDAPURA)', 'L', '1'),
('WG-202330864571', '07/03/2023', 'Cair', 'BRATACO', 'H2O2 3% (HYDROGEN PIROXIDE)', 'L', '2'),
('WG-202332579601', '02/01/2023', 'Crystal', 'BRATACO ', 'MENTHOL', 'g', '800'),
('WG-202335019824', '07/03/2023', 'Serbuk', 'RAJAWALI', 'CALCIUM SULFATE', 'Kg', '1'),
('WG-202337459082', '04/01/2023', 'Cair', 'BRATACO', 'GLYCERIN', 'Liter', '10'),
('WG-202337486519', '07/03/2023', 'Serbuk', 'BRATACO', 'DEXTROSE (GLUKOSA)', 'Mg', '3'),
('WG-202337548216', '07/03/2023', 'Cair', 'BRATACO', 'MINYAK SEREH (OLEUM CITRONELLA)', 'L', '2'),
('WG-202338605241', '07/03/2023', 'Cair', 'BRATACO', 'OLEUM CACAO', 'L', '2'),
('WG-202339814057', '07/03/2023', 'Cair', 'BRATACO', 'PARAFIN CAIR', 'L', '3'),
('WG-202343712056', '07/03/2023', 'Serbuk', 'RAJAWALI', 'ANTALGIN', 'Kg', '3'),
('WG-202343789105', '07/03/2023', 'Serbuk', 'RAJAWALI', 'ACID CITRIC', 'Mg', '2'),
('WG-202350478126', '07/03/2023', 'Cair', 'BRATACO', 'TWEEN 80', 'L', '3'),
('WG-202351923408', '07/03/2023', 'Semi Solid', 'BRATACO', 'YELLOW VASELINE', 'Kg', '5'),
('WG-202356143082', '07/03/2023', 'Cair', 'RAJAWALI', 'OLEUM OLIVARUM (OLIVE OIL)', 'L', '1'),
('WG-202356238074', '07/03/2023', 'Semi Solid', 'RAJAWALI', 'TEXAPON', 'Kg', '1'),
('WG-202356479281', '07/03/2023', 'Serbuk', 'RAJAWALI', 'PULVIS GUMMOSUS (PGS)', 'Gr', '2500'),
('WG-202357649230', '07/03/2023', 'Serbuk', 'RAJAWALI', 'MgSO4 (GARAM INGGRIS)', 'Kg', '1'),
('WG-202358479360', '11/02/2023', 'Cair', 'BIOMEDIKA', 'REAGENKIT GLUCOSA', 'ml', '100'),
('WG-202360529347', '20/02/2023', 'Cair', 'BRATACO', 'AQUADEST', 'CAN', '4'),
('WG-202361528490', '07/03/2023', 'Solid', 'RAJAWALI', 'PARAFIN SOLID', 'Kg', '3'),
('WG-202363982457', '07/03/2023', 'Serbuk', 'RAJAWALI', 'RESORCINOL', 'Gr', '250'),
('WG-202364358927', '07/03/2023', 'Serbuk', 'RAJAWALI', 'ASAM STEARAT', 'Kg', '1'),
('WG-202365249031', '07/03/2023', 'Cair', 'BRATACO', 'WHITE OIL', 'L', '3'),
('WG-202367348210', '07/03/2023', 'Serbuk', 'BRATACO', 'LACTOSA (SACHARUM LACTIS)', 'Mg', '4'),
('WG-202367391508', '07/03/2023', 'Semi Solid', 'BRATACO', 'LANOLIN ANHYDROUS', 'Kg', '3'),
('WG-202371623945', '07/03/2023', 'Serbuk', 'RAJAWALI', 'SUCCUS POWDER', 'Kg', '2'),
('WG-202371923865', '07/03/2023', 'Cair', 'RAJAWALI', 'METHANOL', 'L', '10'),
('WG-202372193406', '07/03/2023', 'Cair', 'RAJAWALI', 'H2O2 50% (HYDROGEN PIROXIDE)', 'L', '3'),
('WG-202373814096', '07/03/2023', 'Serbuk', 'RAJAWALI', 'METHYL PARABEN (NIPAGIN)', 'Kg', '2'),
('WG-202374193860', '07/03/2023', 'Serbuk', 'RAJAWALI', 'BORAX', 'Gr', '500'),
('WG-202374823596', '07/03/2023', 'Cair', 'BRATACO', 'OLEUM RICCINI', 'L', '5'),
('WG-202379480632', '07/03/2023', 'Semi Solid', 'RAJAWALI', 'CREAM BASE O/W (EMULGADE CREAM)', 'Kg', '3'),
('WG-202380236419', '07/03/2023', 'Crystal', 'RAJAWALI', 'CERA ALBA', 'Kg', '1'),
('WG-202382610749', '07/03/2023', 'Serbuk', 'RAJAWALI', 'ICHTIYOL', 'Gr', '250'),
('WG-202383257490', '07/03/2023', 'Serbuk', 'BRATACO', 'ZINC OXIDE', 'Kg', '3'),
('WG-202384392015', '07/03/2023', 'Cair', 'BRATACO', 'LEVERTRAAN (MINYAK IKAN)', 'L', '3'),
('WG-202384702935', '07/03/2023', 'Serbuk', 'RAJAWALI', 'BOLUS ALBA', 'Kg', '3'),
('WG-202386547930', '07/03/2023', 'Cair', 'BRATACO', 'IODINE', 'L', '4'),
('WG-202387941325', '07/03/2023', 'Serbuk', 'RAJAWALI', 'SACHAROSE (SUKROSA)', 'Kg', '2'),
('WG-202389560274', '07/03/2023', 'Solid', 'RAJAWALI', 'CHAMPORA', 'Kg', '3'),
('WG-202390162783', '07/03/2023', 'Solid', 'RAJAWALI', 'TAWAS BENING', 'Kg', '1'),
('WG-202391356802', '07/03/2023', 'Crystal', 'RAJAWALI', 'CETHYL ALCOHOL', 'Kg', '1'),
('WG-202392148670', '07/03/2023', 'Crystal', 'RAJAWALI', 'CARBON AKTIF', 'Kg', '1'),
('WG-202393240568', '11/02/2023', 'Cair', 'BIOMEDIKA', 'REAGENKIT KOLESTROL', 'ml', '100'),
('WG-202396014387', '07/03/2023', 'Cair', 'BRATACO', 'OIL MENTHAE PIP 80', 'L', '2'),
('WG-202398021346', '07/03/2023', 'Cair', 'BRATACO', 'N-HEXAN', 'L', '1'),
('WG-202398261374', '05/01/2023', 'Cair', 'BRATACO', 'EXTRACT THYMI', 'Liter', '4');

-- --------------------------------------------------------

--
-- Table structure for table `tb_satuan`
--

CREATE TABLE `tb_satuan` (
  `id_satuan` int(11) NOT NULL,
  `kode_satuan` varchar(100) NOT NULL,
  `nama_satuan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_satuan`
--

INSERT INTO `tb_satuan` (`id_satuan`, `kode_satuan`, `nama_satuan`) VALUES
(1, 'Mg', 'Miligram'),
(2, 'Ml', 'Mililiter'),
(5, 'Gr', 'Gram'),
(6, 'L', 'Liter'),
(8, 'CAN (Jirigen)', 'CAN (Jirigen)'),
(9, 'Kg', 'Kilogram');

-- --------------------------------------------------------

--
-- Table structure for table `tb_upload_gambar_user`
--

CREATE TABLE `tb_upload_gambar_user` (
  `id` int(11) NOT NULL,
  `username_user` varchar(100) NOT NULL,
  `nama_file` varchar(220) NOT NULL,
  `ukuran_file` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_upload_gambar_user`
--

INSERT INTO `tb_upload_gambar_user` (`id`, `username_user`, `nama_file`, `ukuran_file`) VALUES
(1, 'zahidin', 'nopic5.png', '6.33'),
(2, 'test', 'nopic4.png', '6.33'),
(3, 'laboran', 'AKFAR1.png', '234.54'),
(4, 'admin', 'akfar.jpg', '15.1'),
(5, 'User1', 'nopic2.png', '6.33');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(12) NOT NULL,
  `username` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 0,
  `last_login` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `role`, `last_login`) VALUES
(20, 'admin', 'admin@gmail.com', '$2y$10$dUfdCBeUUylj49JL6Ua2quywgTKr5QGXi0MOCgJIrcuZR4hV/kpZ.', 1, '20-03-2023 13:49'),
(22, 'laboran', 'lab.msms@gmail.com', '$2y$10$J8gjWKWu7gDOh7VIQk/BQuCfCzF9WTMeKtKTMmIcQ6YcQ8/MRsYCy', 1, '17-03-2023 8:54'),
(23, 'User1', 'oyik792@gmail.com', '$2y$10$6JMH5KWtDrOecWWsL34/0eSZUitMKw7T3780QE4pGzwZ6onAk1tre', 0, '14-03-2023 9:55');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_alatnonperaga_keluar`
--
ALTER TABLE `tb_alatnonperaga_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_alatnonperaga_kembali`
--
ALTER TABLE `tb_alatnonperaga_kembali`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_alatperaga_keluar`
--
ALTER TABLE `tb_alatperaga_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_alatperaga_kembali`
--
ALTER TABLE `tb_alatperaga_kembali`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_alat_nonperaga`
--
ALTER TABLE `tb_alat_nonperaga`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `tb_alat_peraga`
--
ALTER TABLE `tb_alat_peraga`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `tb_barang_keluar`
--
ALTER TABLE `tb_barang_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_barang_masuk`
--
ALTER TABLE `tb_barang_masuk`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `tb_satuan`
--
ALTER TABLE `tb_satuan`
  ADD PRIMARY KEY (`id_satuan`);

--
-- Indexes for table `tb_upload_gambar_user`
--
ALTER TABLE `tb_upload_gambar_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_alatnonperaga_keluar`
--
ALTER TABLE `tb_alatnonperaga_keluar`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `tb_alatnonperaga_kembali`
--
ALTER TABLE `tb_alatnonperaga_kembali`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tb_alatperaga_keluar`
--
ALTER TABLE `tb_alatperaga_keluar`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tb_alatperaga_kembali`
--
ALTER TABLE `tb_alatperaga_kembali`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tb_barang_keluar`
--
ALTER TABLE `tb_barang_keluar`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tb_satuan`
--
ALTER TABLE `tb_satuan`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_upload_gambar_user`
--
ALTER TABLE `tb_upload_gambar_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
