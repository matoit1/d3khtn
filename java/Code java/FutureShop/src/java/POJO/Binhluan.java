package POJO;
// Generated Jan 1, 2012 11:48:19 PM by Hibernate Tools 3.2.1.GA


import java.util.Date;

/**
 * Binhluan generated by hbm2java
 */
public class Binhluan  implements java.io.Serializable {


     private Integer maBinhLuan;
     private Khachhang khachhang;
     private Sanpham sanpham;
     private Date thoiGian;
     private String noiDung;

    public Binhluan() {
    }

    public Binhluan(Khachhang khachhang, Sanpham sanpham, Date thoiGian, String noiDung) {
       this.khachhang = khachhang;
       this.sanpham = sanpham;
       this.thoiGian = thoiGian;
       this.noiDung = noiDung;
    }
   
    public Integer getMaBinhLuan() {
        return this.maBinhLuan;
    }
    
    public void setMaBinhLuan(Integer maBinhLuan) {
        this.maBinhLuan = maBinhLuan;
    }
    public Khachhang getKhachhang() {
        return this.khachhang;
    }
    
    public void setKhachhang(Khachhang khachhang) {
        this.khachhang = khachhang;
    }
    public Sanpham getSanpham() {
        return this.sanpham;
    }
    
    public void setSanpham(Sanpham sanpham) {
        this.sanpham = sanpham;
    }
    public Date getThoiGian() {
        return this.thoiGian;
    }
    
    public void setThoiGian(Date thoiGian) {
        this.thoiGian = thoiGian;
    }
    public String getNoiDung() {
        return this.noiDung;
    }
    
    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }




}


