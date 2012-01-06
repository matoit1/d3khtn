/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Dondathang;
import POJO.Tinhtrang;
import java.util.ArrayList;
import java.util.List;
import util.HibernateUtil;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

/**
 *
 * @author Nguyen Anh Tri
 */
public class DonDatHangDAO {

    //<editor-fold defaultstate="collapsed" desc="Thêm mới đơn đặt hàng">
    public static int themDonDatHang(Dondathang ddh) {
        int kq = -1;
        Session session = null;
        session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.save(ddh);
            session.getTransaction().commit();

            String sql = "select max(ddh.maDonDatHang) from Dondathang ddh";
            Query query = session.createQuery(sql);
            kq = (Integer) query.uniqueResult();
        } catch (Exception ex) {
            session.getTransaction().rollback();
            System.out.println(ex);
        } finally {
            session.close();
        }
        return kq;
    }
    //</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="Lấy thông tin theo người dùng">
    public static List<Dondathang> layDonDatHang() {
        List<Dondathang> ddh = new ArrayList<Dondathang>();
        Session session = null;
        session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            String hql = "select ddh from Dondathang ddh where ddh.tinhtrang.maTinhTrang =:maTinhTrang";
            Query query = session.createQuery(hql);
            query.setInteger("maTinhTrang", 1);

            ddh = query.list();
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
            ddh = new ArrayList<Dondathang>();
        } finally {
            session.close();
        }
        return ddh;
    }
    //</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="Lấy thông tin theo người dùng">
    public static List<Dondathang> layDonDatHangTheoKhachHang(int maKhachHang) {
        List<Dondathang> ddh = new ArrayList<Dondathang>();
        Session session = null;
        session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            String hql = "select ddh from Dondathang ddh where ddh.khachhang.maKhachHang =:maKhachHang and ddh.tinhtrang.maTinhTrang =:maTinhTrang";
            Query query = session.createQuery(hql);
            query.setInteger("maKhachHang", maKhachHang);
            query.setInteger("maTinhTrang", 1);

            ddh = query.list();
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
            ddh = new ArrayList<Dondathang>();
        } finally {
            session.close();
        }
        return ddh;
    }
    //</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="Lấy thông tin theo mã">
    public static Dondathang layThongTinDonDatHang(int maDonDatHang) {
        Dondathang ddh = new Dondathang();
        Session session = null;
        session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        try {
            ddh = (Dondathang) session.get(Dondathang.class, maDonDatHang);
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
        } finally {
            session.close();
        }
        return ddh;
    }
    //</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="Cập nhật đơn đặt hàng">
    public static boolean capNhatDonDatHang(Dondathang ddh) {
        if (DonDatHangDAO.layThongTinDonDatHang(ddh.getMaDonDatHang()) == null) {
            return false;
        }
        Session session = null;
        session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.getTransaction().begin();
            session.update(ddh);
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
