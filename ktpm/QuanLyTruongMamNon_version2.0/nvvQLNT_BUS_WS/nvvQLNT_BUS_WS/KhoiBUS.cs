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
    public class KhoiBUS
    {
        private KhoiDTO kh = new KhoiDTO();
        private nvv_QLTMN_DAL_WS.Service1 ws = new nvvQLNT_BUS_WS.nvv_QLTMN_DAL_WS.Service1();

        public KhoiDTO khoi
        {
            get { return kh; }
            set { kh = value; }
        }
        public List<KhoiDTO> LayDanhSachKhoi()
        {
            return ws.LayDanhSachKhoi().ToList();
        }
    }
}
