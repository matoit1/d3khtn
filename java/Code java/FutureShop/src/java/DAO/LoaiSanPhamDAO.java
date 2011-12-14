/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Loaisanpham;
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
}
