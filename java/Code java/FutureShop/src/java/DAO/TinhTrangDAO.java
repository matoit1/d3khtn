/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Tinhtrang;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author Nguyen Anh Tri
 */
public class TinhTrangDAO {
    
    //<editor-fold defaultstate="collapsed" desc="Lấy thông tin">
    public static Tinhtrang layThongTin(int maTinhTrang) {
        Tinhtrang tt = new Tinhtrang();
        Session session = null;
        session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        try {
            tt = (Tinhtrang) session.get(Tinhtrang.class, maTinhTrang);
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
        }
        finally {
            session.close();
        }
        return tt;
    }
    //</editor-fold>
}
