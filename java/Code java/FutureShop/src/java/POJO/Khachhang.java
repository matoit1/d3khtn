package POJO;
// Generated Nov 24, 2011 4:33:44 PM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Khachhang generated by hbm2java
 */
public class Khachhang  implements java.io.Serializable {


     private Integer maKhachHang;
     private Loaikhachhang loaikhachhang;
     private String tenDangNhap;
     private String matKhau;
     private String hoTen;
     private Boolean gioiTinh;
     private String email;
     private String ngaySinh;
     private String diaChi;
     private Set dondathangs = new HashSet(0);
     private Set binhluans = new HashSet(0);

    public Khachhang() {
    }

    public Khachhang(Loaikhachhang loaikhachhang, String tenDangNhap, String matKhau, String hoTen, Boolean gioiTinh, String email, String ngaySinh, String diaChi, Set dondathangs, Set binhluans) {
       this.loaikhachhang = loaikhachhang;
       this.tenDangNhap = tenDangNhap;
       this.matKhau = matKhau;
       this.hoTen = hoTen;
       this.gioiTinh = gioiTinh;
       this.email = email;
       this.ngaySinh = ngaySinh;
       this.diaChi = diaChi;
       this.dondathangs = dondathangs;
       this.binhluans = binhluans;
    }
   
    public Integer getMaKhachHang() {
        return this.maKhachHang;
    }
    
    public void setMaKhachHang(Integer maKhachHang) {
        this.maKhachHang = maKhachHang;
    }
    public Loaikhachhang getLoaikhachhang() {
        return this.loaikhachhang;
    }
    
    public void setLoaikhachhang(Loaikhachhang loaikhachhang) {
        this.loaikhachhang = loaikhachhang;
    }
    public String getTenDangNhap() {
        return this.tenDangNhap;
    }
    
    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }
    public String getMatKhau() {
        return this.matKhau;
    }
    
    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }
    public String getHoTen() {
        return this.hoTen;
    }
    
    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }
    public Boolean getGioiTinh() {
        return this.gioiTinh;
    }
    
    public void setGioiTinh(Boolean gioiTinh) {
        this.gioiTinh = gioiTinh;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public String getNgaySinh() {
        return this.ngaySinh;
    }
    
    public void setNgaySinh(String ngaySinh) {
        this.ngaySinh = ngaySinh;
    }
    public String getDiaChi() {
        return this.diaChi;
    }
    
    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }
    public Set getDondathangs() {
        return this.dondathangs;
    }
    
    public void setDondathangs(Set dondathangs) {
        this.dondathangs = dondathangs;
    }
    public Set getBinhluans() {
        return this.binhluans;
    }
    
    public void setBinhluans(Set binhluans) {
        this.binhluans = binhluans;
    }




}

