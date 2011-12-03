-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 03, 2011 at 03:14 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `futureshop`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `futureshop` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `futureshop`;

-- --------------------------------------------------------

--
-- Table structure for table `binhluan`
--

DROP TABLE IF EXISTS `binhluan`;
CREATE TABLE IF NOT EXISTS `binhluan` (
  `MaBinhLuan` int(11) NOT NULL AUTO_INCREMENT,
  `MaSanPham` int(11) DEFAULT NULL,
  `MaKhachHang` int(11) DEFAULT NULL,
  `ThoiGian` datetime DEFAULT NULL,
  `NoiDung` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaBinhLuan`),
  KEY `FK_BinhLuan_SanPham` (`MaSanPham`),
  KEY `FK_BinhLuan_KhacHang` (`MaKhachHang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `binhluan`
--

INSERT INTO `binhluan` (`MaBinhLuan`, `MaSanPham`, `MaKhachHang`, `ThoiGian`, `NoiDung`) VALUES
(1, 1, 1, '2011-01-01 00:00:00', 'best product!'),
(2, 1, 2, '2011-01-01 00:00:00', 'i want buy it');

-- --------------------------------------------------------

--
-- Table structure for table `chitietdondathang`
--

DROP TABLE IF EXISTS `chitietdondathang`;
CREATE TABLE IF NOT EXISTS `chitietdondathang` (
  `MaChiTietDonDatHang` int(11) NOT NULL AUTO_INCREMENT,
  `MaDonDatHang` int(11) DEFAULT NULL,
  `MaSanPham` int(11) DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `DonGia` float DEFAULT NULL,
  `MaTinhTrang` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaChiTietDonDatHang`),
  KEY `FK_CHITIETDONDATHANG_DONDATHANG` (`MaDonDatHang`),
  KEY `FK_CHITIETDONDATHANG_SANPHAM` (`MaSanPham`),
  KEY `FK_CHITIETDONDATHANG_TINHTRANG` (`MaTinhTrang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `chitietdondathang`
--


-- --------------------------------------------------------

--
-- Table structure for table `dondathang`
--

DROP TABLE IF EXISTS `dondathang`;
CREATE TABLE IF NOT EXISTS `dondathang` (
  `MaDonDatHang` int(11) NOT NULL AUTO_INCREMENT,
  `NgayDatHang` datetime DEFAULT NULL,
  `MaKhachHang` int(11) DEFAULT NULL,
  `MaTinhTrangDonDatHang` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaDonDatHang`),
  KEY `FK_DONDATHANG_KHACHHANG` (`MaKhachHang`),
  KEY `FK_DONDATHANG_TINHTRANGDONDATHANG` (`MaTinhTrangDonDatHang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dondathang`
--


-- --------------------------------------------------------

--
-- Table structure for table `hangsanxuat`
--

DROP TABLE IF EXISTS `hangsanxuat`;
CREATE TABLE IF NOT EXISTS `hangsanxuat` (
  `MaHangSanXuat` int(11) NOT NULL AUTO_INCREMENT,
  `TenHangSanXuat` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UuTien` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`MaHangSanXuat`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `hangsanxuat`
--

INSERT INTO `hangsanxuat` (`MaHangSanXuat`, `TenHangSanXuat`, `UuTien`) VALUES
(1, 'HP', 1),
(2, 'SONY', 1),
(3, 'APPLE', 1),
(4, 'LEXAR', 2);

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
CREATE TABLE IF NOT EXISTS `khachhang` (
  `MaKhachHang` int(11) NOT NULL AUTO_INCREMENT,
  `TenDangNhap` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MatKhau` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HoTen` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GioiTinh` tinyint(1) DEFAULT NULL,
  `Email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SoDienThoai` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NgaySinh` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DiaChi` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaLoaiKhach` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaKhachHang`),
  KEY `FK_KHACHHANG_LOAIKHACHHANG` (`MaLoaiKhach`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`MaKhachHang`, `TenDangNhap`, `MatKhau`, `HoTen`, `GioiTinh`, `Email`, `NgaySinh`, `DiaChi`, `MaLoaiKhach`) VALUES
(1, 'admin', '123', 'Tran Van Tri', 1, 'trantri2006@gmail.com', '1990-12-2', 'bentre', 1),
(2, 'trantri', '123', 'tran van tri', 1, 'trantri06@yahoo.com', '1990-12-2', 'hcm', 2);

-- --------------------------------------------------------

--
-- Table structure for table `loaikhachhang`
--

DROP TABLE IF EXISTS `loaikhachhang`;
CREATE TABLE IF NOT EXISTS `loaikhachhang` (
  `MaLoaiKhachHang` int(11) NOT NULL AUTO_INCREMENT,
  `TenLoaiKhachHang` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaLoaiKhachHang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `loaikhachhang`
--

INSERT INTO `loaikhachhang` (`MaLoaiKhachHang`, `TenLoaiKhachHang`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `loaisanpham`
--

DROP TABLE IF EXISTS `loaisanpham`;
CREATE TABLE IF NOT EXISTS `loaisanpham` (
  `MaLoaiSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `TenLoaiSanPham` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaTinhTrang` int(11) DEFAULT NULL,
  `NgayCongBo` datetime DEFAULT NULL,
  `MaNhomSanPham` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaLoaiSanPham`),
  KEY `FK_LoaiMatHang_TinhTrang` (`MaTinhTrang`),
  KEY `FK_LOAIMATHANG_NHOMSANPHAM` (`MaNhomSanPham`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=23 ;

--
-- Dumping data for table `loaisanpham`
--

INSERT INTO `loaisanpham` (`MaLoaiSanPham`, `TenLoaiSanPham`, `MaTinhTrang`, `NgayCongBo`, `MaNhomSanPham`) VALUES
(1, 'iPad, Tablets & eReaders', 1, '2011-01-01 00:00:00', 1),
(2, 'Computers', 1, '2011-01-01 00:00:00', 1),
(3, 'Drivers & Storage', 1, '2011-01-01 00:00:00', 1),
(4, 'Software', 1, '2011-01-01 00:00:00', 1),
(5, 'TV & Video', 1, '2011-01-01 00:00:00', 2),
(6, 'Audio', 1, '2011-01-01 00:00:00', 2),
(7, 'Home Theatre Accessories', 1, '2011-01-01 00:00:00', 2),
(8, 'Photo', 1, '2011-01-01 00:00:00', 3),
(9, 'Video', 1, '2011-01-01 00:00:00', 3),
(10, 'Camera & Camcorder Accessories', 1, '2011-01-01 00:00:00', 3),
(11, 'XboX 36', 1, '2011-01-01 00:00:00', 4),
(12, 'PlayStation 3', 1, '2011-01-01 00:00:00', 4),
(13, 'PC Gaming', 1, '2011-01-01 00:00:00', 4),
(14, 'CellPhones', 1, '2011-01-01 00:00:00', 5),
(15, 'Shop by Cariers', 1, '2011-01-01 00:00:00', 5),
(16, 'Home Phones', 1, '2011-01-01 00:00:00', 5),
(17, 'iPod & MP3 Players', 1, '2011-01-01 00:00:00', 6),
(18, 'iPod & MP3 Accessories', 1, '2011-01-01 00:00:00', 6),
(19, 'Headphones & iPod Speaker Docks', 1, '2011-01-01 00:00:00', 6),
(20, 'GPS & Accessories', 1, '2011-01-01 00:00:00', 7),
(21, 'Car Audio & Video', 1, '2011-01-01 00:00:00', 7),
(22, 'Car Starters & Car Alarms', 1, '2011-01-01 00:00:00', 7);

-- --------------------------------------------------------

--
-- Table structure for table `nhomsanpham`
--

DROP TABLE IF EXISTS `nhomsanpham`;
CREATE TABLE IF NOT EXISTS `nhomsanpham` (
  `MaNhomSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `TenNhomSanPham` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaTinhTrang` int(11) DEFAULT NULL,
  `NgayCongBo` datetime DEFAULT NULL,
  PRIMARY KEY (`MaNhomSanPham`),
  KEY `FK_NHOMSANPHAM_TINHTRANG` (`MaTinhTrang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `nhomsanpham`
--

INSERT INTO `nhomsanpham` (`MaNhomSanPham`, `TenNhomSanPham`, `MaTinhTrang`, `NgayCongBo`) VALUES
(1, 'Computer & Software', 1, '2011-01-01 00:00:00'),
(2, 'TV & Home Theatre', 1, '2011-01-01 00:00:00'),
(3, 'Cameras & Camcorders ', 1, '2011-01-01 00:00:00'),
(4, 'Gaming', 1, '2011-01-01 00:00:00'),
(5, 'Cell Phone', 1, '2011-01-01 00:00:00'),
(6, 'iPod & MP3 Players', 1, '2011-01-01 00:00:00'),
(7, 'GPS, Car & Marine Electronic', 1, '2011-01-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
CREATE TABLE IF NOT EXISTS `sanpham` (
  `MaSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `TenSanPham` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GiaGoc` float DEFAULT NULL,
  `GiamGia` float DEFAULT NULL,
  `DanhGia` int(11) DEFAULT NULL,
  `NgayHetHan` date DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `MaTinhTrang` int(11) DEFAULT NULL,
  `MoTa` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ThongTinChiTiet` varchar(20000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaLoaiSanPham` int(11) DEFAULT NULL,
  `MaHangSanXuat` int(11) DEFAULT NULL,
  `SoHinhAnh` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaSanPham`),
  KEY `FK_SANPHAM_TINHTRANG` (`MaTinhTrang`),
  KEY `FK_SANPHAM_LOAISANPHAM` (`MaLoaiSanPham`),
  KEY `FK_SANPHAM_HANGSANXUAT` (`MaHangSanXuat`),
  KEY `FK_SANPHAM_HINHANH` (`SoHinhAnh`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`MaSanPham`, `TenSanPham`, `GiaGoc`, `GiamGia`, `DanhGia`, `NgayHetHan`, `SoLuong`, `MaTinhTrang`, `MoTa`, `ThongTinChiTiet`, `MaLoaiSanPham`, `MaHangSanXuat`, `SoHinhAnh`) VALUES
(1, 'HP 15.6" AMD Dual Core C-50 Laptop (2000-224CA) - Charcoal Grey', 349.99, 2.99, 3, '2011-01-01', 100, 1, 'Designed to deliver all the performance you need at home and on the go, this HP 2000 laptop comes complete with VISION Technology from AMD with an AMD Dual-Core Processor C-50, 3GB system memory and 320GB hard drive. It also features a low-energy 15.6-inch LED-backlit display for amazing HD visuals.', '<p>Designed to deliver all the performance you need at home   and on the go, this HP 2000 laptop comes complete with VISION   Technology from AMD with an AMD Dual-Core Processor C-50, 3GB system   memory and 320GB hard drive. It also features a low-energy 15.6-inch   LED-backlit display for amazing HD visuals.</p>', 1, 1, 3),
(2, 'Lexar JumpDrive V10 8GB USB Drive ', 14.99, 5, 4, '2011-12-31', 100, 1, 'The Lexar JumpDrive V10 USB flash drive provides convenient, reliable portable storage for life on the go. This Hi-Speed USB drive with protective cap provides an excellent solution for safely storing, transferring, and sharing your valuable files, photos, videos, and more.', 'Plug-and-Play Designs with Great Features and Stylish Colour Options.', 3, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tinhtrang`
--

DROP TABLE IF EXISTS `tinhtrang`;
CREATE TABLE IF NOT EXISTS `tinhtrang` (
  `MaTinhTrang` int(11) NOT NULL AUTO_INCREMENT,
  `TenTinhTrang` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaTinhTrang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tinhtrang`
--

INSERT INTO `tinhtrang` (`MaTinhTrang`, `TenTinhTrang`) VALUES
(1, 'Exist'),
(2, 'Deleted');

-- --------------------------------------------------------

--
-- Table structure for table `tinhtrangdondathang`
--

DROP TABLE IF EXISTS `tinhtrangdondathang`;
CREATE TABLE IF NOT EXISTS `tinhtrangdondathang` (
  `MaTinhTrangDonDatHang` int(11) NOT NULL,
  `TenTinhTrangDonDatHang` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaTinhTrangDonDatHang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tinhtrangdondathang`
--


--
-- Constraints for dumped tables
--

--
-- Constraints for table `binhluan`
--
ALTER TABLE `binhluan`
  ADD CONSTRAINT `FK_BinhLuan_KhacHang` FOREIGN KEY (`MaKhachHang`) REFERENCES `khachhang` (`MaKhachHang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_BinhLuan_SanPham` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `chitietdondathang`
--
ALTER TABLE `chitietdondathang`
  ADD CONSTRAINT `FK_CHITIETDONDATHANG_DONDATHANG` FOREIGN KEY (`MaDonDatHang`) REFERENCES `dondathang` (`MaDonDatHang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_CHITIETDONDATHANG_SANPHAM` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_CHITIETDONDATHANG_TINHTRANG` FOREIGN KEY (`MaTinhTrang`) REFERENCES `tinhtrang` (`MaTinhTrang`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dondathang`
--
ALTER TABLE `dondathang`
  ADD CONSTRAINT `FK_DONDATHANG_KHACHHANG` FOREIGN KEY (`MaKhachHang`) REFERENCES `khachhang` (`MaKhachHang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_DONDATHANG_TINHTRANGDONDATHANG` FOREIGN KEY (`MaTinhTrangDonDatHang`) REFERENCES `tinhtrangdondathang` (`MaTinhTrangDonDatHang`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD CONSTRAINT `FK_KHACHHANG_LOAIKHACHHANG` FOREIGN KEY (`MaLoaiKhach`) REFERENCES `loaikhachhang` (`MaLoaiKhachHang`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD CONSTRAINT `FK_LOAIMATHANG_NHOMSANPHAM` FOREIGN KEY (`MaNhomSanPham`) REFERENCES `nhomsanpham` (`MaNhomSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_LoaiMatHang_TinhTrang` FOREIGN KEY (`MaTinhTrang`) REFERENCES `tinhtrang` (`MaTinhTrang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nhomsanpham`
--
ALTER TABLE `nhomsanpham`
  ADD CONSTRAINT `FK_NHOMSANPHAM_TINHTRANG` FOREIGN KEY (`MaTinhTrang`) REFERENCES `tinhtrang` (`MaTinhTrang`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `FK_SANPHAM_HANGSANXUAT` FOREIGN KEY (`MaHangSanXuat`) REFERENCES `hangsanxuat` (`MaHangSanXuat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SANPHAM_LOAISANPHAM` FOREIGN KEY (`MaLoaiSanPham`) REFERENCES `loaisanpham` (`MaLoaiSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SANPHAM_TINHTRANG` FOREIGN KEY (`MaTinhTrang`) REFERENCES `tinhtrang` (`MaTinhTrang`) ON DELETE NO ACTION ON UPDATE NO ACTION;
