package POJO;
// Generated Jan 1, 2012 11:48:19 PM by Hibernate Tools 3.2.1.GA



/**
 * Chitietdondathang generated by hbm2java
 */
public class Chitietdondathang  implements java.io.Serializable {


     private Integer maChiTietDonDatHang;
     private Sanpham sanpham;
     private Dondathang dondathang;
     private Integer soLuong;
     private Float donGia;

    public Chitietdondathang() {
    }

    public Chitietdondathang(Sanpham sanpham, Dondathang dondathang, Integer soLuong, Float donGia) {
       this.sanpham = sanpham;
       this.dondathang = dondathang;
       this.soLuong = soLuong;
       this.donGia = donGia;
    }
   
    public Integer getMaChiTietDonDatHang() {
        return this.maChiTietDonDatHang;
    }
    
    public void setMaChiTietDonDatHang(Integer maChiTietDonDatHang) {
        this.maChiTietDonDatHang = maChiTietDonDatHang;
    }
    public Sanpham getSanpham() {
        return this.sanpham;
    }
    
    public void setSanpham(Sanpham sanpham) {
        this.sanpham = sanpham;
    }
    public Dondathang getDondathang() {
        return this.dondathang;
    }
    
    public void setDondathang(Dondathang dondathang) {
        this.dondathang = dondathang;
    }
    public Integer getSoLuong() {
        return this.soLuong;
    }
    
    public void setSoLuong(Integer soLuong) {
        this.soLuong = soLuong;
    }
    public Float getDonGia() {
        return this.donGia;
    }
    
    public void setDonGia(Float donGia) {
        this.donGia = donGia;
    }




}


