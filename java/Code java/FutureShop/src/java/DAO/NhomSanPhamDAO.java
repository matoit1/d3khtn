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

    public static ArrayList<Nhomsanpham> LayDanhSachNhomSanPham() {
        ArrayList<Nhomsanpham> dsNhomSanPham = new ArrayList<Nhomsanpham>();
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction();
            Query query = (Query) session.createQuery("from Nhomsanpham nsp where nsp.tinhtrang.maTinhTrang = 1");
            dsNhomSanPham = (ArrayList<Nhomsanpham>) query.list();
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
        } finally {
            session.close();
        }
        return dsNhomSanPham;
    }

    public static int TimMaNhomSanPham(int maLoaiSanPham) {
        int maNhom = 0;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {

            session.beginTransaction();
            Query query = (Query) session.createQuery("SELECT nsp.maNhomSanPham FROM Loaisanpham lsp, Nhomsanpham nsp "
                    + "WHERE lsp.nhomsanpham.maNhomSanPham = nsp.maNhomSanPham AND lsp.maLoaiSanPham =:maLoaiSanPham");
            query.setInteger("maLoaiSanPham", maLoaiSanPham);
            maNhom = query.uniqueResult().hashCode();
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        } finally {
            session.close();
        }
        return maNhom;
    }
}
