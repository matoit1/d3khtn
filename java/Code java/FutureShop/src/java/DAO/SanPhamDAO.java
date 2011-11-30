/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

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

    public static ArrayList<Sanpham> LayDanhSachNhomSanPham()
    {
        ArrayList<Sanpham> dsSanPham = new ArrayList<Sanpham>();
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            Query query = (Query) session.createQuery("from Sanpham order by id DESC limit 0,4");
            dsSanPham = (ArrayList<Sanpham>) query.list();
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
        }
        return dsSanPham;
    }
    
    public static Sanpham LaySanPhamTheoMa(int maSP) {
        Sanpham sp = new Sanpham();
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        sp = (Sanpham) session.get(Sanpham.class, maSP);
        session.close();

        return sp;
    }
}
