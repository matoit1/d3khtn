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
    public partial class TraCuuTre : Form
    {
        public nvvQLTMN_BUS_WS.Service1 ws = new Service1();
        public TraCuuTre()
        {
            InitializeComponent();
        }
        public void LayKetQuaTraCuuTre()
        {
            List<TreDTO> dsKQTre = new List<TreDTO>();
            IList<TreDTO> dsTre = ws.LayDanhSachTre();
            if (textBox1.Text.Trim() != "")
            {
                if (FormMain.KiemTraChuoiLaSo(textBox1.Text) == true)
                {
                    for (int i = 0; i < dsTre.Count; i++)
                        if (dsTre[i].MaTre == int.Parse(textBox1.Text))
                            dsKQTre.Add(dsTre[i]);
                }
                else
                {
                    for (int i = 0; i < dsTre.Count; i++)
                        if (dsTre[i].HoTen.ToLower().Contains(textBox1.Text.ToLower()))
                            dsKQTre.Add(dsTre[i]);
                }
                if (dsKQTre.Count > 0)
                {
                    dataGridView1.DataSource = dsKQTre;
                    for (int i = 0; i < dsKQTre.Count; i++)
                        dataGridView1.Rows[i].Tag = dsKQTre[i];
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
        private void textBox1_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                LayKetQuaTraCuuTre();
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            LayKetQuaTraCuuTre();
        }
        public TreDTO tretam;
        bool laSK = false;
        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            //if(dataGridView1.CurrentRow.Tag!=null)
            //{
            //    TreDTO tretam = (TreDTO) dataGridView1.CurrentRow.Tag;
            //    Tre.TenTreDuocChon = tretam.HoTen;
            //    Tre.maPhuHuynh = tretam.MaPhuHuynh;
            //    Tre.maSucKhoe = tretam.MaTre;
            //    SucKhoe frmSK = new SucKhoe();
            //    frmSK.ShowDialog();
            //}
            if (laSK == true)
            {
                SucKhoe frmSK = new SucKhoe();
                frmSK.ShowDialog();
            }
        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            //if (dataGridView1.CurrentRow.Tag != null)
            //{
            //    tretam =(TreDTO) dataGridView1.CurrentRow.Tag;
            //}

        }

        private void dataGridView1_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            if (dataGridView1.CurrentRow.Tag != null)
            {
                laSK = true;
                tretam = (TreDTO)dataGridView1.CurrentRow.Tag;
                Tre.TenTreDuocChon = tretam.HoTen;
                Tre.maPhuHuynh = tretam.MaPhuHuynh;
                Tre.maSucKhoe = tretam.MaTre;
                //SucKhoe frmSK = new SucKhoe();
                //frmSK.ShowDialog();
            }
        }
    }
}
