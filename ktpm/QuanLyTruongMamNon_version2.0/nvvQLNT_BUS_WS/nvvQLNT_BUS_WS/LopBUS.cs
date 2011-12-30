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
    public class LopBUS
    {
        private nvv_QLTMN_DAL_WS.Service1 ws = new nvvQLNT_BUS_WS.nvv_QLTMN_DAL_WS.Service1();
        private LopDTO lp = new LopDTO();
        public LopDTO lop
        {
          get { return lp; }
          set { lp = value; }
        }
        public List<LopDTO> LayDanhSachLop()
        {
            return ws.LayDanhSachLop().ToList();
        }

        public bool ThemLop()
        {
            return ws.ThemLop(lp);
        }

        public bool CapNhapLop()
        {
            return ws.CapNhapLop(lp);
        }

        public bool XoaLop()
        {
            return ws.XoaLop(lp.MaLop);
        }

}
}
