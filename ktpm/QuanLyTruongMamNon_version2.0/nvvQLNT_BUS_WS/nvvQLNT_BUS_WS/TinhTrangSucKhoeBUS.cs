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
    public class TinhTrangSucKhoeBUS
    {
        private nvv_QLTMN_DAL_WS.Service1 ws = new nvvQLNT_BUS_WS.nvv_QLTMN_DAL_WS.Service1();
        private TinhTrangSucKhoeDTO sk = new TinhTrangSucKhoeDTO();
        public TinhTrangSucKhoeDTO sucKhoe
        {
            get { return sk; }
            set { sk = value; }
        }
        public List<TinhTrangSucKhoeDTO> LayThongTinSucKhoe(int masuckhoe)
        {
            return ws.LayThongTinSucKhoe(masuckhoe).ToList();
        }
       
        public int ThemSucKhoe()
        {
            return ws.ThemSucKhoe(sk);
        }

        public bool CapNhapSucKhoe()
        {
            return ws.CapNhapSucKhoe(sk);
        }

        public bool XoaSucKhoe(int maSk)
        {
            return ws.XoaSucKhoe(maSk);
        }
    }
}
