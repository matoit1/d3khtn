using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace nvvQLTMN_DAL_WS
{
    public class TruongDTO
    {
        int maTruong;

        public int MaTruong
        {
            get { return maTruong; }
            set { maTruong = value; }
        }
        string tenTruong;

        public string TenTruong
        {
            get { return tenTruong; }
            set { tenTruong = value; }
        }
        string diaChi;

        public string DiaChi
        {
            get { return diaChi; }
            set { diaChi = value; }
        }
        string sdt;

        public string Sdt
        {
            get { return sdt; }
            set { sdt = value; }
        }
    }
}
