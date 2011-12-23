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
    public partial class ThemLop : Form
    {
        public nvvQLTMN_BUS_WS.Service1 ws = new Service1();
        public ThemLop()
        {
            InitializeComponent();
        }

        private void ThemLop_Load(object sender, EventArgs e)
        {
            cbbTenKhoi.DataSource = ws.LayDanhSachKhoi();
            cbbTenKhoi.DisplayMember = "TenKhoi";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            LopDTO lop = new LopDTO();
            lop.TenLop = tbTenLop.Text;
            lop.DoTuoi = tbDoTuoi.Text;
            if(FormMain.KiemTraChuoiLaSo(tbSiSo.Text)==true)
                lop.SiSo = int.Parse(tbSiSo.Text);
            lop.TenKhoi = cbbTenKhoi.Text;
            if (tbTenLop.Text.Trim() != "" && tbDoTuoi.Text.Trim() != "" && tbSiSo.Text.Trim() != "" && FormMain.KiemTraChuoiLaSo(tbSiSo.Text) == true)
            {
                if (ws.ThemLop(lop) == true)
                    MessageBox.Show("Thêm Lớp thành công!");
                else MessageBox.Show("Thêm Lớp thất bại!");
            }
            else MessageBox.Show("Vui lòng điền đầy đủ thông tin!");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}
