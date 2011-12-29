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
    public partial class GiaoVien : Form
    {
        
        public GiaoVien()
        {
            InitializeComponent();
        }
        public IList<GiaoVienDTO> DSGV;
        public void LoadDSGV()
        {
            DSGV = RemoteObjectEngine.GiaoVien.LayDanhSachGiaoVien();
            dataGridView1.DataSource = DSGV;
            for (int i = 0; i < DSGV.Count; i++)
            {
                dataGridView1.Rows[i].Tag = DSGV[i];
            }
            dataGridView1.Columns[0].HeaderText = "Mã Giáo Viên";
            dataGridView1.Columns[1].HeaderText = "Tên Giáo Viên";
            dataGridView1.Columns[2].HeaderText = "Giới Tính";
            dataGridView1.Columns[3].HeaderText = "Địa Chỉ";
            dataGridView1.Columns[4].HeaderText = "Ngày Sinh";
            dataGridView1.Columns[5].HeaderText = "Số Điện Thoại";
            dataGridView1.Columns[6].HeaderText = "Chức Vụ";
            dataGridView1.Columns[7].HeaderText = "Bằng Cấp";
            dataGridView1.Columns[8].HeaderText = "Lương";
            dataGridView1.Columns[9].HeaderText = "Tên Lớp Phụ Trách";
        }
        private void GiaoVien_Load(object sender, EventArgs e)
        {
            LoadDSGV();
            cbbTenLop.DataSource = RemoteObjectEngine.Lop.LayDanhSachLop();
            cbbTenLop.DisplayMember = "TenLop";

        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridView1.CurrentRow.Tag != null)
            {

                GiaoVienDTO gv =(GiaoVienDTO) dataGridView1.CurrentRow.Tag;
                tbTen.Text = gv.TenGiaoVien;
                tbSDT.Text = gv.SoDienThoai;
                tbBangCap.Text = gv.BangCap;
                tbDiaChi.Text = gv.DiaChi;
                tbLuong.Text = gv.Luong;
                tbChucVu.Text = gv.ChucVu;
                if (gv.GioiTinh == "Nam")
                    rBtnNam.Checked = true;
                else rBtnNu.Checked = true;
                dtNgaySinh.Value = gv.NgaySinh;

                IList<LopDTO> DSLop = RemoteObjectEngine.Lop.LayDanhSachLop();
                for (int i = 0; i < DSLop.Count; i++)
                {
                    if (DSLop[i].TenLop == gv.TenLopPhuTrach)
                    {
                        cbbTenLop.SelectedIndex = i;
                    }
                }

            }
        }

        private void btnCapNhap_Click(object sender, EventArgs e)
        {
            if (dataGridView1.CurrentRow.Tag != null)
            {
                GiaoVienDTO gv = (GiaoVienDTO)dataGridView1.CurrentRow.Tag;
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
                    if (RemoteObjectEngine.GiaoVien.CapNhapGiaoVien(gv) == true)
                        MessageBox.Show("Cập nhập Giáo Viên thành công!");
                    else MessageBox.Show("Cập nhập Giáo Viên thất bại!");
                }
                else MessageBox.Show("Vui lòng điền đầy đủ thông tin!");
                LoadDSGV();

            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có chắc muốn xóa ko?", "Hỏi", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                if (dataGridView1.CurrentRow.Tag != null)
                {
                    GiaoVienDTO gv = (GiaoVienDTO)dataGridView1.CurrentRow.Tag;
                    if (RemoteObjectEngine.GiaoVien.XoaGiaoVien(gv)== true)
                    {
                        MessageBox.Show("Xóa Giáo Viên thành công!");

                    }
                    else MessageBox.Show("Xóa Giáo Viên thất bại!");
                    LoadDSGV();

                }
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            ThemGV frmThemGV = new ThemGV();
            frmThemGV.ShowDialog();
            LoadDSGV();
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            TraCuuGiaoVien frmTCGV = new TraCuuGiaoVien();
            frmTCGV.Show();
        }
    }
}
