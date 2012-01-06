/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Danhgiasanpham;
import java.util.ArrayList;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author VIET
 */
public class DanhGiaSanPhamDAO {

    public static void DanhGia(Danhgiasanpham dg) {
        Session ss = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            ss.beginTransaction().begin();
            ss.save(dg);
            ss.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            ss.getTransaction().rollback();
        }
    }

    public static int XetMucDoTheoDiem(float diem) {
        int mucDo = 0;
        if(0<diem && diem<=1)
            mucDo = 1;
        if(1<diem && diem<=2)
            mucDo = 2;
        if(2<diem && diem<=3)
            mucDo = 3;
        if(3<diem && diem<=4)
            mucDo = 4;
        if(5<diem && diem<=5)
            mucDo = 5;
        return mucDo;
    }
    
    public static boolean CapNhapDanhGiaSanPham(Danhgiasanpham dg){
        boolean result = false;
        Session ss = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            ss.beginTransaction().begin();
            ss.update(dg);
            ss.getTransaction().commit();
            result = true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            ss.getTransaction().rollback();
            result = false;        
        }
        return result;
    }
    
    public static Danhgiasanpham KiemTraDanhGia(int maKhachHang, int maSanPham){
        Danhgiasanpham dg = new Danhgiasanpham();
        Session ss= HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            ss.beginTransaction().begin();
            String hql = "FROM Danhgiasanpham dg WHERE dg.sanpham=:maSanPham AND dg.khachhang=:maKhachHang";
            Query query = ss.createQuery(hql);
            query.setInteger("maSanPham", maSanPham);
            query.setInteger("maKhachHang", maKhachHang);
            dg = (Danhgiasanpham) query.uniqueResult();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return dg;
    }

    public static float TinhDiemDanhGia(int maSanPham, int diem) {
        float diemtrungBinh = 0;
        ArrayList<Danhgiasanpham> dsDanhGia = LayDanhSachDanhGiaTheoSanPham(maSanPham);
        try {
            int eval = 0;
            for (int i = 0; i < dsDanhGia.size(); i++) {
                eval += dsDanhGia.get(i).getDiemDanhGia();
            }
            diemtrungBinh = eval / dsDanhGia.size();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return diemtrungBinh;
    }

    public static ArrayList<Danhgiasanpham> LayDanhSachDanhGiaTheoSanPham(int maSanPham) {
        ArrayList<Danhgiasanpham> dsDanhGia = new ArrayList<Danhgiasanpham>();
        Session ss = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            ss.beginTransaction().begin();
            String hql = "FROM Danhgiasanpham dg WHERE dg.sanpham=:maSanPham";
            Query query = ss.createQuery(hql);
            query.setInteger("maTaiKhoan", maSanPham);
            dsDanhGia = (ArrayList<Danhgiasanpham>) query.list();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            dsDanhGia = new ArrayList<Danhgiasanpham>();
        }
        return dsDanhGia;
    }
}
