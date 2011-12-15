/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Loaisanpham;
import java.util.ArrayList;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author TRANTRI
 */
public class LoaiSanPhamDAO {
     public static Loaisanpham LayLoaiSanPhamTheoMa(int ma) {

        Loaisanpham sp = new Loaisanpham();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            sp = (Loaisanpham) session.get(Loaisanpham.class, ma);
            session.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return sp;
    }
     
     public static ArrayList<Loaisanpham> LayDanhSachLoaiSanPham() {
        ArrayList<Loaisanpham> dsLoaiSanPham = new ArrayList<Loaisanpham>();
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            Query query = (Query) session.createQuery("from Loaisanpham");
            dsLoaiSanPham = (ArrayList<Loaisanpham>) query.list();
            session.close();
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
        }
        return dsLoaiSanPham;
    }
}
