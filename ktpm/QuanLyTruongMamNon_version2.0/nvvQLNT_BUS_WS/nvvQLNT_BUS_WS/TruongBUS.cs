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
    public class TruongBUS
    {
        private nvv_QLTMN_DAL_WS.Service1 ws = new nvvQLNT_BUS_WS.nvv_QLTMN_DAL_WS.Service1();
        private TruongDTO tr = new TruongDTO();
        public TruongDTO truong
        {
            get { return tr; }
            set { tr = value; }
        }
        public TruongDTO LayThongTinTruong()
        {
            return ws.LayThongTinTruong();
        }
        
        public bool SuaThongTinTruong()
        {
            return ws.SuaThongTinTruong(tr);
        }
    }
}
