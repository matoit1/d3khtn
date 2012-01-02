package POJO;
// Generated Jan 1, 2012 11:48:19 PM by Hibernate Tools 3.2.1.GA


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Nhomsanpham generated by hbm2java
 */
public class Nhomsanpham  implements java.io.Serializable {


     private Integer maNhomSanPham;
     private Tinhtrang tinhtrang;
     private String tenNhomSanPham;
     private Date ngayCongBo;
     private Set loaisanphams = new HashSet(0);

    public Nhomsanpham() {
    }

    public Nhomsanpham(Tinhtrang tinhtrang, String tenNhomSanPham, Date ngayCongBo, Set loaisanphams) {
       this.tinhtrang = tinhtrang;
       this.tenNhomSanPham = tenNhomSanPham;
       this.ngayCongBo = ngayCongBo;
       this.loaisanphams = loaisanphams;
    }
   
    public Integer getMaNhomSanPham() {
        return this.maNhomSanPham;
    }
    
    public void setMaNhomSanPham(Integer maNhomSanPham) {
        this.maNhomSanPham = maNhomSanPham;
    }
    public Tinhtrang getTinhtrang() {
        return this.tinhtrang;
    }
    
    public void setTinhtrang(Tinhtrang tinhtrang) {
        this.tinhtrang = tinhtrang;
    }
    public String getTenNhomSanPham() {
        return this.tenNhomSanPham;
    }
    
    public void setTenNhomSanPham(String tenNhomSanPham) {
        this.tenNhomSanPham = tenNhomSanPham;
    }
    public Date getNgayCongBo() {
        return this.ngayCongBo;
    }
    
    public void setNgayCongBo(Date ngayCongBo) {
        this.ngayCongBo = ngayCongBo;
    }
    public Set getLoaisanphams() {
        return this.loaisanphams;
    }
    
    public void setLoaisanphams(Set loaisanphams) {
        this.loaisanphams = loaisanphams;
    }




}


