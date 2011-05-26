using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DauGia.Models
{
    public class TaiKhoanDAO
    {
        public static DauGiaDataContext dg = new DauGiaDataContext();
        public static List<TaiKhoan> LayDanhSachTaiKhoan()
        {
            return dg.TaiKhoans.ToList();
        }
        public static TaiKhoan TimTaiKhoanTheoMa(int maTaiKhoan)
        {
            var query = dg.TaiKhoans.Where(tk => tk.MaTaiKhoan == maTaiKhoan).First();
            return (TaiKhoan)query;
        }


    }
}