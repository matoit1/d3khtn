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

    public static ArrayList<Sanpham> LayDanhSachToanBoSanPham() {
        ArrayList<Sanpham> dsSanPham = new ArrayList<Sanpham>();
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            Query query = (Query) session.createQuery("from Sanpham");
            dsSanPham = (ArrayList<Sanpham>) query.list();
            session.close();
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
        }
        return dsSanPham;
    }
    public static int SoLuongTongSanPham()
    {
        return LayDanhSachToanBoSanPham().size();
    }
    public static ArrayList<Sanpham> LayDanhSachSanPhamPhanTrang(int batdau, int sl, boolean flag) {//flag = false thi lay cac san pham da xoa luon
        ArrayList<Sanpham> dsSanPham = new ArrayList<Sanpham>();
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            String s="";
            if (flag){
                s=" where sp.tinhtrang =1 ";
            }
            Query query = (Query) session.createQuery("from Sanpham sp "+s+"order by id DESC limit "+batdau+","+sl);
            dsSanPham = (ArrayList<Sanpham>) query.list();
            session.close();
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
        }
        return dsSanPham;
    }

    public static Sanpham LaySanPhamTheoMa(int maSP) {

        Sanpham sp = new Sanpham();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            sp = (Sanpham) session.get(Sanpham.class, maSP);
            session.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return sp;
    }

    public static boolean CapNhapSanPham(Sanpham sp) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.getTransaction().begin();
            session.update(sp);
            session.getTransaction().commit();
            return true;
        } catch (Exception e) {
            session.getTransaction().rollback();
            System.out.print(e);
            return false;
        }
    }
    
    public static int ThemSanPham(Sanpham sp) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        int id =-1;
        try {
            session.beginTransaction();
            id = (Integer)session.save(sp);
            session.getTransaction().commit();

        } catch (Exception e) {
            session.getTransaction().rollback();
            System.out.println(e);
        } finally {
            session.close();
            return id;
        }
    }
}
