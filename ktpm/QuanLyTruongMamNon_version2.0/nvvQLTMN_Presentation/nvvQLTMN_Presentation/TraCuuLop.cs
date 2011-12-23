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
    public partial class TraCuuLop : Form
    {
        public nvvQLTMN_BUS_WS.Service1 ws = new Service1();
        public TraCuuLop()
        {
            InitializeComponent();
        }
        List<LopDTO> dskq= new List<LopDTO>();
         IList<LopDTO> dsLop = new List<LopDTO>();

        public void TraCuuTheoTenLop()
        {
            dataGridView1.DataSource = null;
            for(int i=0;i<dsLop.Count;i++)
            {
                if(dsLop[i].TenLop == comboBox1.Text)
                {
                    dskq.Add(dsLop[i]);
                }
            }
            if (dskq.Count > 0)
            {
                groupBox1.Visible = true;
                dataGridView1.DataSource = dskq;
                dataGridView1.Columns[0].HeaderText = "Mã Lớp";
                dataGridView1.Columns[1].HeaderText = "Tên Lớp";
                dataGridView1.Columns[2].HeaderText = "Độ Tuổi";
                dataGridView1.Columns[3].HeaderText = "Sỉ Số";
                dataGridView1.Columns[4].HeaderText = "Tên Khối";
                status.Text = "";
            }
            else
            {
                status.Text = "Không tìm thấy lớp này!";
                groupBox1.Visible = false;
            }
        
        }
        private void button1_Click(object sender, EventArgs e)
        {
            dskq.Clear();
            TraCuuTheoTenLop();
        }

        private void TraCuuLop_Load(object sender, EventArgs e)
        {
            dsLop = ws.LayDanhSachLop();
            comboBox1.DataSource = dsLop;
            comboBox1.DisplayMember ="TenLop";
        }

        private void comboBox1_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                dskq.Clear();
                TraCuuTheoTenLop();
            }
        }
    }
}
