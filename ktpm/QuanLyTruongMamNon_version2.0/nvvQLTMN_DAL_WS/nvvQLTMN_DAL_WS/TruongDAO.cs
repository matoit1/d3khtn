using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
//using DTO;

namespace nvvQLTMN_DAL_WS
{
    public class TruongDAO : EntityMethod
    {
        public TruongDTO LayThongTinTruong()
        {
            QLNTDataContext db = new QLNTDataContext();
            var truong = from t in db.Truongs select new TruongDTO() { MaTruong = t.MaTruong, TenTruong = t.TenTruong, DiaChi =t.DiaChi, Sdt = t.SoDienThoai};
            return truong.ToList<TruongDTO>()[0];
        }

        public override bool CapNhap(EntityClass objectClass)
        {
            bool kq = true;
            TruongDTO truonghoc = (TruongDTO)objectClass;
            try
            {
                TruongDTO tam = LayThongTinTruong();
                QLNTDataContext db = new QLNTDataContext();
                var truong = db.Truongs.Single(t => t.MaTruong == tam.MaTruong);
                truong.TenTruong = truonghoc.TenTruong;
                truong.DiaChi = truonghoc.DiaChi;
                truong.SoDienThoai = truonghoc.Sdt;
                db.SubmitChanges();
            }
            catch
            {
                kq = false;
            }
            return kq;
        }
        
    }
}
