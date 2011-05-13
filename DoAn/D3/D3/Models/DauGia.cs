using System;
using System.Collections.Generic;
using System.Linq;


namespace D3.Models
{
    partial class DauGiaDataContext
    {
        public List<SanPham> LayDSSanPham()
        {
            return SanPhams.ToList();
        }
        public List<LoaiSanPham> LayDSLoaiSanPham()
        {
            return LoaiSanPhams.ToList();
        }
        public string LayHinhAnhSanPham(string maSanPham)
        {
            var query = Multimedias.Join(SanPham_Multimedias.Where(c => c.MaSanPham.Contains(maSanPham)),
                                        hinhanh => hinhanh.MaMT,
                                        sp => sp.MaMT,
                                        (hinhanh, sp) => new { hinhanh, sp });
            foreach (var tam in query)
                return tam.hinhanh.LinkURL;
            return null;

        }
        public List<SanPham> LayDSSanPhamTheoTrang(int soTrang)
        {
            int end = soTrang * 9;
            int start = end - 9;
            var query = SanPhams.Select(sp => sp).Skip(start).Take(end - soTrang+1);
            return query.ToList();
        }
        public List<SanPham> TimSanPhamTheoTen(string tenSanPham)
        {
            var query = SanPhams.Where(sp => sp.TenSanPham.Contains(tenSanPham));
            return query.ToList();
        }
        public List<SanPham> TimSanPhamTheoLoaiSanPham(String loaiSanPham)
        {
            var query = SanPhams.Where(sp => sp.MaLoaiSanPham.Contains(loaiSanPham));
            return query.ToList();
        }
        public List<SanPham> TimSanPhamMoiDang()
        {
            var query = SanPhams.OrderByDescending(sp => sp.NgayDang).Take(9);
            return query.ToList();
        }
        public SanPham TimSanPhamTheoMaSanPham(string maSanPham)
        {
            var query = SanPhams.Where(sp => sp.MaSanPham==maSanPham).First();
            SanPham sanPham = new SanPham();
            sanPham = (SanPham)query;
            return sanPham;
        }
        public List<SanPham> TimSanPhamDauGiaNhieuNhat()
        {
            var query = ChiTietDauGias.GroupBy(chitiet => new { chitiet.MaSanPham }).Select(key=>new {key.Key.MaSanPham,SoLuong=key.Count()}).OrderByDescending(nhieunhat=>nhieunhat.SoLuong).Take(9);
            List<SanPham> ds = new List<SanPham>();
            foreach (var c in query)
            {
                if(c.MaSanPham!=null)
                ds.Add(TimSanPhamTheoMaSanPham(c.MaSanPham));

            }
            return ds;
        }
    }
}
