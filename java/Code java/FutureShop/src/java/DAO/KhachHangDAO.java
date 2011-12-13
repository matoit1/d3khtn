/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import POJO.Khachhang;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author Nguyen Anh Tri
 */
public class KhachHangDAO {

    public static Khachhang LayKhachHangTheoMa(int ma) {
        Khachhang kh = new Khachhang();
        try {
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            kh = (Khachhang) session.get(Khachhang.class, ma);
            session.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return kh;
    }

    //<editor-fold defaultstate="collapsed" desc="Mã hoá MD5">
    public static String maHoa_MD5(String text) {
        String kq = null;
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            md5.update(text.getBytes());
            BigInteger bis = new BigInteger(1, md5.digest());
            kq = bis.toString(64);
            System.out.println("Chuoi da duoc ma hoa:" + text);
        } catch (NoSuchAlgorithmException ex) {
            System.out.println("khong the ma hoa duoc:" + ex.getMessage());
        }
        return kq;
    }
    //</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="Lấy thông tin khách hàng">
    public static Khachhang layThongTinKhachHang(String tenDangNhap) {
        Khachhang kh = new Khachhang();
        Session session = null;
        session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        try {
            String sql = "select kh from Khachhang kh where kh.tenDangNhap=:tenDangNhap";
            Query query = session.createQuery(sql);
            query.setString("tenDangNhap", tenDangNhap);
            kh = (Khachhang) query.uniqueResult();
        } catch (HibernateException ex) {
            kh = new Khachhang();
            System.out.println(ex.getMessage());
        } finally {
            session.close();
        }
        return kh;
    }
    //</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="Kiểm tra đăng nhập">
    public static boolean kiemTraDangNhap(String tenDangNhap, String matKhau) {
        boolean kq = false;
        Session session = null;
        session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        try {
            String sql = "select kh from Khachhang kh where tenDangNhap=:tenDangNhap";
            Query query = session.createQuery(sql);
            query.setString("tenDangNhap", tenDangNhap);

            Khachhang kh = null;
            if (query.uniqueResult() != null) {
                kh = (Khachhang) query.uniqueResult();
                if (kh.getMatKhau().equalsIgnoreCase(maHoa_MD5(matKhau))) {
                    kq = true;
                } else {
                    kq = false;
                }
            } else {
                kq = false;
            }
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
        } finally {
            session.close();
        }
        return kq;
    }
    //</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="Kiểm tra tồn tại">
    public static boolean kiemTraTonTai(String tenDangNhap) {
        boolean kq = false;
        Session session = null;
        session = HibernateUtil.getSessionFactory().openSession();
        session.beginTransaction();
        try {
            String sql = "select kh from Khachhang kh where kh.tenDangNhap=:tenDangNhap";
            Query query = session.createQuery(sql);
            query.setString("tenDangNhap", tenDangNhap);

            if (query.uniqueResult() != null) {
                kq = true;
            } else {
                kq = false;
            }
        } catch (HibernateException ex) {
            System.out.println(ex.getMessage());
        } finally {
            session.close();
        }
        return kq;
    }
    //</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="Thêm mới khách hàng">
    public static boolean themMoiKhachHang(Khachhang kh) {
        if (KhachHangDAO.layThongTinKhachHang(kh.getTenDangNhap()) != null) {
            return false;
        }
        Session session = null;
        session = HibernateUtil.getSessionFactory().openSession();
        try {
            kh.setMatKhau(maHoa_MD5(kh.getMatKhau()));
            session.beginTransaction();
            session.save(kh);
            session.getTransaction().commit();
            return true;
        } catch (Exception ex) {
            session.getTransaction().rollback();
            System.out.println(ex);
            return false;
        } finally {
            session.close();
        }
    }
    //</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="Cập nhật mật khẩu">
    public static boolean capNhatMatKhau(Khachhang kh) {
        if (KhachHangDAO.layThongTinKhachHang(kh.getTenDangNhap()) == null) {
            return false;
        }
        Session session = null;
        session = HibernateUtil.getSessionFactory().openSession();
        try {
            kh.setMatKhau(maHoa_MD5(kh.getMatKhau()));
            session.getTransaction().begin();
            session.update(kh);
            session.getTransaction().commit();
            return true;
        } catch (Exception ex) {
            session.getTransaction().rollback();
            System.out.println(ex);
            return false;
        } finally {
            session.close();
        }
    }
    //</editor-fold>

    //<editor-fold defaultstate="collapsed" desc="Cập nhật tài khoản">
    public static boolean capNhatTaiKhoan(Khachhang kh) {
        if (KhachHangDAO.layThongTinKhachHang(kh.getTenDangNhap()) == null) {
            return false;
        }
        Session session = null;
        session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.getTransaction().begin();
            session.update(kh);
            session.getTransaction().commit();
            return true;
        } catch (Exception ex) {
            session.getTransaction().rollback();
            System.out.println(ex);
            return false;
        } finally {
            session.close();
        }
    }
    //</editor-fold>
}
