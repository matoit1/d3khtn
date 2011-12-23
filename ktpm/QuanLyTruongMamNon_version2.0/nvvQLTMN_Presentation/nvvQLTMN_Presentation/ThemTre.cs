using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using nvvQLTMN_Presentation.nvvQLTMN_BUS_WS;

namespace nvvQLTMN_Presentation
{
    public partial class ThemTre : Form
    {
        public nvvQLTMN_BUS_WS.Service1 ws = new Service1();
        public ThemTre()
        {
            InitializeComponent();
        }

        private void ThemTre_Load(object sender, EventArgs e)
        {
            rBtnNam.Checked= true;
            cbbTenLop.DataSource = ws.LayDanhSachLop();
            cbbTenLop.DisplayMember = "TenLop";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //them phu huynh
            PhuHuynhDTO ph = new PhuHuynhDTO();
            ph.TenCha = tbTenCha.Text;
            ph.TenMe = tbTenme.Text;
            ph.SdtCha = tbSDTCha.Text;
            ph.SdtMe = tbSDTME.Text;
            ph.NgheNghiepCha = tbCoQuanCha.Text; ;
            ph.NgheNghiepMe = tbCqMe.Text;
            if (FormMain.KiemTraChuoiLaSo(tbTuoiCha.Text) == true && FormMain.KiemTraChuoiLaSo(tbTuoiMe.Text) == true)
            {
                ph.TuoiCha = int.Parse(tbTuoiCha.Text);
                ph.TuoiMe = int.Parse(tbTuoiMe.Text);
            }
            int maPhuHuynh = ws.ThemPhuHuynh(ph);
            //them suc khoe
            TinhTrangSucKhoeDTO sk = new TinhTrangSucKhoeDTO();
            sk.BenhDiTruyen = tbDiTruyen.Text;
            if (FormMain.KiemTraChuoiLaSo(tbCanNang.Text.Trim()) == true && FormMain.KiemTraChuoiLaSo(tbChieuCao.Text.Trim()) == true)
            {
                sk.ChieuCao = float.Parse(tbCanNang.Text);
                sk.CanNang = float.Parse(tbChieuCao.Text);
            }
            sk.DaNiemMac = tbDaNiemmac.Text;
            sk.DinhDuong = tbDinhDuong.Text;
            sk.DuongHoHap = tbHohap.Text;
            sk.HeTimMach = tbTimMach.Text;
            sk.Mat = tbMat.Text;
            sk.RangHamMat = tbRanghamMat.Text;
            sk.TaiMuiHong = tbRanghamMat.Text;
            sk.TiemNgua = tbTiemNgua.Text;
            int maSK = ws.ThemSucKhoe(sk);
            //them tre
            if (maSK != -1 && maPhuHuynh != -1)
            {
                TreDTO tre = new TreDTO();
                tre.HoTen = tbTenTre.Text;
                tre.ConThu = int.Parse(tbConThu.Text);
                tre.NgaySinh = dtNgaySinh.Value;
                tre.TenLop = cbbTenLop.Text;
                if (rBtnNam.Checked == true)
                    tre.GioiTinh = "Nam";
                else tre.GioiTinh = "Nữ";
                tre.MaPhuHuynh = maPhuHuynh;
                tre.MaTinhTrangSucKhoe = maSK;
                if (tbTenTre.Text.Trim() != "" && tbConThu.Text.Trim() != "" && FormMain.KiemTraChuoiLaSo(tbConThu.Text) ==true)
                {
                    if (ws.ThemTre(tre) == true)
                        MessageBox.Show("Thêm Trẻ thành công!");
                    else MessageBox.Show("Thêm Trẻ thất bại!");
                }
                else MessageBox.Show("Vui lòng điền đầy đủ thông tin!");
            }
            else MessageBox.Show("Không thêm được thông tin sức khỏe hoặc phụ huynh");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            TraCuuTre frmTre = new TraCuuTre();
            frmTre.Show();
        }


    }
}
