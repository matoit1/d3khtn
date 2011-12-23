using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections.Generic;
using nvvQLNT_BUS_WS.nvv_QLTMN_DAL_WS;

namespace nvvQLNT_BUS_WS
{
    public class GiaoVienBUS
    {
        private GiaoVienDTO gv = new GiaoVienDTO();
        private nvv_QLTMN_DAL_WS.Service1 ws = new nvvQLNT_BUS_WS.nvv_QLTMN_DAL_WS.Service1();

        public GiaoVienDTO giaoVien
        {
            get { return gv; }
            set { gv = value; }
        }
        public List<GiaoVienDTO> LayDanhSachGiaoVien()
        {
            return ws.LayDanhSachGiaoVien().ToList();
        }
        public bool CapNhapGiaoVien()
        {
            return ws.CapNhapGiaoVien(gv);
        }
        public bool ThemGiaoVien()
        {
            return ws.ThemGiaoVien(gv);
        }
        public bool XoaGiaoVien()
        {
            return ws.XoaGiaoVien(gv);
        }
    }
}
