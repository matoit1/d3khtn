/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Dondathang;
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

    //<editor-fold defaultstate="collapsed" desc="Lấy thông tin">
    public static Dondathang layThongTinDonDatHang(int maDonDatHang) {
        Dondathang ddh = new Dondathang();
        Session session = null;
        session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        try {
            ddh = (Dondathang) session.get(Dondathang.class, maDonDatHang);
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
        }
        return ddh;
    }
    //</editor-fold>
}
