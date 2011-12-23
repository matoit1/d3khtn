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
    public partial class TraCuuGiaoVien : Form
    {
        public nvvQLTMN_BUS_WS.Service1 ws = new Service1();
        public TraCuuGiaoVien()
        {
            InitializeComponent();
        }
        public void TraCuuGV()
        {
            List<GiaoVienDTO> dsKQgv = new List<GiaoVienDTO>();
            IList<GiaoVienDTO> dsGV = ws.LayDanhSachGiaoVien();
            if (textBox1.Text.Trim() != "")
            {
                if (FormMain.KiemTraChuoiLaSo(textBox1.Text) == true)
                {
                    for (int i = 0; i < dsGV.Count; i++)
                        if (dsGV[i].MaGiaoVien == int.Parse(textBox1.Text))
                            dsKQgv.Add(dsGV[i]);
                }
                else
                {
                    for (int i = 0; i < dsGV.Count; i++)
                        if (dsGV[i].TenGiaoVien.ToLower().Contains(textBox1.Text.ToLower()))
                            dsKQgv.Add(dsGV[i]);
                }
                if (dsKQgv.Count > 0)
                {
                    dataGridView1.DataSource = dsKQgv;
                    groupBox1.Visible = true;
                    status.Visible = false;
                }
                else
                {
                    status.Visible = true;
                    groupBox1.Visible = false;
                    status.Text = "Không tìm thấy kết quả. Vui lòng thử từ khóa khác";
                }
            }
            else
            {
                status.Visible = true;
                groupBox1.Visible = false;
                status.Text = "Vui lòng nhập thông tin!";
            }

        }

        private void button1_Click(object sender, EventArgs e)
        {
            TraCuuGV();
        }

        private void textBox1_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
                TraCuuGV();
        }


    }
}
