using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
//using DTO;

namespace nvvQLTMN_DAL_WS
{
    public class TreDAO
    {
        public List<TreDTO> LayDanhSachTre()
        {
            QLNTDataContext db = new QLNTDataContext();
            var query = from l in db.Tres join k in db.Lops on l.MaLop equals k.MaLop select new TreDTO() { MaTre =l.MaTre, HoTen =l.HoTen, GioiTinh =l.GioiTinh, NgaySinh =l.NgaySinh, ConThu =l.ConThu, MaPhuHuynh =l.MaPhuHuynh, MaTinhTrangSucKhoe =l.MaTinhTrangSucKhoe, TenLop =k.TenLop};
            return query.ToList<TreDTO>();
        }
        public List<TreDTO> LayDSTreTheoLop(string tenlop)
        {
            QLNTDataContext db = new QLNTDataContext();
            var query = from l in db.Tres join k in db.Lops on l.MaLop equals k.MaLop where k.TenLop == tenlop select new TreDTO() { MaTre = l.MaTre, HoTen = l.HoTen, GioiTinh = l.GioiTinh, NgaySinh = l.NgaySinh, ConThu = l.ConThu, MaPhuHuynh = l.MaPhuHuynh, MaTinhTrangSucKhoe = l.MaTinhTrangSucKhoe, TenLop = k.TenLop };
            return query.ToList<TreDTO>();
        }
        public bool ThemTre(TreDTO tretam)
        {
            bool kq = true;
            try
            {
                QLNTDataContext db = new QLNTDataContext();
                var query = db.Lops.Single(k => k.TenLop == tretam.TenLop);
                Tre t = new Tre();
                t.HoTen = tretam.HoTen;
                t.NgaySinh = tretam.NgaySinh;
                t.GioiTinh = tretam.GioiTinh;
                t.ConThu = tretam.ConThu;
                t.MaPhuHuynh = tretam.MaPhuHuynh;
                t.MaTinhTrangSucKhoe = tretam.MaTinhTrangSucKhoe;
                t.MaLop = query.MaLop;

                db.Tres.InsertOnSubmit(t);
                db.SubmitChanges();
            }
            catch
            {
                kq = false;
            }
            return kq;
        }
        public bool CapNhapTre(TreDTO tretam)
        {
            bool kq = true;
            try
            {
                QLNTDataContext db = new QLNTDataContext();
                var query = db.Tres.Single(k => k.MaTre == tretam.MaTre);
                query.HoTen = tretam.HoTen;
                query.GioiTinh = tretam.GioiTinh;
                query.ConThu = tretam.ConThu;
                query.NgaySinh = tretam.NgaySinh;
                 var lop = db.Lops.Single(k => k.TenLop == tretam.TenLop);
                 query.MaLop = lop.MaLop;
                db.SubmitChanges();
            }
            catch
            {
                kq = false;
            }
            return kq;
        }
        public bool XoaTre(TreDTO tretam)
        {
            bool kq = true;
            try
            {
                QLNTDataContext db = new QLNTDataContext();
                var query = db.Tres.Single(k => k.MaTre == tretam.MaTre);
                db.Tres.DeleteOnSubmit(query);
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
