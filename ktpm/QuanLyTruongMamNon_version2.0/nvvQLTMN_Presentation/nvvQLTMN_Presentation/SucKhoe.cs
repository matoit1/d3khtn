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
    public partial class SucKhoe : Form
    {
        public nvvQLTMN_BUS_WS.Service1 ws = new Service1();
        public SucKhoe()
        {
            InitializeComponent();
        }
        TinhTrangSucKhoeDTO sk = new TinhTrangSucKhoeDTO();
        private void SucKhoe_Load(object sender, EventArgs e)
        {
            label1.Text += " " + Tre.TenTreDuocChon;
            IList<TinhTrangSucKhoeDTO> DSSK = ws.LayThongTinSucKhoe(Tre.maSucKhoe);
            sk = DSSK[0];
            textBox1.Text = sk.MaTinhTrangSucKhoe.ToString();
            textBox2.Text = sk.ChieuCao.ToString();
            textBox3.Text = sk.CanNang.ToString();
            textBox4.Text = sk.BenhDiTruyen;
            textBox5.Text = sk.DaNiemMac;
            textBox6.Text = sk.TaiMuiHong;
            textBox7.Text = sk.RangHamMat;
            textBox8.Text = sk.Mat;
            textBox9.Text = sk.HeTimMach;
            textBox10.Text = sk.DuongHoHap;
            textBox11.Text =sk.TiemNgua;
            textBox12.Text = sk.DinhDuong;
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox2.Text.Trim() != "" && textBox3.Text.Trim() != "" && FormMain.KiemTraChuoiLaSo(textBox2.Text.Trim()) == true && FormMain.KiemTraChuoiLaSo(textBox3.Text.Trim()) == true)
            {
                sk.ChieuCao = float.Parse(textBox2.Text);
                sk.CanNang = float.Parse(textBox3.Text);
                sk.BenhDiTruyen = textBox4.Text;
                sk.DaNiemMac = textBox5.Text;
                sk.TaiMuiHong = textBox6.Text;
                sk.RangHamMat = textBox7.Text;
                sk.Mat = textBox8.Text;
                sk.HeTimMach = textBox9.Text;
                sk.DuongHoHap = textBox10.Text;
                sk.TiemNgua = textBox11.Text;
                sk.DinhDuong = textBox12.Text;
                if (ws.CapNhapSucKhoe(sk) == true)
                    MessageBox.Show("Cập nhập Sức Khỏe thành công!");
                else MessageBox.Show("Cập nhập Sức Khỏe thất bại!");
            }
            else MessageBox.Show("Vui lòng điền Chiều cao & cân nặng!");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}
