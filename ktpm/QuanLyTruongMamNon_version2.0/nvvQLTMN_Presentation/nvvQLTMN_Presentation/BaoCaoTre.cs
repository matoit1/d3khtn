using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace nvvQLTMN_Presentation
{
    public partial class BaoCaoTre : Form
    {
        public BaoCaoTre()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            CrystalReportTRE reportTre = new CrystalReportTRE();
            reportTre.SetParameterValue("nguoilap", textBox1.Text);
            crystalReportViewer2.ReportSource = reportTre;
        }
    }
}
