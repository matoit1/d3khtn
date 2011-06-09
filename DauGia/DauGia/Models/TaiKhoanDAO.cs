using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
namespace DauGia.Models
{
    public class TaiKhoanDAO
    {

        public static DauGiaEntities dg = new DauGiaEntities();
        public static List<TaiKhoan> LayDanhSachTaiKhoan()
        {
            return dg.TaiKhoans.ToList();
        }
        public static TaiKhoan TimTaiKhoanTheoMa(int maTaiKhoan)
        {
            var query = dg.TaiKhoans.Where(tk => tk.MaTaiKhoan == maTaiKhoan).First();
            return (TaiKhoan)query;
        }

        public static TaiKhoan TimTaiKhoanTheoTen(string tenTaiKhoan)
        {
            var query = dg.TaiKhoans.Where(tk => tk.TenTaiKhoan == tenTaiKhoan).First();
            return (TaiKhoan)query;
        }

        public static void ThemTaiKhoan(TaiKhoan tk)
        {
            dg.TaiKhoans.AddObject(tk);
            dg.SaveChanges();
        }

        public static TaiKhoan LayTaiKhoan(string username, string password)
        {
            return dg.TaiKhoans.FirstOrDefault(c => c.TenTaiKhoan == username && c.MatKhau == password);
        }

        public static void DangNhap(string userName, bool createPersistentCookie)
        {
            if (String.IsNullOrEmpty(userName)) throw new ArgumentException("Value cannot be null or empty.", "userName");
            FormsAuthentication.SetAuthCookie(userName, createPersistentCookie);
        }

        public static void DangXuat()
        {
            FormsAuthentication.SignOut();
        }
    }
}