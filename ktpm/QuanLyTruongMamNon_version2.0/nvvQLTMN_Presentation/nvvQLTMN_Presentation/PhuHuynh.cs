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
    public partial class PhuHuynh : Form
    {
        public PhuHuynh()
        {
            InitializeComponent();
        }
        public PhuHuynhDTO ph = new PhuHuynhDTO();
        private void PhuHuynh_Load(object sender, EventArgs e)
        {
            label1.Text += " "+ Tre.TenTreDuocChon;
            IList<PhuHuynhDTO> DsPhuHuynh = RemoteObjectEngine.PhuHuynh.LayThongTinPhuHuynh(Tre.maPhuHuynh);
            ph = DsPhuHuynh[0];
            textBox1.Text = ph.TenCha;
            textBox2.Text = ph.TuoiCha.ToString();
            textBox3.Text = ph.SdtCha;
            textBox4.Text = ph.NgheNghiepCha;
            textBox8.Text = ph.TenMe;
            textBox7.Text = ph.TuoiMe.ToString();
            textBox6.Text = ph.SdtMe;
            textBox5.Text = ph.DiaChiCoQuanMe;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text.Trim() != "" && textBox8.Text.Trim() != "")
            {
                ph.TenCha = textBox1.Text;
                if(FormMain.KiemTraChuoiLaSo(textBox2.Text)==true)
                    ph.TuoiCha = int.Parse(textBox2.Text);
                ph.SdtCha = textBox3.Text;
                ph.NgheNghiepCha = textBox4.Text;
                ph.TenMe = textBox8.Text;
                if (FormMain.KiemTraChuoiLaSo(textBox7.Text) == true)
                    ph.TuoiMe = int.Parse(textBox7.Text);
                ph.SdtMe = textBox6.Text;
                ph.DiaChiCoQuanMe = textBox5.Text;
                if (RemoteObjectEngine.PhuHuynh.CapNhapPhuHuynh(ph) == true)
                    MessageBox.Show("Cập nhập Phụ Huynh thành công!");
                else MessageBox.Show("Cập nhập Phụ Huynh thất bại!");
            }
            else MessageBox.Show("Vui lòng điền Tên Cha Mẹ!");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}
