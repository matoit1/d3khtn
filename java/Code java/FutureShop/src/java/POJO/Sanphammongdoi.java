package POJO;
// Generated Jan 5, 2012 1:14:25 PM by Hibernate Tools 3.2.1.GA



/**
 * Sanphammongdoi generated by hbm2java
 */
public class Sanphammongdoi  implements java.io.Serializable {


     private Integer maSanPhamMongDoi;
     private Khachhang khachhang;
     private Sanpham sanpham;
     private Tinhtrang tinhtrang;
     private String ngayThemVao;

    public Sanphammongdoi() {
    }

    public Sanphammongdoi(Khachhang khachhang, Sanpham sanpham, Tinhtrang tinhtrang, String ngayThemVao) {
       this.khachhang = khachhang;
       this.sanpham = sanpham;
       this.tinhtrang = tinhtrang;
       this.ngayThemVao = ngayThemVao;
    }
   
    public Integer getMaSanPhamMongDoi() {
        return this.maSanPhamMongDoi;
    }
    
    public void setMaSanPhamMongDoi(Integer maSanPhamMongDoi) {
        this.maSanPhamMongDoi = maSanPhamMongDoi;
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
    public Tinhtrang getTinhtrang() {
        return this.tinhtrang;
    }
    
    public void setTinhtrang(Tinhtrang tinhtrang) {
        this.tinhtrang = tinhtrang;
    }
    public String getNgayThemVao() {
        return this.ngayThemVao;
    }
    
    public void setNgayThemVao(String ngayThemVao) {
        this.ngayThemVao = ngayThemVao;
    }




}


