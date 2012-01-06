/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Sanphammongdoi;
import POJO.Tinhtrang;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author Nguyen Anh Tri
 */
public class SanPhamMongDoiDAO {

    //<editor-fold defaultstate="collapsed" desc="Lấy sản phẩm theo khách hàng">
    public static List<Sanphammongdoi> layDanhSachTheoKhachHang(int maKhachHang) {
        List<Sanphammongdoi> kq = new ArrayList<Sanphammongdoi>();
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String sql = "select sp from Sanphammongdoi sp where sp.khachhang.maKhachHang =:maKhachHang and sp.tinhtrang.maTinhTrang = 1";
            Query query = session.createQuery(sql);
            query.setInteger("maKhachHang", maKhachHang);
            kq = query.list();
        } catch (HibernateException ex) {
            kq = new ArrayList<Sanphammongdoi>();
            System.out.println(ex.getMessage());
        } finally {
            session.close();
        }
        return kq;
    }
    //</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="Thêm mới sản phẩm mong đợi">
    public static boolean themMoiSanPhamMongDoi(Sanphammongdoi sp) {
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.save(sp);
            session.getTransaction().commit();
            return true;
        } catch (Exception ex) {
            session.getTransaction().rollback();
            System.out.println(ex);
            return false;
        } finally {
            session.close();
        }
    }
    //</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="Lấy thông tin">
    public static Sanphammongdoi LayThongTinSanPhamMongDoi(int maSanPhamMongDoi) {
        Sanphammongdoi sp = new Sanphammongdoi();
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            sp = (Sanphammongdoi) session.get(Sanphammongdoi.class, maSanPhamMongDoi);
            session.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        } finally {
            session.close();
        }
        return sp;
    }
    //</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="Xoá sản phẩm mong đợi">
    public static boolean xoaDonDatHang(Sanphammongdoi sp) {
        if (SanPhamMongDoiDAO.LayThongTinSanPhamMongDoi(sp.getMaSanPhamMongDoi()) == null) {
            return false;
        }
        Session session = null;
        try {
            Tinhtrang tt = TinhTrangDAO.layThongTin(2);
            session = HibernateUtil.getSessionFactory().openSession();
            sp.setTinhtrang(tt);
            session.getTransaction().begin();
            session.update(sp);
            session.getTransaction().commit();
            return true;
        } catch (Exception ex) {
            session.getTransaction().rollback();
            System.out.println(ex);
            return false;
        } finally {
            session.close();
        }
    }
    //</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="Cập nhật tình trạng">
    public static boolean capNhatTinhTrang(Sanphammongdoi sp) {
        if (SanPhamMongDoiDAO.LayThongTinSanPhamMongDoi(sp.getMaSanPhamMongDoi()) == null) {
            return false;
        }
        Session session = null;
        try {
            Tinhtrang tt = TinhTrangDAO.layThongTin(1);
            session = HibernateUtil.getSessionFactory().openSession();
            sp.setTinhtrang(tt);
            session.getTransaction().begin();
            session.update(sp);
            session.getTransaction().commit();
            return true;
        } catch (Exception ex) {
            session.getTransaction().rollback();
            System.out.println(ex);
            return false;
        } finally {
            session.close();
        }
    }
    //</editor-fold>
}
