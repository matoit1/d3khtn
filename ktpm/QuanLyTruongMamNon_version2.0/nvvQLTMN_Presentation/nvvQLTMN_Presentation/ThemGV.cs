using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using RemoteObjectEngine;
using RemoteObjectEngine.nvvQLTMN_BUS_WS;

namespace nvvQLTMN_Presentation
{
    public partial class ThemGV : Form
    {
        
        public ThemGV()
        {
            InitializeComponent();
        }

        private void ThemGV_Load(object sender, EventArgs e)
        {
            rBtnNam.Checked = true;
            cbbTenLop.DataSource = RemoteObjectEngine.Lop.LayDanhSachLop();
            cbbTenLop.DisplayMember = "TenLop";

        }

        private void button1_Click(object sender, EventArgs e)
        {
            GiaoVienDTO gv = new GiaoVienDTO();
            gv.TenGiaoVien = tbTen.Text;
            gv.Luong = tbLuong.Text;
            gv.SoDienThoai = tbSDT.Text;
            gv.BangCap = tbBangCap.Text;
            gv.ChucVu = tbChucVu.Text;
            gv.DiaChi = tbDiaChi.Text;
            gv.TenLopPhuTrach = cbbTenLop.Text;
            if (rBtnNam.Checked == true)
                gv.GioiTinh = "Nam";
            else gv.GioiTinh = "Nữ";
            gv.NgaySinh = dtNgaySinh.Value;
            if (tbTen.Text.Trim() != "" && tbLuong.Text.Trim() != "" && tbBangCap.Text.Trim() != "")
            {
                if (RemoteObjectEngine.GiaoVien.ThemGiaoVien(gv) == true)
                    MessageBox.Show("Thêm Giáo Viên thành công!");
                else MessageBox.Show("Thêm Giáo Viên thất bại!");
            }
            else MessageBox.Show("Vui lòng điền đầy đủ thông tin!");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            TraCuuGiaoVien frmTCGV = new TraCuuGiaoVien();
            frmTCGV.Show();
        }
    }
}
