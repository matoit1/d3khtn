package POJO;
// Generated Nov 24, 2011 4:33:44 PM by Hibernate Tools 3.2.1.GA


import java.util.HashSet;
import java.util.Set;

/**
 * Loaikhachhang generated by hbm2java
 */
public class Loaikhachhang  implements java.io.Serializable {


     private Integer maLoaiKhachHang;
     private String tenLoaiKhachHang;
     private Set khachhangs = new HashSet(0);

    public Loaikhachhang() {
    }

    public Loaikhachhang(String tenLoaiKhachHang, Set khachhangs) {
       this.tenLoaiKhachHang = tenLoaiKhachHang;
       this.khachhangs = khachhangs;
    }
   
    public Integer getMaLoaiKhachHang() {
        return this.maLoaiKhachHang;
    }
    
    public void setMaLoaiKhachHang(Integer maLoaiKhachHang) {
        this.maLoaiKhachHang = maLoaiKhachHang;
    }
    public String getTenLoaiKhachHang() {
        return this.tenLoaiKhachHang;
    }
    
    public void setTenLoaiKhachHang(String tenLoaiKhachHang) {
        this.tenLoaiKhachHang = tenLoaiKhachHang;
    }
    public Set getKhachhangs() {
        return this.khachhangs;
    }
    
    public void setKhachhangs(Set khachhangs) {
        this.khachhangs = khachhangs;
    }




}

