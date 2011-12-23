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
    public class PhuHuynhBUS
    {
        private nvv_QLTMN_DAL_WS.Service1 ws = new nvvQLNT_BUS_WS.nvv_QLTMN_DAL_WS.Service1();
        private PhuHuynhDTO ph = new PhuHuynhDTO();
        public PhuHuynhDTO phuHuynh
        {
            get { return ph; }
            set { ph = value; }
        }
        public List<PhuHuynhDTO> LayThongTinPhuHuynh(int maphuhuynh)
        {
            return ws.LayThongTinPhuHuynh(maphuhuynh).ToList();
        }

        public int ThemPhuHuynh()
        {
            return ws.ThemPhuHuynh(ph);
        }

        public bool CapNhapPhuHuynh()
        {
            return ws.CapNhapPhuHuynh(ph);
        }

        public bool XoaPhuHuynh(int maPH)
        {
            return ws.XoaPhuHuynh(maPH);
        }
    }
}
