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
    public class TreBUS
    {
        private nvv_QLTMN_DAL_WS.Service1 ws = new nvvQLNT_BUS_WS.nvv_QLTMN_DAL_WS.Service1();
        private TreDTO tr = new TreDTO();
        public TreDTO tre
        {
            get { return tr; }
            set { tr = value; }
        }
        public List<TreDTO> LayDanhSachTre()
        {
            return ws.LayDanhSachTre().ToList();
        }
        
        public List<TreDTO> LayDSTreTheoLop(string tenlop)
        {
            return ws.LayDSTreTheoLop(tenlop).ToList();
        }
      
        public bool ThemTre()
        {
            return ws.ThemTre(tr);
        }
       
        public bool CapNhapTre()
        { 
            return ws.CapNhapTre(tr);
        }
        public bool XoaTre()
        {
            return ws.XoaTre(tr.MaTre);
        }
    }
}
