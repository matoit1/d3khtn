/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import POJO.Chitietdondathang;
import util.HibernateUtil;

import org.hibernate.HibernateException;

import org.hibernate.Session;
/**
 *
 * @author Nguyen Anh Tri
 */
public class ChiTietDonDatHangDAO {
    //<editor-fold defaultstate="collapsed" desc="Thêm mới chi tiết">
    public static boolean themChiTiet(Chitietdondathang ctddh) {
        Session session = null;
        session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            session.save(ctddh);
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
    public static Chitietdondathang layThongTin(int maChiTietDonDatHang) {
        Chitietdondathang ctddh = null;
        Session session = null;
        session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        try {
            ctddh = (Chitietdondathang) session.get(Chitietdondathang.class, maChiTietDonDatHang);
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
        } finally {
            session.close();
        }
        return ctddh;
    }
    //</editor-fold>
}
