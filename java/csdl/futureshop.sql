<<<<<<< .mine
-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 22, 2011 at 04:49 AM
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

-- --------------------------------------------------------

--
-- Table structure for table `chitietdondathang`
--

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

CREATE TABLE IF NOT EXISTS `hangsanxuat` (
  `MaHangSanXuat` int(11) NOT NULL AUTO_INCREMENT,
  `TenHangSanXuat` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaHangSanXuat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `hangsanxuat`
--


-- --------------------------------------------------------

--
-- Table structure for table `hinhanh`
--

CREATE TABLE IF NOT EXISTS `hinhanh` (
  `MaHinhAnh` int(11) NOT NULL AUTO_INCREMENT,
  `AnhNho` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AnhTo1` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AnhTo2` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AnhTo3` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AnhTo4` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaHinhAnh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `hinhanh`
--


-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE IF NOT EXISTS `khachhang` (
  `MaKhachHang` int(11) NOT NULL AUTO_INCREMENT,
  `TenDangNhap` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MatKhau` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HoTen` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GioiTinh` tinyint(1) DEFAULT NULL,
  `Email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NgaySinh` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DiaChi` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaLoaiKhach` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaKhachHang`),
  KEY `FK_KHACHHANG_LOAIKHACHHANG` (`MaLoaiKhach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `khachhang`
--


-- --------------------------------------------------------

--
-- Table structure for table `loaikhachhang`
--

CREATE TABLE IF NOT EXISTS `loaikhachhang` (
  `MaLoaiKhachHang` int(11) NOT NULL AUTO_INCREMENT,
  `TenLoaiKhachHang` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaLoaiKhachHang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `loaikhachhang`
--


-- --------------------------------------------------------

--
-- Table structure for table `loaisanpham`
--

CREATE TABLE IF NOT EXISTS `loaisanpham` (
  `MaLoaiSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `TenLoaiSanPham` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaTinhTrang` int(11) DEFAULT NULL,
  `NgayCongBo` datetime DEFAULT NULL,
  `MaNhomSanPham` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaLoaiSanPham`),
  KEY `FK_LoaiMatHang_TinhTrang` (`MaTinhTrang`),
  KEY `FK_LOAIMATHANG_NHOMSANPHAM` (`MaNhomSanPham`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `loaisanpham`
--


-- --------------------------------------------------------

--
-- Table structure for table `nhomsanpham`
--

CREATE TABLE IF NOT EXISTS `nhomsanpham` (
  `MaNhomSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `TenNhomSanPham` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaTinhTrang` int(11) DEFAULT NULL,
  `NgayCongBo` datetime DEFAULT NULL,
  PRIMARY KEY (`MaNhomSanPham`),
  KEY `FK_NHOMSANPHAM_TINHTRANG` (`MaTinhTrang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `nhomsanpham`
--


-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE IF NOT EXISTS `sanpham` (
  `MaSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `TenSanPham` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GiaGoc` float DEFAULT NULL,
  `GiamGia` float DEFAULT NULL,
  `DanhGia` int(11) DEFAULT NULL,
  `NgayHetHan` datetime DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `MaTinhTrang` int(11) DEFAULT NULL,
  `MoTa` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ThongTinChiTiet` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaLoaiSanPham` int(11) DEFAULT NULL,
  `MaHangSanXuat` int(11) DEFAULT NULL,
  `MaHinhAnh` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaSanPham`),
  KEY `FK_SANPHAM_TINHTRANG` (`MaTinhTrang`),
  KEY `FK_SANPHAM_LOAISANPHAM` (`MaLoaiSanPham`),
  KEY `FK_SANPHAM_HANGSANXUAT` (`MaHangSanXuat`),
  KEY `FK_SANPHAM_HINHANH` (`MaHinhAnh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sanpham`
--


-- --------------------------------------------------------

--
-- Table structure for table `tinhtrang`
--

CREATE TABLE IF NOT EXISTS `tinhtrang` (
  `MaTinhTrang` int(11) NOT NULL AUTO_INCREMENT,
  `TenTinhTrang` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaTinhTrang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tinhtrang`
--


-- --------------------------------------------------------

--
-- Table structure for table `tinhtrangdondathang`
--

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
  ADD CONSTRAINT `FK_DONDATHANG_TINHTRANGDONDATHANG` FOREIGN KEY (`MaTinhTrangDonDatHang`) REFERENCES `tinhtrangdondathang` (`MaTinhTrangDonDatHang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_DONDATHANG_KHACHHANG` FOREIGN KEY (`MaKhachHang`) REFERENCES `khachhang` (`MaKhachHang`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `FK_SANPHAM_TINHTRANG` FOREIGN KEY (`MaTinhTrang`) REFERENCES `tinhtrang` (`MaTinhTrang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SANPHAM_LOAISANPHAM` FOREIGN KEY (`MaLoaiSanPham`) REFERENCES `loaisanpham` (`MaLoaiSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SANPHAM_HANGSANXUAT` FOREIGN KEY (`MaHangSanXuat`) REFERENCES `hangsanxuat` (`MaHangSanXuat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SANPHAM_HINHANH` FOREIGN KEY (`MaHinhAnh`) REFERENCES `hinhanh` (`MaHinhAnh`) ON DELETE NO ACTION ON UPDATE NO ACTION;
=======
-- MySQL dump 10.13  Distrib 5.5.9, for Win32 (x86)
--
-- Host: localhost    Database: futureshop
-- ------------------------------------------------------
-- Server version	5.5.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `futureshop`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `futureshop` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `futureshop`;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `khachhang` (
  `MaKhachHang` int(11) NOT NULL AUTO_INCREMENT,
  `TenDangNhap` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MatKhau` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HoTen` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GioiTinh` tinyint(1) DEFAULT NULL,
  `Email` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NgaySinh` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DiaChi` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaLoaiKhach` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaKhachHang`),
  KEY `FK_KhachHang_MaLoaiKhach` (`MaLoaiKhach`),
  CONSTRAINT `FK_KhachHang_MaLoaiKhach` FOREIGN KEY (`MaLoaiKhach`) REFERENCES `loaikhachhang` (`MaLoaiKhachHang`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaikhachhang`
--

DROP TABLE IF EXISTS `loaikhachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loaikhachhang` (
  `MaLoaiKhachHang` int(11) NOT NULL AUTO_INCREMENT,
  `TenLoaiKhachHang` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaLoaiKhachHang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaikhachhang`
--

LOCK TABLES `loaikhachhang` WRITE;
/*!40000 ALTER TABLE `loaikhachhang` DISABLE KEYS */;
/*!40000 ALTER TABLE `loaikhachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaimathang`
--

DROP TABLE IF EXISTS `loaimathang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loaimathang` (
  `MaLoaiMatHang` int(11) NOT NULL AUTO_INCREMENT,
  `TenLoaiMatHang` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaTinhTrang` int(11) DEFAULT NULL,
  `NgayCongBo` datetime DEFAULT NULL,
  PRIMARY KEY (`MaLoaiMatHang`),
  KEY `FK_LoaiMatHang_TinhTrang` (`MaTinhTrang`),
  CONSTRAINT `FK_LoaiMatHang_TinhTrang` FOREIGN KEY (`MaTinhTrang`) REFERENCES `tinhtrang` (`MaTinhTrang`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaimathang`
--

LOCK TABLES `loaimathang` WRITE;
/*!40000 ALTER TABLE `loaimathang` DISABLE KEYS */;
/*!40000 ALTER TABLE `loaimathang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tinhtrang`
--

DROP TABLE IF EXISTS `tinhtrang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tinhtrang` (
  `MaTinhTrang` int(11) NOT NULL AUTO_INCREMENT,
  `TenTinhTrang` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaTinhTrang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinhtrang`
--

LOCK TABLES `tinhtrang` WRITE;
/*!40000 ALTER TABLE `tinhtrang` DISABLE KEYS */;
/*!40000 ALTER TABLE `tinhtrang` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-11-22 11:20:42
>>>>>>> .r101
