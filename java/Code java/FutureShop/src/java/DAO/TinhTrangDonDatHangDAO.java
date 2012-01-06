/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Tinhtrangdondathang;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author Nguyen Anh Tri
 */
public class TinhTrangDonDatHangDAO {

    //<editor-fold defaultstate="collapsed" desc="Lấy thông tin">
    public static Tinhtrangdondathang layThongTin(int maTinhTrangDonDatHang) {
        Tinhtrangdondathang ttddh = new Tinhtrangdondathang();
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            ttddh = (Tinhtrangdondathang) session.get(Tinhtrangdondathang.class, maTinhTrangDonDatHang);
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
        } finally {
            session.close();
        }
        return ttddh;
    }
    //</editor-fold>
}
