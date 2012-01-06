/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.SanPhamGioHang;
import POJO.Sanpham;
import java.util.ArrayList;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author TRANTRI
 */
public class SanPhamDAO {

    public static ArrayList<Sanpham> LayDanhSachToanBoSanPham() {
        ArrayList<Sanpham> dsSanPham = new ArrayList<Sanpham>();
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Query query = (Query) session.createQuery("from Sanpham");
            dsSanPham = (ArrayList<Sanpham>) query.list();
            session.close();
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
        } finally {
            session.close();
        }
        return dsSanPham;
    }

    public static int SoLuongTongSanPham() {
        return LayDanhSachToanBoSanPham().size();
    }

    public static ArrayList<Sanpham> LayDanhSachSanPhamPhanTrang(int batdau, int sl, boolean flag) {//flag = false thi lay cac san pham da xoa luon
        ArrayList<Sanpham> dsSanPham = new ArrayList<Sanpham>();
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String s = "";
            if (flag) {
                s = " where sp.tinhtrang =1 ";
            }
            Query query = (Query) session.createQuery("from Sanpham sp " + s + "order by id DESC");//lay nhung san pham moi nhat truoc
            query.setFirstResult(batdau);
            query.setMaxResults(sl);
            dsSanPham = (ArrayList<Sanpham>) query.list();
            session.close();
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
        } finally {
            session.close();
        }
        return dsSanPham;
    }

    public static Sanpham LaySanPhamTheoMa(int maSP) {
        Sanpham sp = new Sanpham();
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            sp = (Sanpham) session.get(Sanpham.class, maSP);
            session.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            session.close();
        }
        return sp;
    }

    public static ArrayList<Sanpham> LayDanhSachSanPhamTheoTen(String ten, int trang) {
        ArrayList<Sanpham> ds = new ArrayList<Sanpham>();
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            int dongBatDau = (trang - 1) * 15;
            String hql = "From Sanpham sp Where sp.tenSanPham like '%" + ten + "%'";
            Query query = session.createQuery(hql);
            query.setFirstResult(dongBatDau);
            query.setMaxResults(15);
            ds = (ArrayList<Sanpham>) query.list();
            session.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            session.close();
        }
        return ds;
    }

    public static ArrayList<Sanpham> LayDanhSachSanPhamTheoHangSanXuat(int maHangSanXuat, int trang) {
        ArrayList<Sanpham> ds = new ArrayList<Sanpham>();
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            int dongBatDau = (trang - 1) * 15;
            String hql = "From Sanpham sp Where sp.hangsanxuat.maHangSanXuat=:maHang";
            Query query = session.createQuery(hql);
            query.setInteger("maHang", maHangSanXuat);
            query.setFirstResult(dongBatDau);
            query.setMaxResults(15);
            ds = (ArrayList<Sanpham>) query.list();
            session.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            session.close();
        }
        return ds;
    }

    public static boolean CapNhapSanPham(Sanpham sp) {
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.getTransaction().begin();
            session.update(sp);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            session.getTransaction().rollback();
            System.out.print(e);
            return false;
        } finally {
            session.close();
        }
    }

    public static int ThemSanPham(Sanpham sp) {
        Session session = null;
        int id = -1;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            id = (Integer) session.save(sp);
            session.getTransaction().commit();

        } catch (Exception e) {
            session.getTransaction().rollback();
            System.out.println(e);
        } finally {
            session.close();
        }
        return id;
    }

    public static ArrayList<Sanpham> LayDanhSachSanPhamTheoNhomSanPham(int maNhomSanPham, int trang) {
        ArrayList<Sanpham> dsSanPham = new ArrayList<Sanpham>();
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            int dongBatDau = (trang - 1) * 15;
            String hql = "FROM Sanpham sp WHERE sp.loaisanpham.nhomsanpham.maNhomSanPham =:maNhom order by id DESC";
            Query query = session.createQuery(hql);
            query.setInteger("maNhom", maNhomSanPham);
            query.setFirstResult(dongBatDau);
            query.setMaxResults(15);
            dsSanPham = (ArrayList<Sanpham>) query.list();
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
        } finally {
            session.close();
        }
        return dsSanPham;
    }

    public static ArrayList<Sanpham> LayDanhSachSanPhamTheoLoaiSanPham(int maLoaiSanPham, int trang) {
        ArrayList<Sanpham> dsSanPham = new ArrayList<Sanpham>();
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            int dongBatDau = (trang - 1) * 15;
            String hql = "FROM Sanpham sp WHERE sp.loaisanpham.maLoaiSanPham =:maNhom order by id DESC";
            Query query = session.createQuery(hql);
            query.setInteger("maNhom", maLoaiSanPham);
            query.setFirstResult(dongBatDau);
            query.setMaxResults(15);
            dsSanPham = (ArrayList<Sanpham>) query.list();
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
        } finally {
            session.close();
        }
        return dsSanPham;
    }

    public static ArrayList<Sanpham> TimKiemSanPhamNangCao(String tenSp, int trang, float gia, int maHSX, int maLSP) {
        ArrayList<Sanpham> dsSP = new ArrayList<Sanpham>();
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String hqr = "FROM Sanpham sp WHERE sp.tinhtrang=1 and (sp.tenSanPham ='%" + tenSp + "%' or "
                    + "sp.hangsanxuat=" + maHSX + " or "
                    + "sp.loaisanpham=" + maLSP + " or "
                    + "((sp.giaGoc-100)< " + gia + " and " + gia + " < (sp.giaGoc+100)))";
            Query query = session.createQuery(hqr);
            int dongBatDau = (trang - 1) * 15;
            query.setFirstResult(dongBatDau);
            query.setMaxResults(15);
            dsSP = (ArrayList<Sanpham>) query.list();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            session.close();
        }
        return dsSP;
    }

    public static ArrayList<Sanpham> AdminTimKiemSanPham(String tenSp, int trang, int maHSX, int maLSP) {
        ArrayList<Sanpham> dsSP = new ArrayList<Sanpham>();
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String hqr = "FROM Sanpham sp WHERE sp.tinhtrang=1 and (sp.tenSanPham ='%" + tenSp + "%' or "
                    + "sp.hangsanxuat=" + maHSX + " or "
                    + "sp.loaisanpham=" + maLSP + ")";
            Query query = session.createQuery(hqr);
            int dongBatDau = (trang - 1) * 5;
            query.setFirstResult(dongBatDau);
            query.setMaxResults(5);
            dsSP = (ArrayList<Sanpham>) query.list();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            session.close();
        }
        return dsSP;
    }

    public static int TinhSoTrangTheoNhomSanPham(int maNhomSanPham) {
        int soTrang = 1;
        int soLuong = 0;
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String hql = "SELECT Count(*) as soluong FROM Sanpham sp WHERE sp.loaisanpham.nhomsanpham.maNhomSanPham =:maNhom";
            Query query = session.createQuery(hql);
            query.setInteger("maNhom", maNhomSanPham);
            soLuong = query.uniqueResult().hashCode();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            session.close();
        }
        if (soLuong < 15) {
            soTrang = 1;
        } else {
            soTrang = soLuong / 15;
            if (soLuong % 15 != 0) {
                soTrang++;
            }
        }
        return soTrang;
    }

    public static int TinhSoTrangTheoHangSanXuat(int maHangSanXuat) {
        int soTrang = 1;
        int soLuong = 0;
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String hql = "SELECT Count(*) as soluong FROM Sanpham sp WHERE sp.hangsanxuat.maHangSanXuat =:maHangSanXuat";
            Query query = session.createQuery(hql);
            query.setInteger("maHangSanXuat", maHangSanXuat);
            soLuong = query.uniqueResult().hashCode();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            session.close();
        }
        if (soLuong < 15) {
            soTrang = 1;
        } else {
            soTrang = soLuong / 15;
            if (soLuong % 15 != 0) {
                soTrang++;
            }
        }
        return soTrang;
    }

    public static int TinhSoTrangTheoLoaiSanPham(int maLoaiSanPham) {
        int soTrang = 1;
        int soLuong = 0;
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String hql = "SELECT Count(*) as soluong FROM Sanpham sp WHERE sp.loaisanpham.maLoaiSanPham =:maLoai";
            Query query = session.createQuery(hql);
            query.setInteger("maLoai", maLoaiSanPham);
            soLuong = query.uniqueResult().hashCode();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            session.close();
        }
        if (soLuong < 15) {
            soTrang = 1;
        } else {
            soTrang = soLuong / 15;
            if (soLuong % 15 != 0) {
                soTrang++;
            }
        }
        return soTrang;
    }

    public static int TinhSoTrangTheoTenSanPham(String tenSP) {
        int soTrang = 1;
        int soLuong = 0;
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String hql = "SELECT Count(*) as soluong FROM Sanpham sp WHERE sp.tenSanPham like '%" + tenSP + "%'";
            Query query = session.createQuery(hql);
            soLuong = query.uniqueResult().hashCode();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            session.close();
        }
        if (soLuong < 15) {
            soTrang = 1;
        } else {
            soTrang = soLuong / 15;
            if (soLuong % 15 != 0) {
                soTrang++;
            }
        }
        return soTrang;
    }

    public static int TinhSoTrangTheoTimKiemNangCao(String tenSp, int trang, float gia, int maHSX, int maLSP) {
        int soTrang = 1;
        int soLuong = 0;
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String hql = "SELECT Count(*) as soluong FROM Sanpham sp WHERE sp.tinhtrang=1 and (sp.tenSanPham ='%" + tenSp + "%' or "
                    + "sp.hangsanxuat=" + maHSX + " or "
                    + "sp.loaisanpham=" + maLSP + " or "
                    + "(sp.giaGoc-100)< " + gia + " and " + gia + " < (sp.giaGoc+100))";
            Query query = session.createQuery(hql);
            soLuong = query.uniqueResult().hashCode();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            session.close();
        }
        if (soLuong < 15) {
            soTrang = 1;
        } else {
            soTrang = soLuong / 15;
            if (soLuong % 15 != 0) {
                soTrang++;
            }
        }
        return soTrang;
    }

    public static int AdminTinhSoTrang(String tenSp, int trang, int maHSX, int maLSP) {
        int soTrang = 1;
        int soLuong = 0;
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String hql = "SELECT Count(*) as soluong FROM Sanpham sp WHERE sp.tinhtrang=1 and (sp.tenSanPham ='%" + tenSp + "%' or "
                    + "sp.hangsanxuat=" + maHSX + " or "
                    + "sp.loaisanpham=" + maLSP + ")";
            Query query = session.createQuery(hql);
            soLuong = query.uniqueResult().hashCode();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            session.close();
        }
        if (soLuong < 5) {
            soTrang = 1;
        } else {
            soTrang = soLuong / 5;
            if (soLuong % 5 != 0) {
                soTrang++;
            }
        }
        return soTrang;
    }

    private static String CatNganTenSanPham(String nameProduct) {
        String name = nameProduct;
        if (name.length() > 35) {
            name = name.substring(0, 35) + "...";
        }
        return name;
    }

    private static String CatNganMoTa(String moTa) {
        String moTaSP = moTa;
        if (moTaSP.length() > 80) {
            moTaSP = moTaSP.substring(0, 80) + "...";
        }
        return moTaSP;
    }

    public static ArrayList<Sanpham> ChuanHoaSanPham(ArrayList<Sanpham> dsSP) {
        ArrayList<Sanpham> dsSanPham = new ArrayList<Sanpham>();
        dsSanPham = dsSP;
        try {
            for (int i = 0; i < dsSanPham.size(); i++) {
                dsSanPham.get(i).setTenSanPham(CatNganTenSanPham(dsSanPham.get(i).getTenSanPham()));
                dsSanPham.get(i).setMoTa(CatNganMoTa(dsSanPham.get(i).getMoTa()));
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return dsSanPham;
    }

    //<editor-fold defaultstate="collapsed" desc="Lấy thông tin sản phẩm giỏ hàng">
    public static SanPhamGioHang layThongTinSanPhamGioHang(int maSanPham) {
        SanPhamGioHang sanPham = new SanPhamGioHang();
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            Sanpham sp = (Sanpham) session.get(Sanpham.class, maSanPham);
            sanPham.setMaSanPham(sp.getMaSanPham());
            sanPham.setTenSanPham(sp.getTenSanPham());
            sanPham.setHinhAnh(
                    "images/product/" + sp.getMaSanPham() + "_1.jpg");
            sanPham.setGiaGoc(sp.getGiaGoc());
            sanPham.setGiamGia(sp.getGiamGia());
        } catch (Exception ex) {
            System.err.println(ex);
        } finally {
            session.close();
        }
        return sanPham;
    }
    //</editor-fold>
}
