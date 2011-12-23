using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace nvvQLTMN_DAL_WS
{
    public class KhoiDTO
    {
        int maKhoi;

        public int MaKhoi
        {
            get { return maKhoi; }
            set { maKhoi = value; }
        }
        string tenKhoi;

        public string TenKhoi
        {
            get { return tenKhoi; }
            set { tenKhoi = value; }
        }
        int soLop;

        public int SoLop
        {
            get { return soLop; }
            set { soLop = value; }
        }
    }
}
