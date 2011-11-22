/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.util.ArrayList;
import POJO.*;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import util.HibernateUtil;
import org.hibernate.Session;
/**
 *
 * @author VIET
 */
public class NhomSanPhamDAO {
    public static ArrayList<Nhomsanpham> LayDanhSachNhomSanPham()
    {
        ArrayList<Nhomsanpham> dsNhomSanPham = new ArrayList<Nhomsanpham>();
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            Query query = (Query) session.createQuery("from Nhomsanpham");
            dsNhomSanPham = (ArrayList<Nhomsanpham>) query.list();
        } catch (HibernateException e) {
        }
        return dsNhomSanPham;
    }
}
