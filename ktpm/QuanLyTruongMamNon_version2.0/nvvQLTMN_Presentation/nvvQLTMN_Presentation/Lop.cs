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
    public partial class Lop : Form
    {
        
        public Lop()
        {
            InitializeComponent();
        }
        public void LoadDanhSachLop()
        {
            IList<LopDTO> dsLop = RemoteObjectEngine.Lop.LayDanhSachLop();
            dataGridView1.DataSource = dsLop;
            for (int i = 0; i < dsLop.Count; i++)
            {
                dataGridView1.Rows[i].Tag = dsLop[i];
            }
            dataGridView1.Columns[0].HeaderText = "Mã Lớp";
            dataGridView1.Columns[1].HeaderText = "Tên Lớp";
            dataGridView1.Columns[2].HeaderText = "Độ Tuổi";
            dataGridView1.Columns[3].HeaderText = "Sỉ Số";
            dataGridView1.Columns[4].HeaderText = "Tên Khối";
        }
        private void Lop_Load(object sender, EventArgs e)
        {

            LoadDanhSachLop();
            cbbTenKhoi.DataSource = RemoteObjectEngine.Khoi.LayDanhSachKhoi();
            cbbTenKhoi.DisplayMember = "TenKhoi";
        }

        private void btnThemLop_Click(object sender, EventArgs e)
        {
            ThemLop frmThemLop = new ThemLop();
            frmThemLop.ShowDialog();
            LoadDanhSachLop();

        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            if (dataGridView1.CurrentRow.Tag != null)
            {
                
                LopDTO lop = (LopDTO) dataGridView1.CurrentRow.Tag;
                tbTenLop.Text =lop.TenLop;
                tbSiSo.Text=lop.SiSo.ToString();
                tbDoTuoi.Text =lop.DoTuoi;
                IList<KhoiDTO> DSkhoi= RemoteObjectEngine.Khoi.LayDanhSachKhoi();
                for(int i=0;i<DSkhoi.Count;i++)
                {
                    if (DSkhoi[i].TenKhoi == lop.TenKhoi)
                    {
                        cbbTenKhoi.SelectedIndex = i;
                    }
                }
                
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có chắc muốn xóa ko?", "Hỏi", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                if (dataGridView1.CurrentRow.Tag != null)
                {
                    LopDTO lop = (LopDTO)dataGridView1.CurrentRow.Tag;
                    if (RemoteObjectEngine.Lop.XoaLop(lop) == true)
                    {
                        MessageBox.Show("Xóa Lớp thành công!");

                    }
                    else MessageBox.Show("Xóa Lớp thất bại!");
                    LoadDanhSachLop();

                }
            }
        }

        private void btnCapNhapLop_Click(object sender, EventArgs e)
        {

            if (dataGridView1.CurrentRow.Tag != null)
            {
                LopDTO lop = (LopDTO)dataGridView1.CurrentRow.Tag;
                lop.TenLop = tbTenLop.Text;
                lop.DoTuoi = tbDoTuoi.Text;
                if (FormMain.KiemTraChuoiLaSo(tbSiSo.Text) == true)
                    lop.SiSo = int.Parse(tbSiSo.Text);
                lop.TenKhoi = cbbTenKhoi.Text;
                if (tbTenLop.Text.Trim() != "" && tbDoTuoi.Text.Trim() != "" && tbSiSo.Text.Trim() != "" && FormMain.KiemTraChuoiLaSo(tbSiSo.Text) == true)
                {
                    if (RemoteObjectEngine.Lop.CapNhapLop(lop) == true)
                        MessageBox.Show("Cập nhập Lớp thành công!");
                    else MessageBox.Show("Cập nhập Lớp thất bại!");
                }
                else MessageBox.Show("Vui lòng điền đầy đủ thông tin!");
                LoadDanhSachLop();
            }
        }
    }
}
