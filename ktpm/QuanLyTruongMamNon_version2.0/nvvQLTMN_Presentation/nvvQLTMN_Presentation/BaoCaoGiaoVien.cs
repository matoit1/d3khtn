using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using CrystalDecisions.CrystalReports.Engine;


namespace nvvQLTMN_Presentation
{
    public partial class BaoCaoGiaoVien : Form
    {

        public BaoCaoGiaoVien()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            CrystalReportGV reportGV = new CrystalReportGV();

            reportGV.SetParameterValue("nguoilap", textBox1.Text);
            crystalReportViewer1.ReportSource = reportGV;
        }
    }
}
