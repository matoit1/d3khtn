-- MySQL dump 10.13  Distrib 5.5.15, for Win32 (x86)
--
-- Host: localhost    Database: futureshop
-- ------------------------------------------------------
-- Server version	5.5.8-log

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
-- Table structure for table `binhluan`
--

DROP TABLE IF EXISTS `binhluan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `binhluan` (
  `MaBinhLuan` int(11) NOT NULL AUTO_INCREMENT,
  `MaSanPham` int(11) DEFAULT NULL,
  `MaKhachHang` int(11) DEFAULT NULL,
  `ThoiGian` datetime DEFAULT NULL,
  `NoiDung` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaBinhLuan`),
  KEY `FK_BinhLuan_SanPham` (`MaSanPham`),
  KEY `FK_BinhLuan_KhacHang` (`MaKhachHang`),
  CONSTRAINT `FK_BinhLuan_SanPham` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_BinhLuan_KhacHang` FOREIGN KEY (`MaKhachHang`) REFERENCES `khachhang` (`MaKhachHang`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `binhluan`
--

LOCK TABLES `binhluan` WRITE;
/*!40000 ALTER TABLE `binhluan` DISABLE KEYS */;
/*!40000 ALTER TABLE `binhluan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chitietdondathang`
--

DROP TABLE IF EXISTS `chitietdondathang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chitietdondathang` (
  `MaChiTietDonDatHang` int(11) NOT NULL AUTO_INCREMENT,
  `MaDonDatHang` int(11) DEFAULT NULL,
  `MaSanPham` int(11) DEFAULT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `DonGia` float DEFAULT NULL,
  `MaTinhTrang` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaChiTietDonDatHang`),
  KEY `FK_CHITIETDONDATHANG_DONDATHANG` (`MaDonDatHang`),
  KEY `FK_CHITIETDONDATHANG_SANPHAM` (`MaSanPham`),
  KEY `FK_CHITIETDONDATHANG_TINHTRANG` (`MaTinhTrang`),
  CONSTRAINT `FK_CHITIETDONDATHANG_DONDATHANG` FOREIGN KEY (`MaDonDatHang`) REFERENCES `dondathang` (`MaDonDatHang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CHITIETDONDATHANG_SANPHAM` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CHITIETDONDATHANG_TINHTRANG` FOREIGN KEY (`MaTinhTrang`) REFERENCES `tinhtrang` (`MaTinhTrang`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietdondathang`
--

LOCK TABLES `chitietdondathang` WRITE;
/*!40000 ALTER TABLE `chitietdondathang` DISABLE KEYS */;
/*!40000 ALTER TABLE `chitietdondathang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dondathang`
--

DROP TABLE IF EXISTS `dondathang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dondathang` (
  `MaDonDatHang` int(11) NOT NULL AUTO_INCREMENT,
  `NgayDatHang` datetime DEFAULT NULL,
  `MaKhachHang` int(11) DEFAULT NULL,
  `MaTinhTrangDonDatHang` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaDonDatHang`),
  KEY `FK_DONDATHANG_KHACHHANG` (`MaKhachHang`),
  KEY `FK_DONDATHANG_TINHTRANGDONDATHANG` (`MaTinhTrangDonDatHang`),
  CONSTRAINT `FK_DONDATHANG_KHACHHANG` FOREIGN KEY (`MaKhachHang`) REFERENCES `khachhang` (`MaKhachHang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_DONDATHANG_TINHTRANGDONDATHANG` FOREIGN KEY (`MaTinhTrangDonDatHang`) REFERENCES `tinhtrangdondathang` (`MaTinhTrangDonDatHang`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dondathang`
--

LOCK TABLES `dondathang` WRITE;
/*!40000 ALTER TABLE `dondathang` DISABLE KEYS */;
/*!40000 ALTER TABLE `dondathang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hangsanxuat`
--

DROP TABLE IF EXISTS `hangsanxuat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hangsanxuat` (
  `MaHangSanXuat` int(11) NOT NULL AUTO_INCREMENT,
  `TenHangSanXuat` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaHangSanXuat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hangsanxuat`
--

LOCK TABLES `hangsanxuat` WRITE;
/*!40000 ALTER TABLE `hangsanxuat` DISABLE KEYS */;
/*!40000 ALTER TABLE `hangsanxuat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hinhanh`
--

DROP TABLE IF EXISTS `hinhanh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hinhanh` (
  `MaHinhAnh` int(11) NOT NULL AUTO_INCREMENT,
  `AnhNho` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AnhTo1` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AnhTo2` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AnhTo3` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AnhTo4` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaHinhAnh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hinhanh`
--

LOCK TABLES `hinhanh` WRITE;
/*!40000 ALTER TABLE `hinhanh` DISABLE KEYS */;
/*!40000 ALTER TABLE `hinhanh` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `FK_KHACHHANG_LOAIKHACHHANG` (`MaLoaiKhach`),
  CONSTRAINT `FK_KHACHHANG_LOAIKHACHHANG` FOREIGN KEY (`MaLoaiKhach`) REFERENCES `loaikhachhang` (`MaLoaiKhachHang`) ON DELETE NO ACTION ON UPDATE NO ACTION
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
-- Table structure for table `loaisanpham`
--

DROP TABLE IF EXISTS `loaisanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loaisanpham` (
  `MaLoaiSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `TenLoaiSanPham` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaTinhTrang` int(11) DEFAULT NULL,
  `NgayCongBo` datetime DEFAULT NULL,
  `MaNhomSanPham` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaLoaiSanPham`),
  KEY `FK_LoaiMatHang_TinhTrang` (`MaTinhTrang`),
  KEY `FK_LOAIMATHANG_NHOMSANPHAM` (`MaNhomSanPham`),
  CONSTRAINT `FK_LOAIMATHANG_NHOMSANPHAM` FOREIGN KEY (`MaNhomSanPham`) REFERENCES `nhomsanpham` (`MaNhomSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_LoaiMatHang_TinhTrang` FOREIGN KEY (`MaTinhTrang`) REFERENCES `tinhtrang` (`MaTinhTrang`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaisanpham`
--

LOCK TABLES `loaisanpham` WRITE;
/*!40000 ALTER TABLE `loaisanpham` DISABLE KEYS */;
/*!40000 ALTER TABLE `loaisanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhomsanpham`
--

DROP TABLE IF EXISTS `nhomsanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nhomsanpham` (
  `MaNhomSanPham` int(11) NOT NULL AUTO_INCREMENT,
  `TenNhomSanPham` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaTinhTrang` int(11) DEFAULT NULL,
  `NgayCongBo` datetime DEFAULT NULL,
  PRIMARY KEY (`MaNhomSanPham`),
  KEY `FK_NHOMSANPHAM_TINHTRANG` (`MaTinhTrang`),
  CONSTRAINT `FK_NHOMSANPHAM_TINHTRANG` FOREIGN KEY (`MaTinhTrang`) REFERENCES `tinhtrang` (`MaTinhTrang`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhomsanpham`
--

LOCK TABLES `nhomsanpham` WRITE;
/*!40000 ALTER TABLE `nhomsanpham` DISABLE KEYS */;
/*!40000 ALTER TABLE `nhomsanpham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sanpham` (
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
  KEY `FK_SANPHAM_HINHANH` (`MaHinhAnh`),
  CONSTRAINT `FK_SANPHAM_HANGSANXUAT` FOREIGN KEY (`MaHangSanXuat`) REFERENCES `hangsanxuat` (`MaHangSanXuat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SANPHAM_HINHANH` FOREIGN KEY (`MaHinhAnh`) REFERENCES `hinhanh` (`MaHinhAnh`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SANPHAM_LOAISANPHAM` FOREIGN KEY (`MaLoaiSanPham`) REFERENCES `loaisanpham` (`MaLoaiSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_SANPHAM_TINHTRANG` FOREIGN KEY (`MaTinhTrang`) REFERENCES `tinhtrang` (`MaTinhTrang`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham`
--

LOCK TABLES `sanpham` WRITE;
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
/*!40000 ALTER TABLE `sanpham` ENABLE KEYS */;
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

--
-- Table structure for table `tinhtrangdondathang`
--

DROP TABLE IF EXISTS `tinhtrangdondathang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tinhtrangdondathang` (
  `MaTinhTrangDonDatHang` int(11) NOT NULL,
  `TenTinhTrangDonDatHang` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MaTinhTrangDonDatHang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinhtrangdondathang`
--

LOCK TABLES `tinhtrangdondathang` WRITE;
/*!40000 ALTER TABLE `tinhtrangdondathang` DISABLE KEYS */;
/*!40000 ALTER TABLE `tinhtrangdondathang` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-11-22 12:45:35
