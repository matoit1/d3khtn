using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace nvvQLTMN_DAL_WS
{
    public class LopDTO
    {
        int maLop;

        public int MaLop
        {
            get { return maLop; }
            set { maLop = value; }
        }
        string tenLop;

        public string TenLop
        {
            get { return tenLop; }
            set { tenLop = value; }
        }
        string doTuoi;

        public string DoTuoi
        {
            get { return doTuoi; }
            set { doTuoi = value; }
        }
        int siSo;

        public int SiSo
        {
            get { return siSo; }
            set { siSo = value; }
        }
        string tenKhoi;

        public string TenKhoi
        {
            get { return tenKhoi; }
            set { tenKhoi = value; }
        }
    }
}
