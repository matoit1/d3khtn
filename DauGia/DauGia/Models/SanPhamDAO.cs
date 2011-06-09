using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DauGia.Models
{
    public class SanPhamDAO
    {
        public static DauGiaEntities dg = new DauGiaEntities();
        public static List<SanPham> LayDSSanPham()
        {
            return dg.SanPhams.ToList();
        }



        public static string LayHinhAnhSanPham(int maSanPham)
        {

            var query = dg.Multimedias.Join(dg.SanPham_Multimedia.Where(c => c.MaSanPham == maSanPham),
                                        hinhanh => hinhanh.MaMT,
                                        sp => sp.MaMT,
                                        (hinhanh, sp) => new { hinhanh, sp });
            foreach (var tam in query)
                return tam.hinhanh.LinkURL;
            return null;

        }
        public static List<SanPham> LayDSSanPhamTheoTrang(int soTrang)
        {
            int end = soTrang * 9;
            int start = end - 9;
            var query = dg.SanPhams.Select(sp => sp).OrderBy(c => c.NgayDang).Skip(start).Take(end - soTrang + 1);
            return query.ToList();
        }

        public static List<SanPham> TimSanPhamTheoTen(string tenSanPham)
        {
            var query = dg.SanPhams.Where(sp => sp.TenSanPham.Contains(tenSanPham));
            return query.ToList();
        }

        public static List<SanPham> TimSanPhamTheoLoaiSanPham(int loaiSanPham)
        {
            var query = dg.SanPhams.Where(sp => sp.MaLoaiSanPham == loaiSanPham);
            return query.ToList();
        }
        public static List<SanPham> TimSanPhamMoiDang()
        {
            var query = dg.SanPhams.OrderByDescending(sp => sp.NgayDang).Take(9);
            return query.ToList();
        }
        public static SanPham TimSanPhamTheoMaSanPham(int maSanPham)
        {
            var query = dg.SanPhams.Where(sp => sp.MaSanPham == maSanPham).First();
            SanPham sanPham = new SanPham();
            sanPham = (SanPham)query;
            return sanPham;
        }
        public static List<SanPham> TimSanPhamDauGiaNhieuNhat()
        {
            var query = dg.ChiTietDauGias.GroupBy(chitiet => new { chitiet.MaSanPham }).Select(row => new { row.Key.MaSanPham, SoLuong = row.Count() }).OrderByDescending(nhieunhat => nhieunhat.SoLuong).Take(9);
            List<SanPham> ds = new List<SanPham>();
            foreach (var c in query)
            {
                ds.Add(TimSanPhamTheoMaSanPham(c.MaSanPham));

            }
            return ds;
        }
    }
}