/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Sanpham;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author TRANTRI
 */
public class SanPhamDAO {

    public static Sanpham LaySanPhamTheoMa(int maSP) {
        Sanpham sp = new Sanpham();
        Session session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        sp = (Sanpham) session.get(Sanpham.class, maSP);
        session.close();

        return sp;
    }
}
