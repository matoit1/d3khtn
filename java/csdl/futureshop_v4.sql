-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 01, 2012 at 04:59 PM
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
  PRIMARY KEY (`MaChiTietDonDatHang`),
  KEY `FK_CHITIETDONDATHANG_DONDATHANG` (`MaDonDatHang`),
  KEY `FK_CHITIETDONDATHANG_SANPHAM` (`MaSanPham`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `chitietdondathang`
--

INSERT INTO `chitietdondathang` (`MaChiTietDonDatHang`, `MaDonDatHang`, `MaSanPham`, `SoLuong`, `DonGia`) VALUES
(1, 1, 2, 2, 19.98),
(2, 1, 1, 1, 347),
(3, 2, 1, 4, 1388),
(4, 2, 2, 1, 9.99),
(5, 3, 1, 3, 1041);

-- --------------------------------------------------------

--
-- Table structure for table `dondathang`
--

DROP TABLE IF EXISTS `dondathang`;
CREATE TABLE IF NOT EXISTS `dondathang` (
  `MaDonDatHang` int(11) NOT NULL AUTO_INCREMENT,
  `NgayDatHang` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaKhachHang` int(11) DEFAULT NULL,
  `MaTinhTrangDonDatHang` int(11) DEFAULT NULL,
  `MaTinhTrang` int(11) DEFAULT NULL,
  `HinhThucMuaHang` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DiaDiemGiaoHang` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TongTien` float DEFAULT NULL,
  PRIMARY KEY (`MaDonDatHang`),
  KEY `FK_DONDATHANG_KHACHHANG` (`MaKhachHang`),
  KEY `FK_DONDATHANG_TINHTRANGDONDATHANG` (`MaTinhTrangDonDatHang`),
  KEY `FK_DONDATHANG_TINHTRANG` (`MaTinhTrang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `dondathang`
--

INSERT INTO `dondathang` (`MaDonDatHang`, `NgayDatHang`, `MaKhachHang`, `MaTinhTrangDonDatHang`, `MaTinhTrang`, `HinhThucMuaHang`, `DiaDiemGiaoHang`, `TongTien`) VALUES
(1, '01/02/2012', 3, 1, 1, 'Pick at store', NULL, 366.98),
(2, '01/02/2012', 3, 1, 1, 'Pick at store', NULL, 1397.99),
(3, '01/03/2012', 3, 1, 1, 'Pick at store', NULL, 1041);

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
(4, 'LEXAR', 2),
(5,'SONY',1),
(6,'TOSHIBA',0),
(7,'INTEL',1);
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`MaKhachHang`, `TenDangNhap`, `MatKhau`, `HoTen`, `GioiTinh`, `Email`, `SoDienThoai`, `NgaySinh`, `DiaChi`, `MaLoaiKhach`) VALUES
(1, 'admin', '44047210810420107506624974438055026627', 'Admin', 0, 'admin@gmail.com', '01234567892', '02/12/1990', 'TP.HCM', 1),
(2, 'trantri', '299132688689127175738334524183350839358', 'Trần Văn Tri', 0, 'trantri06@yahoo.com', '01234567891', '02/12/1990', 'TP.HCM', 2),
(3, 'nguyenanhtri', '299132688689127175738334524183350839358', 'Nguyễn Anh Trí', 0, 'nguyenanhtri@gmail.com', '01696873563', '01/01/1990', 'TP.HCM', 2),
(4, 'nguyenvanviet', '299132688689127175738334524183350839358', 'Nguyễn Văn Việt', 0, 'vietsanto@gmail.com', '01234567890', '01/01/1990', 'TP.HCM', 2),
(5, 'tranvantri', '52779249234519198625752213856508801058', 'Trần Văn Tri', 0, 'trantri2006@gmail.com', '01234567890', '01/01/1990', 'TP.HCM', 2);

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
(1,'HP 15.6\" AMD Dual Core C-50  (2000-224CA) ',349.99,2.99,3,'2011-01-01',100,1,'Designed to deliver all the performance you need at home and on the go, this HP 2000 laptop comes complete with VISION Technology from AMD with an AMD Dual-Core Processor C-50, 3GB system memory and 320GB hard drive. It also features a low-energy 15.6-inch LED-backlit display for amazing HD visuals.','<p>Designed to deliver all the performance you need at home   and on the go, this HP 2000 laptop comes complete with VISION   Technology from AMD with an AMD Dual-Core Processor C-50, 3GB system   memory and 320GB hard drive. It also features a low-energy 15.6-inch   LED-backlit display for amazing HD visuals.</p>',1,1,3),
(2,'Lexar JumpDrive V10 8GB USB Drive ',14.99,5,3,'2011-12-31',100,1,'The Lexar JumpDrive V10 USB flash drive provides convenient, reliable portable storage for life on the go. This Hi-Speed USB drive with protective cap provides an excellent solution for safely storing, transferring, and sharing your valuable files, photos, videos, and more.','Plug-and-Play Designs with Great Features and Stylish Colour Options.',3,4,1),
(3,'Canon T3i 18MP DSLR',1499.99,20,4,'2011-10-01',100,1,'dfgdf','<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\" width=\"200\">\r\n    <tbody>\r\n        <tr>\r\n            <td>sdfsd</td>\r\n            <td>fdsdf</td>\r\n        </tr>\r\n        <tr>\r\n            <td>dfsf</td>\r\n            <td>df</td>\r\n        </tr>\r\n        <tr>\r\n            <td>fsdfsd</td>\r\n            <td>dfsdf</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p>&nbsp;</p>',10,4,4),
(4,'sgfdsddg',111,2,4,'2011-10-01',100,1,'  write here ','<p>write here</p>',1,1,1),
(5,'dffgdgdg',34,3,4,'2011-10-01',100,1,'  write here ','<p>write here</p>',20,4,1),
(6,'mvnvbn',4242,23,4,'2011-10-01',100,1,'  write here ','<p>write here</p>',18,2,1),
(7,'mvnvbn32rs',4242,23,4,'2011-10-01',100,1,'  write here ','<p>write here</p>',18,2,1),
(8,'mvnvbn3243',4242,23,4,'2011-10-01',100,1,'  write here ','<p>write here</p>',18,2,1),
(9,'trsdfsfs',5345,34,4,'2011-10-01',100,1,'  write here ','<p>bhdfhgdgf</p>\r\n<table cellspacing=\"1\" cellpadding=\"1\" border=\"1\" width=\"200\">\r\n    <tbody>\r\n        <tr>\r\n            <td>&nbsp;</td>\r\n            <td>&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;</td>\r\n            <td>&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td>&nbsp;</td>\r\n            <td>&nbsp;</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<p>&nbsp;</p>',13,3,1),
(10,'vfgd',2353,43,4,'2011-10-01',100,1,'  write here ','<p>write here</p>',15,5,1),
(11,'cghgfhrfdge',4242,3,4,'2011-10-01',100,1,'  write here ','<p>write here</p>',3,4,1),
(12,'gfsdgfsd',1499.99,2,4,'2011-10-01',100,1,'  write here ','<p>write here</p>',1,1,1),
(13,'fsdfsdfsdfsf',34,3,5,'2011-10-01',100,1,'  write here ','<p>write here</p>',6,1,1),
(14,'dvfsgsdgaewgeg',3534,353,4,'2011-10-01',100,1,'  write here ','<p>write here</p>',6,3,1),
(15,'lap top ToSHIBA',34,2,5,'2011-10-01',100,1,'  write here ','  write here ',2,2,1),
(16,'Nintendo 3DS - Aqua Blue',56464,435,4,'2011-10-01',100,1,'    write here  ','<p>write here</p>',12,2,1),
(17,'Toshiba 40\" 1080p LCD HDTV (E210U)',429.99,0,4,'2011-10-01',100,1,'  write here ','<p>write here</p>',5,2,2),
(18,'Apple 16GB iPad 2 With Wi-Fi - Black',549.99,21,5,'2011-10-01',100,1,'  Apple 16GB iPad 2 With Wi-Fi - Black ','<div class=\"tabcontentleft\">\r\n<p class=\"text\">The iPad changed the way we use computers, consume  content, and entertain ourselves. The Apple iPad 2 will do it all over  again. Equipped with the all-new A5 chip, front and rear-facing cameras,  gyroscope, a 33%-thinner profile and a plethora of other improvements, it\'s everything you could possibly want in a tablet, and then some.  (Please note: This is the WiFi version)</p>\r\n<p class="text\">&nbsp;</p>\r\n<table cellspacing=\"1\" cellpadding=\"1\" border=\"0\" style=\"width: 307px; height: 373px;\">\r\n    <tbody>\r\n        <tr>\r\n            <td><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl01_LN\"><b>Display</b></span></td>\r\n            <td>&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl02_LN\">Display Type</span></td>\r\n            <td>LCD</td>\r\n        </tr>\r\n        <tr>\r\n            <td><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl03_LN\">Screen Size</span></td>\r\n            <td>9.7 Inches</td>\r\n        </tr>\r\n        <tr>\r\n            <td><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl04_LN\">Native Screen Resolution</span></td>\r\n            <td>1024 x 768</td>\r\n        </tr>\r\n        <tr>\r\n            <td><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl05_LN\">Touchscreen</span></td>\r\n            <td>Yes</td>\r\n        </tr>\r\n        <tr>\r\n            <td><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl06_LN\">3D Capable Display</span></td>\r\n            <td>No</td>\r\n        </tr>\r\n        <tr>\r\n            <td><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl07_LN\">Screen Finish</span></td>\r\n            <td>Glossy</td>\r\n        </tr>\r\n        <tr>\r\n            <td><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl08_LN\"><b>Storage</b></span></td>\r\n            <td>&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl09_LN\">Built-in Storage Capacity</span></td>\r\n            <td>16 GB</td>\r\n        </tr>\r\n        <tr>\r\n            <td><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl10_LN\">Built-in Storage Type</span></td>\r\n            <td>Flash Memory</td>\r\n        </tr>\r\n        <tr>\r\n            <td><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl11_LN\">Built-in Memory Card Reader</span></td>\r\n            <td>No</td>\r\n        </tr>\r\n        <tr>\r\n            <td><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl12_LN\">Compatible Memory Card Types</span></td>\r\n            <td>Not Applicable</td>\r\n        </tr>\r\n        <tr>\r\n            <td><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl13_LN\">Max Memory Card Capacity</span></td>\r\n            <td>Not Applicable</td>\r\n        </tr>\r\n        <tr>\r\n            <td><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl14_LN\">RAM Size</span></td>\r\n            <td>512 MB</td>\r\n        </tr>\r\n        <tr>\r\n            <td><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl15_LN\"><b>Cameras</b></span></td>\r\n            <td>&nbsp;</td>\r\n        </tr>\r\n        <tr>\r\n            <td><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl16_LN\">Rear Camera Still Resolution</span></td>\r\n            <td>0.7 MP</td>\r\n        </tr>\r\n        <tr>\r\n            <td><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl17_LN\">Rear Camera Video Resolution</span></td>\r\n            <td>960 x 720 @ 30 fps</td>\r\n        </tr>\r\n        <tr>\r\n            <td><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl18_LN\">Rear Camera Autofocus</span></td>\r\n            <td>No</td>\r\n        </tr>\r\n        <tr>\r\n            <td><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl19_LN\">Front Camera Still Resolution</span></td>\r\n            <td>0.3 MP</td>\r\n        </tr>\r\n        <tr>\r\n            <td><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl20_LN\">Front Camera Video Resolution</span></td>\r\n            <td>640 x 480 @ 30 fps</td>\r\n        </tr>\r\n        <tr>\r\n            <td><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl21_LN\">Front Camera Autofocus</span></td>\r\n            <td>No</td>\r\n        </tr>\r\n        <tr>\r\n            <td><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl22_LN\">Front Camera Flash</span></td>\r\n            <td>No</td>\r\n        </tr>\r\n        <tr>\r\n            <td><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl23_LN\">Video Calling (WiFi)</span></td>\r\n            <td>Yes</td>\r\n        </tr>\r\n        <tr>\r\n            <td><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl24_LN\">Video Calling (Cellular)</span></td>\r\n            <td>No</td>\r\n        </tr>\r\n    </tbody>\r\n</table>\r\n<br />\r\n<dl class=\"std-list features\">\r\n    <dt class=\"alt\"><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl25_LN\">3D Photos</span>                     </dt>\r\n    <dd class=\"alt\">\r\n    <p>No</p>\r\n    </dd>\r\n    <dt><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl26_LN\">3D Video Recording</span>                     </dt>\r\n    <dd>\r\n    <p>No</p>\r\n    </dd>\r\n    <dt class=\"alt\"><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl27_LN\"><b>Processor</b></span>                     </dt>\r\n    <dd class=\"alt\">\r\n    <p>&nbsp;</p>\r\n    <br />\r\n    </dd>\r\n    <dt><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl28_LN\">Processor Type</span>                     </dt>\r\n    <dd>\r\n    <p>Apple A5</p>\r\n    </dd>\r\n    <dt class=\"alt\"><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl29_LN\">Processor Speed</span>                     </dt>\r\n    <dd class=\"alt\">\r\n    <p>1 GHz</p>\r\n    </dd>\r\n    <dt><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl30_LN\">Processor Cores</span>                     </dt>\r\n    <dd>\r\n    <p>2</p>\r\n    </dd>\r\n    <dt class=\"alt\"><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl31_LN\"><b>Software</b></span>                     </dt>\r\n    <dd class=\"alt\">\r\n    <p>&nbsp;</p>\r\n    <br />\r\n    </dd>\r\n    <dt><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl32_LN\">Operating System</span>                     </dt>\r\n    <dd>\r\n    <p>iOS 4</p>\r\n    </dd>\r\n    <dt class=\"alt\"><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl33_LN\">Operating System Language</span>                     </dt>\r\n    <dd class=\"alt\">\r\n    <p>Bilingual</p>\r\n    </dd>\r\n    <dt><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl34_LN\">App Store Compatibility</span>                     </dt>\r\n    <dd>\r\n    <p>Apple App Store</p>\r\n    </dd>\r\n    <dt class=\"alt\"><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl35_LN\"><b>Audio</b></span>                     </dt>\r\n    <dd class=\"alt\">\r\n    <p>&nbsp;</p>\r\n    <br />\r\n    </dd>\r\n    <dt><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl36_LN\">Built-in Speaker</span>                     </dt>\r\n    <dd>\r\n    <p>Yes</p>\r\n    </dd>\r\n    <dt class=\"alt\"><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl37_LN\">Integrated Microphone</span>                     </dt>\r\n    <dd class=\"alt\">\r\n    <p>Yes</p>\r\n    </dd>\r\n    <dt><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl38_LN\">Microphone Input</span>                     </dt>\r\n    <dd>\r\n    <p>No</p>\r\n    </dd>\r\n    <dt class=\"alt\"><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl39_LN\">Hardware Volume Control</span>                     </dt>\r\n    <dd class=\"alt\">\r\n    <p>Yes</p>\r\n    </dd>\r\n    <dt><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl40_LN\">Headphone Jack Size</span>                     </dt>\r\n    <dd>\r\n    <p>3.5 mm</p>\r\n    </dd>\r\n    <dt class=\"alt\"><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl41_LN\"><b>Connectivity</b></span>                     </dt>\r\n    <dd class=\"alt\">\r\n    <p>&nbsp;</p>\r\n    <br />\r\n    </dd>\r\n    <dt><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl42_LN\">Integrated WiFi</span>                     </dt>\r\n    <dd>\r\n    <p>802.11a/b/g/n</p>\r\n    </dd>\r\n    <dt class=\"alt\"><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl43_LN\">Integrated Bluetooth</span>                     </dt>\r\n    <dd class=\"alt\">\r\n    <p>Yes - 2.1 + EDR</p>\r\n    </dd>\r\n    <dt><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl44_LN\">3G</span>                     </dt>\r\n    <dd>\r\n    <p>No</p>\r\n    </dd>\r\n    <dt class=\"alt\"><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl45_LN\">4G</span>                     </dt>\r\n    <dd class=\"alt\">\r\n    <p>No</p>\r\n    </dd>\r\n    <dt><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl46_LN\">Assisted GPS Navigation</span>                     </dt>\r\n    <dd>\r\n    <p>No</p>\r\n    </dd>\r\n    <dt class=\"alt\"><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl47_LN\">Unassisted GPS Navigation</span>                     </dt>\r\n    <dd class=\"alt\">\r\n    <p>No</p>\r\n    </dd>\r\n    <dt><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl48_LN\">HDMI Output</span>                     </dt>\r\n    <dd>\r\n    <p>Yes - Adapter Sold Separately</p>\r\n    </dd>\r\n    <dt class=\"alt\"><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl49_LN\">DLNA Certified</span>                     </dt>\r\n    <dd class=\"alt\">\r\n    <p>No</p>\r\n    </dd>\r\n    <dt><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl50_LN\">USB 3.0 Ports</span>                     </dt>\r\n    <dd>\r\n    <p>No</p>\r\n    </dd>\r\n    <dt class=\"alt\"><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl51_LN\">USB 2.0 Ports</span>                     </dt>\r\n    <dd class=\"alt\">\r\n    <p>Yes (Via Dock Connector)</p>\r\n    </dd>\r\n    <dt><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl52_LN\">Thunderbolt Ports</span>                     </dt>\r\n    <dd>\r\n    <p>No</p>\r\n    </dd>\r\n    <dt class=\"alt\"><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl53_LN\"><b>Power</b></span>                     </dt>\r\n    <dd class=\"alt\">\r\n    <p>&nbsp;</p>\r\n    <br />\r\n    </dd>\r\n    <dt><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl54_LN\">Approximate In-use Battery Life</span>                     </dt>\r\n    <dd>\r\n    <p>Up To 10 Hours</p>\r\n    </dd>\r\n    <dt class=\"alt\"><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl55_LN\">Battery - Number of Cells</span>                     </dt>\r\n    <dd class=\"alt\">\r\n    <p>3</p>\r\n    </dd>\r\n    <dt><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl56_LN\">Charge over USB</span>                     </dt>\r\n    <dd>\r\n    <p>Yes</p>\r\n    </dd>\r\n    <dt class=\"alt\"><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl57_LN\"><b>Physical Features</b></span>                     </dt>\r\n    <dd class=\"alt\">\r\n    <p>&nbsp;</p>\r\n    <br />\r\n    </dd>\r\n    <dt><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl58_LN\">Sensors</span>                     </dt>\r\n    <dd>\r\n    <p>3-axis Gyro; Accelerometer;Ambient Light</p>\r\n    </dd>\r\n    <dt class=\"alt\"><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl59_LN\">Hard-key QWERTY Keyboard</span>                     </dt>\r\n    <dd class=\"alt\">\r\n    <p>No</p>\r\n    </dd>\r\n    <dt><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl60_LN\">Colour</span>                     </dt>\r\n    <dd>\r\n    <p>Black</p>\r\n    </dd>\r\n    <dt class=\"alt\"><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl61_LN\">Height</span>                     </dt>\r\n    <dd class=\"alt\">\r\n    <p>24.1 cm</p>\r\n    </dd>\r\n    <dt><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl62_LN\">Depth</span>                     </dt>\r\n    <dd>\r\n    <p>0.8 cm</p>\r\n    </dd>\r\n    <dt class=\"alt\"><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl63_LN\">Width</span>                     </dt>\r\n    <dd class=\"alt\">\r\n    <p>18.6 cm</p>\r\n    </dd>\r\n    <dt><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl64_LN\">Weight</span>                     </dt>\r\n    <dd>\r\n    <p>0.6 kg</p>\r\n    </dd>\r\n    <dt class=\"alt\"><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl65_LN\">Warranty Labour</span>                     </dt>\r\n    <dd class=\"alt\">\r\n    <p>1 Year(s)</p>\r\n    </dd>\r\n    <dt><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl66_LN\">Warranty Parts</span>                     </dt>\r\n    <dd>\r\n    <p>1 Year(s)</p>\r\n    </dd>\r\n    <dt class=\"alt\"><span id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_repProductSpecs_ctl67_LN\">WebID</span>                     </dt>\r\n    <dd class=\"alt\">\r\n    <p>10165254</p>\r\n    </dd>\r\n</dl>\r\n<div id=\"whatbox\">\r\n<ul>\r\n    <h3 class=\"text\">What\'s in the Box</h3>\r\n    <li>Dock Connector to USB Cable</li>\r\n    <li>A/C Adapter</li>\r\n</ul>\r\n</div>\r\n<h3 class=\"text\">More information</h3>\r\n<p class=\"text\">The iPad 2 is  equipped with Apple\'s new A5 processor, which boasts dual cores, CPU  speed that\'s twice as fast, and graphics that offer performance up to 9  times greater than its predecessor. In short, this remarkably sleek,  svelte and portable device pushes a lot of power. And, best of all, it  offers the same incredibly efficient 10-hour battery life. <br />\r\n<br />\r\nNow  outfitted with two cameras - rear and front facing - the iPad 2 adds  more dimension to communication. Connect with friends and family over  FaceTime and take still shots using the front-facing VGA camera, or  shoot amazing HD video with the rear camera. Then play with and edit  your photos in Photo Booth, and use iMovie to enjoy amazing video  editing capabilities, including themes, sound effects, and sharing  options, with the iPad 2\'s intuitive touchscreen. <br />\r\n<br />\r\nIn addition to  iMovie, the iPad 2 now has its own version of GarageBand, allowing you  to create and record up to 8 tracks using your own instruments or using  the in-program instruments. Creating, recording, and editing have never  been easier. (Please note: Garage Band and iMovie are sold separately at  the App Store)<br />\r\n<br />\r\nThe operating system\'s been improved, too. With  iOS 4.3, there\'s so much more to love. Enjoy iTunes sharing over your  home WiFi network, increased Safari performance, Airplay functionality,  and even a preference for iPad switch. <br />\r\n<br />\r\nYou can even expand the  iPad\'s functionality. With the HDMI out function, a simple accessory  lets you connect the iPad to your HDTV and enjoy all its functionality  on a bigger screen - perfect for enjoying pictures, video and so much  more. The brilliant new Smart Cover system uses a folding design to let  you prop up the iPad 2 in any way you like while employing a soft  display cover and magnets to protect and clean the screen when not and  use. (Please note: These accessories are sold separately.)</p>\r\n<div class=\"logos-holder\">\r\n<p class=\"text\"><a href=\"http://www.futureshop.ca/en-CA/energystar.aspx\" id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_uLC_RL_ctl00_HypLogo\">Energy Star</a></p>\r\n<img alt=\"Energy Star\" src=\"http://www.futureshop.ca/images/common/pictures/EnergyStar.gif\" class=\"imgEnergyStar\" id=\"ctl00_CC_ctl00_UT_RB_ctl00_TC_Tab_FeatureSpecs_uLC_RL_ctl00_IL\" /></div>\r\n</div>\r\n<p>&nbsp;</p>',1,3,3);
-- --------------------------------------------------------

--
-- Table structure for table `sanphammongdoi`
--

DROP TABLE IF EXISTS `sanphammongdoi`;
CREATE TABLE IF NOT EXISTS `sanphammongdoi` (
  `MaSanPhamMongDoi` int(11) NOT NULL AUTO_INCREMENT,
  `MaKhachHang` int(11) DEFAULT NULL,
  `MaSanPham` int(11) DEFAULT NULL,
  `NgayThemVao` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MaTinhTrang` int(11) DEFAULT NULL,
  PRIMARY KEY (`MaSanPhamMongDoi`),
  KEY `FK_SANPHAMMONGDOI_KHACHHANG` (`MaKhachHang`),
  KEY `FK_SANPHAMMONGDOI_SANPHAM` (`MaSanPham`),
  KEY `FK_SANPHAMMONGDOI_TINHTRANG` (`MaTinhTrang`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `sanphammongdoi`
--

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
  ADD CONSTRAINT `FK_CHITIETDONDATHANG_SANPHAM` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dondathang`
--
ALTER TABLE `dondathang`
  ADD CONSTRAINT `FK_DONDATHANG_KHACHHANG` FOREIGN KEY (`MaKhachHang`) REFERENCES `khachhang` (`MaKhachHang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_DONDATHANG_TINHTRANG` FOREIGN KEY (`MaTinhTrang`) REFERENCES `tinhtrang` (`MaTinhTrang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
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

--
-- Constraints for table `sanphammongdoi`
--
ALTER TABLE `sanphammongdoi`
  ADD CONSTRAINT `FK_SANPHAMMONGDOI_KHACHHANG` FOREIGN KEY (`MaKhachHang`) REFERENCES `khachhang` (`MaKhachHang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SANPHAMMONGDOI_SANPHAM` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_SANPHAMMONGDOI_TINHTRANG` FOREIGN KEY (`MaTinhTrang`) REFERENCES `tinhtrang` (`MaTinhTrang`) ON DELETE NO ACTION ON UPDATE NO ACTION;
  