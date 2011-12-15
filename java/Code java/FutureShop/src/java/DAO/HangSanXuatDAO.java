/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Hangsanxuat;
import POJO.Nhomsanpham;
import java.util.ArrayList;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author VIET
 */
public class HangSanXuatDAO {

    public static ArrayList<Hangsanxuat> LayDanhSachSpecialStores() {
        ArrayList<Hangsanxuat> dsHangSx = new ArrayList<Hangsanxuat>();
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            Query query = (Query) session.createQuery("from Hangsanxuat hsx where hsx.uuTien = 1");
            dsHangSx = (ArrayList<Hangsanxuat>) query.list();
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
        }
        return dsHangSx;
    }
     public static ArrayList<Hangsanxuat> LayDanhSachHangSanXuat() {
        ArrayList<Hangsanxuat> dsHangSx = new ArrayList<Hangsanxuat>();
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            Query query = (Query) session.createQuery("from Hangsanxuat");
            dsHangSx = (ArrayList<Hangsanxuat>) query.list();
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
        }
        return dsHangSx;
    }
    public static Hangsanxuat LayHangSanXuatTheoMa(int ma) {
        Hangsanxuat sp = new Hangsanxuat();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            sp = (Hangsanxuat) session.get(Hangsanxuat.class, ma);
            session.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return sp;
    }
}
