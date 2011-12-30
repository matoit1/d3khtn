using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Text.RegularExpressions;
using RemoteObjectEngine;
using RemoteObjectEngine.nvvQLTMN_BUS_WS;

namespace nvvQLTMN_Presentation
{
    public partial class FormMain : Form
    {
        public FormMain()
        {
            InitializeComponent();
            RemoteObjectManager.Connect();
            
        }
        public static  List<Image> imageList = new List<Image>();
        private void Form1_Load(object sender, EventArgs e)
        {
            try
            {
                TruongDTO truong = Trương.LayThongTinTruong();
                label5.Text = truong.TenTruong;
                label6.Text = truong.DiaChi;
                label7.Text = truong.Sdt;
            }
            catch
            {
                MessageBox.Show("Vui lòng kiểm tra add file QLNT.mdf vào SQl server. \r\nKiểm tra kết nối webServiceDAL và WebServiceBUS.","Chưa kết nối dữ liệu!");
                menuStrip1.Enabled = false;
            }
            imageList.Add(nvvQLTMN_Presentation.Properties.Resources.a);
            imageList.Add(nvvQLTMN_Presentation.Properties.Resources.b);
            imageList.Add(nvvQLTMN_Presentation.Properties.Resources.c);
            imageList.Add(nvvQLTMN_Presentation.Properties.Resources.d);
            imageList.Add(nvvQLTMN_Presentation.Properties.Resources.e);
            imageList.Add(nvvQLTMN_Presentation.Properties.Resources.f);
            imageList.Add(nvvQLTMN_Presentation.Properties.Resources.g);
            imageList.Add(nvvQLTMN_Presentation.Properties.Resources.h);
            imageList.Add(nvvQLTMN_Presentation.Properties.Resources.i);
            imageList.Add(nvvQLTMN_Presentation.Properties.Resources.j);
        }

        private void thoátToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void xemDanhSáchLớpToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Lop frmLop = new Lop();
            frmLop.Show();

        }

        private void thêmLớpToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ThemLop frmThemLop = new ThemLop();
            frmThemLop.Show();
        }

        private void xemCậpNhậpGiáoViênToolStripMenuItem_Click(object sender, EventArgs e)
        {
            GiaoVien frmGV = new GiaoVien();
            frmGV.Show();
        }

        private void thêmGiáoViênToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ThemGV frmThemGV = new ThemGV();
            frmThemGV.Show();
        }

        private void xemCậpNhâpTrẻToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Tre frmTre = new Tre();
            frmTre.Show();
        }
        public static bool KiemTraChuoiLaSo(string s)
        {
            bool kq = true;
            try
            {
                float.Parse(s);
            }
            catch
            {
                kq = false;
            }
            return kq;
        }

        private void thêmTrẻToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ThemTre frmThemTre = new ThemTre();
            frmThemTre.Show();
        }

        private void traCứuLớpToolStripMenuItem_Click(object sender, EventArgs e)
        {
            TraCuuLop frmTCLop = new TraCuuLop();
            frmTCLop.Show();
        }

        private void traCứuGiáoViênToolStripMenuItem_Click(object sender, EventArgs e)
        {
            TraCuuGiaoVien frmTCGV = new TraCuuGiaoVien();
            frmTCGV.Show();
        }

        private void traCứuTrẻToolStripMenuItem_Click(object sender, EventArgs e)
        {
            TraCuuTre frmTCTre = new TraCuuTre();
            frmTCTre.Show();
        }

        //loa bo dau cua tieng viet
        public static string RejectMarks(string text)
        {
            string[] pattern= new string[7];
            pattern[0] = "a|(á|ả|à|ạ|ã|ă|ắ|ẳ|ằ|ặ|ẵ|â|ấ|ẩ|ầ|ậ|ẫ)";
            pattern[1]= "o|(ó|ỏ|ò|ọ|õ|ô|ố|ổ|ồ|ộ|ỗ|ơ|ớ|ở|ờ|ợ|ỡ)";
            pattern[2] = "e|(é|è|ẻ|ẹ|ẽ|ê|ế|ề|ể|ệ|ễ)";
            pattern[3] = "u|(ú|ù|ủ|ụ|ũ|ư|ứ|ừ|ử|ự|ữ)";
            pattern[4] = "i|(í|ì|ỉ|ị|ĩ)";
            pattern[5] = "y|(ý|ỳ|ỷ|ỵ|ỹ)";
            pattern[6] = "d|đ";
            for (int i = 0; i < pattern.Length; i++)
            {
            // kí tự sẽ thay thế
            char replaceChar = pattern[i][0];
            MatchCollection matchs = Regex.Matches(text,pattern[i]);
            foreach (Match m in matchs)
            {
                text = text.Replace(m.Value[0],replaceChar);
            }
        }
        return text;
        }

        private void thiếtLậpCácThôngTinHệThốngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ThongTinTruong frm = new ThongTinTruong();
            frm.ShowDialog();
            TruongDTO truong = RemoteObjectEngine.Trương.LayThongTinTruong();
            label5.Text = truong.TenTruong;
            label6.Text = truong.DiaChi;
            label7.Text = truong.Sdt;
        }

        private void thôngTinChươngTrìnhToolStripMenuItem_Click(object sender, EventArgs e)
        {
            About frm = new About();
            frm.ShowDialog();
        }

        private void báoCáoTìnhHìnhHọcTậpVàSứcKhỏeCủaTrẻToolStripMenuItem_Click(object sender, EventArgs e)
        {
            BaoCaoTre frm = new BaoCaoTre();
            frm.Show();
        }

        private void báoCáoHoạtĐộngCủaLớpToolStripMenuItem_Click(object sender, EventArgs e)
        {
            BaoCaoGiaoVien frm = new BaoCaoGiaoVien();
            frm.Show();
        }

        private void hướngDẫnSửDụngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Help.ShowHelp(this, Application.StartupPath + "//HelpQLNT.chm");
        }
       

        public void GetValue(String str)
        {
            this.BackgroundImage = imageList[int.Parse(str)];//

        }
        private void đôiGiaoDiênNênToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ThietLapGiaoDien f2 = new ThietLapGiaoDien();
            f2.MyGetData = new ThietLapGiaoDien.GetString(GetValue);
            f2.Show();
        }
    }
}
