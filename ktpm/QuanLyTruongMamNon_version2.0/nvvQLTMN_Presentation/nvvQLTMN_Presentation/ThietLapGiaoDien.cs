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
    public partial class ThietLapGiaoDien : Form
    {
        public ThietLapGiaoDien()
        {
            InitializeComponent();
        }

        private void ThietLapGiaoDien_Load(object sender, EventArgs e)
        {
            comboBox1.Items.Clear();
            for (int i =0 ;i <FormMain.imageList.Count;i++)
            {
                comboBox1.Items.Add(i);
            }
        }
        public delegate void GetString(string str);

        public GetString MyGetData; 

        private void button1_Click(object sender, EventArgs e)
        {
            if (MyGetData != null)
            {
                MyGetData(comboBox1.SelectedValue.ToString());
            } 
        }
    }
}
