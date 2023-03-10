-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2023 at 01:54 AM
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
-- Database: `inv`
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
  `jumlah` varchar(10) NOT NULL,
  `tanggal_kembali` varchar(20) NOT NULL,
  `sdh_kembali` enum('sudah','belum') NOT NULL DEFAULT 'belum'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_alatnonperaga_keluar`
--

INSERT INTO `tb_alatnonperaga_keluar` (`id`, `id_transaksi`, `tanggal_masuk`, `tanggal_keluar`, `jenis`, `satuan`, `nama_alat`, `merk`, `kondisi`, `pj`, `nim`, `hp`, `jumlah`, `tanggal_kembali`, `sdh_kembali`) VALUES
(22, 'ANP-202386453290', '08/03/2023', '08/03/2023', 'Besi', '', 'meja', 'bjb', 'rusak', 'bejo', '090', '09090', '1', '17/03/2023', 'belum');

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
  `jumlah` varchar(10) NOT NULL,
  `tanggal_kembali` varchar(20) NOT NULL,
  `sdh_kembali` enum('sudah','belum') NOT NULL DEFAULT 'belum'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_alatperaga_keluar`
--

INSERT INTO `tb_alatperaga_keluar` (`id`, `id_transaksi`, `tanggal_masuk`, `tanggal_keluar`, `laboratorium`, `nomor_seri`, `nama_alat`, `merk`, `kondisi`, `pj`, `nim`, `hp`, `jumlah`, `tanggal_kembali`, `sdh_kembali`) VALUES
(18, 'AP-202310943827', '08/03/2023', '08/03/2023', 'Simulasi Apotek', '1212', 'tas', 'asus', 'rusak', 'bejo', '090', '0987', '10', '09/03/2023', 'belum'),
(19, 'AP-202337861502', '06/03/2023', '08/03/2023', 'Steril', '123456', 'kassa', 'harmonis', 'rusak', 'bejo', '090', '09', '17', '09/03/2023', 'belum'),
(20, 'AP-202337861502', '06/03/2023', '09/03/2023', 'Steril', '123456', 'kassa', 'asus', 'rusak', 'Bambang Setiawan', '090/118/200.345', '085334927276', '1', '11/03/2023', 'belum'),
(21, 'AP-202310943827', '08/03/2023', '08/03/2023', 'Simulasi Apotek', '1212', 'tas', 'meja', 'rusak', 'suryadi', '0909090', '089897979', '1', '17/03/2023', 'belum');

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
('ANP-202386453290', '08/03/2023', 'Besi', 'meja', 'Biji', 'Lab. Farmasetika', '11');

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
('AP-202310943827', '08/03/2023', 'Simulasi Apotek', '1212', 'tas', 'Baik', '1'),
('AP-202337861502', '06/03/2023', 'Steril', '123456', 'kassa', 'Baik', '3');

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
(17, 'WG-201871602934', '18/01/2018', '04/03/2023', 'serbuk', '312212331222', 'Kopi Hitam', 'mg', 'habsy', '5');

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
('WG-201871602934', '18/01/2018', 'serbuk', '312212331222', 'Kopi Hitam', 'mg', '85'),
('WG-202318046523', '01/03/2023', 'Cair', '121212', 'sendok', 'mg', '20');

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
(1, 'mg', 'mg'),
(2, 'ml', 'ml'),
(5, 'g', 'g'),
(6, 'L', 'L');

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
(3, 'laboran', 'akfar.jpg', '16.69'),
(4, 'admin', 'akfar.jpg', '15.1');

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
(20, 'admin', 'admin@gmail.com', '$2y$10$3HNkMOtwX8X88Xb3DIveYuhXScTnJ9m16/rPDF1/VTa/VTisxVZ4i', 1, '10-03-2023 0:05'),
(22, 'laboran', 'lab.msms@gmail.com', '$2y$10$J8gjWKWu7gDOh7VIQk/BQuCfCzF9WTMeKtKTMmIcQ6YcQ8/MRsYCy', 1, '08-03-2023 10:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_alatnonperaga_keluar`
--
ALTER TABLE `tb_alatnonperaga_keluar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_alatperaga_keluar`
--
ALTER TABLE `tb_alatperaga_keluar`
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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tb_alatperaga_keluar`
--
ALTER TABLE `tb_alatperaga_keluar`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tb_barang_keluar`
--
ALTER TABLE `tb_barang_keluar`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tb_satuan`
--
ALTER TABLE `tb_satuan`
  MODIFY `id_satuan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_upload_gambar_user`
--
ALTER TABLE `tb_upload_gambar_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
