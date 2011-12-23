using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace nvvQLTMN_DAL_WS
{
    public class TreDTO
    {
        int maTre;

        public int MaTre
        {
            get { return maTre; }
            set { maTre = value; }
        }
        string hoTen;

        public string HoTen
        {
            get { return hoTen; }
            set { hoTen = value; }
        }
        string gioiTinh;

        public string GioiTinh
        {
            get { return gioiTinh; }
            set { gioiTinh = value; }
        }
        DateTime ngaySinh;

        public DateTime NgaySinh
        {
            get { return ngaySinh; }
            set { ngaySinh = value; }
        }
        int conThu;

        public int ConThu
        {
            get { return conThu; }
            set { conThu = value; }
        }
        public string TenLop
        {
            get { return tenLop; }
            set { tenLop = value; }
        }
        int maTinhTrangSucKhoe;

        public int MaTinhTrangSucKhoe
        {
            get { return maTinhTrangSucKhoe; }
            set { maTinhTrangSucKhoe = value; }
        }
        int maPhuHuynh;

        public int MaPhuHuynh
        {
            get { return maPhuHuynh; }
            set { maPhuHuynh = value; }
        }
        string tenLop;

    
    }
}
