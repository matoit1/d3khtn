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
    public partial class Tre : Form
    {
        public static string TenTreDuocChon;
        public static int maPhuHuynh;
        public static int maSucKhoe;
        public IList<TreDTO> DSTreTatCa;
        public IList<LopDTO> DSLopTatCa;
        public Tre()
        {
            InitializeComponent();
            DSTreTatCa = RemoteObjectEngine.Tre.LayDanhSachTre();
            DSLopTatCa = RemoteObjectEngine.Lop.LayDanhSachLop();
        }
        public void LoadDSTre()
        {
            IList<TreDTO> dsTre = RemoteObjectEngine.Tre.LayDSTreTheoLop(cbbLopXem.Text);
            dataGridView1.DataSource = dsTre;
            for (int i = 0; i < dsTre.Count; i++)
            {
                dataGridView1.Rows[i].Tag = dsTre[i];
            }
            dataGridView1.Columns[0].HeaderText = "Mã Trẻ";
            dataGridView1.Columns[1].HeaderText = "Họ Tên";
            dataGridView1.Columns[2].HeaderText = "Giới Tính";
            dataGridView1.Columns[3].HeaderText = "Ngày Sinh";
            dataGridView1.Columns[4].HeaderText = "Con Thứ";
            dataGridView1.Columns[5].HeaderText = "Tên Lớp";
            dataGridView1.Columns[6].HeaderText = "Mã Tình Trạng Sức Khỏe";
            dataGridView1.Columns[7].HeaderText = "Mã Phụ Huynh";
        }
        private void Tre_Load(object sender, EventArgs e)
        {
            // IList<LopDTO> DsLop = BUS.LopBUS.LayDanhSachLop();
            LoadDSTre();
            cbbTenLop.DataSource = DSLopTatCa;
            cbbTenLop.DisplayMember = "TenLop";
            //LopDTO tam = new LopDTO();
            //tam.TenLop = "<<Xem tất cả các lớp>>";
            //DsLop.Insert(0,tam);
            cbbLopXem.DataSource = DSLopTatCa;
            cbbLopXem.DisplayMember = "TenLop";

        }

        private void dataGridView1_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                if (dataGridView1.CurrentRow.Tag != null)
                {

                    TreDTO tre = (TreDTO)dataGridView1.CurrentRow.Tag;
                    tbTen.Text = tre.HoTen;
                    tbConThu.Text = tre.ConThu.ToString();
                    if (tre.GioiTinh == "Nam" || tre.GioiTinh == "nam")
                        rBtnNam.Checked = true;
                    else rBtnNu.Checked = true;
                    dtNgaySinh.Value = tre.NgaySinh;
                    IList<LopDTO> DSLop = RemoteObjectEngine.Lop.LayDanhSachLop();
                    for (int i = 0; i < DSLop.Count; i++)
                    {
                        if (DSLop[i].TenLop == tre.TenLop)
                        {
                            cbbTenLop.SelectedIndex = i;
                        }
                    }
                    TenTreDuocChon = tre.HoTen;
                    maPhuHuynh = tre.MaPhuHuynh;
                    maSucKhoe = tre.MaTinhTrangSucKhoe;
                }
            }
            catch
            {
            }
        }

        private void cbbLopXem_SelectedIndexChanged(object sender, EventArgs e)
        {
            //if (cbbLopXem.SelectedIndex == 0)
            //{
            //    LoadDSTre();
            //}
            //else 
            if (cbbLopXem.SelectedIndex >= 0 && cbbLopXem.SelectedIndex <= RemoteObjectEngine.Lop.LayDanhSachLop().Count())
            {
                IList<TreDTO> dsTre = RemoteObjectEngine.Tre.LayDSTreTheoLop(cbbLopXem.Text);
                if (dsTre.Count == 0)
                {
                    dataGridView1.DataSource = null;
                    return;
                    // TreDTO tre = new TreDTO();
                    //// tre.HoTen = "Chưa Có trẻ";
                    // tre.NgaySinh = DateTime.Now;
                    // dsTre.Add(tre);
                }
                dataGridView1.DataSource = dsTre;
                for (int i = 0; i < dsTre.Count; i++)
                {
                    dataGridView1.Rows[i].Tag = dsTre[i];
                }
                dataGridView1.Columns[0].HeaderText = "Mã Trẻ";
                dataGridView1.Columns[1].HeaderText = "Họ Tên";
                dataGridView1.Columns[2].HeaderText = "Giới Tính";
                dataGridView1.Columns[3].HeaderText = "Ngày Sinh";
                dataGridView1.Columns[4].HeaderText = "Con Thứ";
                dataGridView1.Columns[5].HeaderText = "Tên Lớp";
                dataGridView1.Columns[6].HeaderText = "Mã Tình Trạng Sức Khỏe";
                dataGridView1.Columns[7].HeaderText = "Mã Phụ Huynh";

            }
        }

        private void btnCapNhap_Click(object sender, EventArgs e)
        {
            if (dataGridView1.CurrentRow.Tag != null)
            {
                TreDTO tre = (TreDTO)dataGridView1.CurrentRow.Tag;
                tre.HoTen = tbTen.Text;
                if (FormMain.KiemTraChuoiLaSo(tbConThu.Text) == true)
                    tre.ConThu = int.Parse(tbConThu.Text);

                if (rBtnNam.Checked == true)
                    tre.GioiTinh = "Nam";
                else tre.GioiTinh = "Nữ";
                tre.NgaySinh = dtNgaySinh.Value;
                if (tbTen.Text.Trim() != "" && tbConThu.Text.Trim() != "" && FormMain.KiemTraChuoiLaSo(tbConThu.Text) == true)
                {
                    if (RemoteObjectEngine.Tre.CapNhapTre(tre) == true)
                        MessageBox.Show("Cập nhập Trẻ thành công!");
                    else MessageBox.Show("Cập nhập Trẻ thất bại!");
                }
                else MessageBox.Show("Vui lòng điền đầy đủ thông tin!");
                LoadDSTre();
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            ThemTre frmThemTre = new ThemTre();
            frmThemTre.ShowDialog();
            LoadDSTre();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                if (dataGridView1.CurrentRow.Tag != null)
                {
                    if (MessageBox.Show("Bạn có chắc muốn xóa ko?", "Hỏi", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                    {
                        TreDTO tre = (TreDTO)dataGridView1.CurrentRow.Tag;
                        if (RemoteObjectEngine.Tre.XoaTre(tre) == true && RemoteObjectEngine.PhuHuynh.XoaPhuHuynh(tre.MaPhuHuynh) == true && RemoteObjectEngine.TinhTrangSucKhoe.XoaSucKhoe(tre.MaTinhTrangSucKhoe) == true)
                            MessageBox.Show("Xóa Trẻ thành công!");
                        else MessageBox.Show("Xóa Trẻ thất bại!");
                        LoadDSTre();
                    }
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show("Không còn trẻ!");
            }
        }

        private void linkLabel2_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            PhuHuynh frmHuynh = new PhuHuynh();
            frmHuynh.ShowDialog();
        }

        private void linkLabel1_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            SucKhoe frmSK = new SucKhoe();
            frmSK.ShowDialog();
        }
    }
}
