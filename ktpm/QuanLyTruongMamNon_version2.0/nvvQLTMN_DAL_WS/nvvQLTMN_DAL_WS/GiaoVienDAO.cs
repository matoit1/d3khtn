using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
//using DTO;

namespace nvvQLTMN_DAL_WS
{
    public class GiaoVienDAO : CharacterMethod
    {
        public List<GiaoVienDTO> LayDanhSachGiaoVien()
        {
            QLNTDataContext db = new QLNTDataContext();
            var query = from gv in db.GiaoViens join l in db.Lops on gv.MaLop equals l.MaLop select new GiaoVienDTO() { MaGiaoVien =gv.MaGiaoVien, TenGiaoVien =gv.TenGiaoVien, GioiTinh =gv.GioiTinh, NgaySinh =gv.NgaySinh, SoDienThoai =gv.SoDienThoai, DiaChi =gv.DiaChi, BangCap =gv.BangCap, ChucVu =gv.ChucVu, Luong =gv.MucLuong, TenLopPhuTrach =l.TenLop};

            return query.ToList<GiaoVienDTO>();
        }

        public bool ThemGiaoVien(GiaoVienDTO gvtam)
        {
            bool kq = true;
            try
            {
                QLNTDataContext db = new QLNTDataContext();
                var query = db.Lops.Single(k => k.TenLop == gvtam.TenLopPhuTrach);

                GiaoVien gv = new GiaoVien();
                gv.TenGiaoVien = gvtam.TenGiaoVien;
                gv.GioiTinh = gvtam.GioiTinh;
                gv.SoDienThoai = gvtam.SoDienThoai;
                gv.MucLuong = gvtam.Luong;
                gv.DiaChi = gvtam.DiaChi;
                gv.BangCap = gvtam.BangCap;
                gv.ChucVu = gvtam.ChucVu;
                gv.NgaySinh = gvtam.NgaySinh;
                gv.MaLop = query.MaLop;

                db.GiaoViens.InsertOnSubmit(gv);
                db.SubmitChanges();
            }
            catch
            {
                kq = false;
            }
            return kq;
        }
        public bool CapNhapGiaoVien(GiaoVienDTO gvtam)
        {
            bool kq = true;
            try
            {
                QLNTDataContext db = new QLNTDataContext();
                var gv = db.GiaoViens.Single(g => g.MaGiaoVien == gvtam.MaGiaoVien);
                gv.TenGiaoVien = gvtam.TenGiaoVien;
                gv.GioiTinh = gvtam.GioiTinh;
                gv.SoDienThoai = gvtam.SoDienThoai;
                gv.MucLuong = gvtam.Luong;
                gv.DiaChi = gvtam.DiaChi;
                gv.BangCap = gvtam.BangCap;
                gv.ChucVu = gvtam.ChucVu;
                gv.NgaySinh = gvtam.NgaySinh;
                var query = db.Lops.Single(k => k.TenLop == gvtam.TenLopPhuTrach);
                gv.MaLop = query.MaLop;

                db.SubmitChanges();
            }
            catch
            {
                kq = false;
            }
            return kq;
        }
        public bool XoaGiaoVien(int maGv)
        {
            bool kq = true;
            try
            {
                QLNTDataContext db = new QLNTDataContext();
                var query = db.GiaoViens.Single(gv => gv.MaGiaoVien == maGv);
                db.GiaoViens.DeleteOnSubmit(query);
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
