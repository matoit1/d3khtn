using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace nvvQLTMN_DAL_WS
{
    public class GiaoVienDTO : CharacterClass
    {
        int maGiaoVien;

        public int MaGiaoVien
        {
            get { return maGiaoVien; }
            set { maGiaoVien = value; }
        }
        string tenGiaoVien;

        public string TenGiaoVien
        {
            get { return tenGiaoVien; }
            set { tenGiaoVien = value; }
        }
        string gioiTinh;

        public string GioiTinh
        {
            get { return gioiTinh; }
            set { gioiTinh = value; }
        }
        string diaChi;

        public string DiaChi
        {
            get { return diaChi; }
            set { diaChi = value; }
        }
        DateTime ngaySinh;

        public DateTime NgaySinh
        {
            get { return ngaySinh; }
            set { ngaySinh = value; }
        }
        string soDienThoai;

        public string SoDienThoai
        {
            get { return soDienThoai; }
            set { soDienThoai = value; }
        }
        string chucVu;

        public string ChucVu
        {
            get { return chucVu; }
            set { chucVu = value; }
        }
        string bangCap;

        public string BangCap
        {
            get { return bangCap; }
            set { bangCap = value; }
        }
        string luong;

        public string Luong
        {
            get { return luong; }
            set { luong = value; }
        }
        string tenLopPhuTrach;

        public string TenLopPhuTrach
        {
            get { return tenLopPhuTrach; }
            set { tenLopPhuTrach = value; }
        }
    }
}
