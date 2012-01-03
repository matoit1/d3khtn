using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
//using DTO;

namespace nvvQLTMN_DAL_WS
{
    public class LopDAO : EntityMethod
    {
        public List<LopDTO> LayDanhSachLop()
        {
            QLNTDataContext db = new QLNTDataContext();
            var query = from l in db.Lops join k in db.Khois on l.MaKhoi equals k.MaKhoi select new LopDTO() {MaLop =l.MaLop,TenLop =l.TenLop,SiSo =l.SiSo, DoTuoi =l.DoTuoi, TenKhoi = k.TenKhoi};
            return query.ToList<LopDTO>();
        }

        public override bool Them(EntityClass objectClass)
        {
            bool kq = true;
            LopDTO loptam = (LopDTO)objectClass;
            try
            {
                QLNTDataContext db = new QLNTDataContext();
                var query = db.Khois.Single(k => k.TenKhoi == loptam.TenKhoi);
                Lop l = new Lop();
                l.TenLop = loptam.TenLop;
                l.SiSo = loptam.SiSo;
                l.DoTuoi = loptam.DoTuoi;
                l.MaKhoi = query.MaKhoi;
                db.Lops.InsertOnSubmit(l);
                db.SubmitChanges();
            }
            catch
            {
                kq = false;
            }
            return kq;
        }

        public override bool CapNhap(EntityClass objectClass)
        {
            bool kq = true;
            LopDTO loptam = (LopDTO)objectClass;
            try
            {
                QLNTDataContext db = new QLNTDataContext();
                var query = db.Lops.Single(k => k.MaLop == loptam.MaLop);
                query.TenLop = loptam.TenLop;
                query.SiSo = loptam.SiSo;
                query.DoTuoi = loptam.DoTuoi;
                var khoi = db.Khois.Single(k => k.TenKhoi == loptam.TenKhoi);
                query.MaKhoi = khoi.MaKhoi;
                db.SubmitChanges();
            }
            catch
            {
                kq = false;
            }
            return kq;
        }

        public override bool Xoa(int ma)
        {
            bool kq = true;
            try
            {
                QLNTDataContext db = new QLNTDataContext();
                var query = db.Lops.Single(k => k.MaLop == ma);
                db.Lops.DeleteOnSubmit(query);
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
