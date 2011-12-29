using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using RemoteObjectEngine.nvvQLTMN_BUS_WS;

namespace RemoteObjectEngine
{
    public class GiaoVien
    {
        public static List<GiaoVienDTO> LayDanhSachGiaoVien()
        {
            return RemoteObjectManager.Service.LayDanhSachGiaoVien().ToList();
        }

        public static bool ThemGiaoVien(GiaoVienDTO gvtam)
        {
            return RemoteObjectManager.Service.ThemGiaoVien(gvtam);
        }

        public static bool CapNhapGiaoVien(GiaoVienDTO gvtam)
        {
            return RemoteObjectManager.Service.ThemGiaoVien(gvtam);
        }

        public static bool XoaGiaoVien(GiaoVienDTO gvtam)
        {
            return RemoteObjectManager.Service.XoaGiaoVien(gvtam);
        }
    }
}
