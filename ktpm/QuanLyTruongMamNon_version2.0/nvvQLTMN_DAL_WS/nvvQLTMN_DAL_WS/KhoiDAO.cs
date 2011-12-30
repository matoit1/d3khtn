using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
//using DTO;

namespace nvvQLTMN_DAL_WS
{
    public class KhoiDAO : EntityMethod
    {
        public List<KhoiDTO> LayDanhSachKhoi()
        {
            QLNTDataContext db = new QLNTDataContext();
            var quey = from k in db.Khois select new KhoiDTO() { MaKhoi = k.MaKhoi, TenKhoi = k.TenKhoi, SoLop = k.SoLop };
            return quey.ToList<KhoiDTO>();
        }
        //public  static bool CapNhapKhoi(KhoiDTO khoi)
        //{
        //    QLNTDataContext db = new QLNTDataContext();
        //    var query = db.Khois.Single(k => k.MaKhoi == khoi.MaKhoi);
        //    query.TenKhoi = khoi.TenKhoi;
        //    query.SoLop = khoi.SoLop;
        //    db.SubmitChanges();
        //    return true;
        //}
        //public static bool ThemKhoi(KhoiDTO khoi)
        //{
        //    QLNTDataContext db = new QLNTDataContext();
        //    Khoi k = new Khoi();
        //    k.TenKhoi = khoi.TenKhoi;
        //    k.SoLop = khoi.SoLop;
        //    db.Khois.InsertOnSubmit(k);
        //    db.SubmitChanges();
        //    return true;
        //}
        //public static  bool XoaKhoi(int maKhoi)
        //{
        //    QLNTDataContext db = new QLNTDataContext();
        //    var query = db.Khois.Single(k => k.MaKhoi == maKhoi);
        //    db.Khois.DeleteOnSubmit(query);
        //    db.SubmitChanges();
        //    return true;
        //}
    }
}
