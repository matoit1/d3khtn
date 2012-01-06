/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Binhluan;
import java.util.ArrayList;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author TRANTRI
 */
public class BinhLuanDAO {

    public static ArrayList<Binhluan> LayDanhSachBinhLuanTheoMaSP(int maSP) {
        ArrayList<Binhluan> ds = new ArrayList<Binhluan>();
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            String hql = "from Binhluan s where s.sanpham.maSanPham = :masp ";
            Query query = session.createQuery(hql).setParameter("masp", maSP);
            ds = (ArrayList<Binhluan>) query.list();
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
        } finally {
            session.close();
        }
        return ds;
    }

    public static boolean ThemBinhLuan(Binhluan bl) {
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.save(bl);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            session.getTransaction().rollback();
            System.out.println(e);
            return false;
        } finally {
            session.close();
        }

    }
}
