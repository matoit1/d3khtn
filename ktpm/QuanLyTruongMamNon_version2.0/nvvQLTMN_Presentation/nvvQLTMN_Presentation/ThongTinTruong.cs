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
    public partial class ThongTinTruong : Form
    {
        public nvvQLTMN_BUS_WS.Service1 ws = new Service1();
        public ThongTinTruong()
        {
            InitializeComponent();
        }

        private void ThongTinTruong_Load(object sender, EventArgs e)
        {
            TruongDTO truong = ws.LayThongTinTruong();
            textBox1.Text = truong.TenTruong;
            textBox2.Text = truong.DiaChi;
            textBox3.Text = truong.Sdt;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text.Trim() != "" && textBox2.Text.Trim() != "" && textBox3.Text.Trim() != "")
            {
                TruongDTO truong = new TruongDTO();
                truong.TenTruong = textBox1.Text;
                truong.DiaChi = textBox2.Text;
                truong.Sdt = textBox3.Text;
                if (ws.SuaThongTinTruong(truong) == true)
                    MessageBox.Show("Cập nhập thành công!");
                else MessageBox.Show("Cập nhập thất bại!");
            }
            else MessageBox.Show("Vui lòng điển đầy đủ thông tin!");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}
