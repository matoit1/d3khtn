using System;
using System.Collections.Generic;
using System.Linq;

namespace DauGia.Models
{
    public static class LoaiSanPhamDAO
    {
        public static DauGiaDataContext dg = new DauGiaDataContext();
        public static List<LoaiSanPham> LayDSLoaiSanPham()
        {
            return dg.LoaiSanPhams.ToList();
        }

    }
}
