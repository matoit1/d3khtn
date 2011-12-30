using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Collections.Generic;
using nvvQLNT_BUS_WS.nvv_QLTMN_DAL_WS;

namespace nvvQLNT_BUS_WS
{
    /// <summary>
    /// Summary description for Service1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Service1 : System.Web.Services.WebService
    {
        //giao vien
        public GiaoVienBUS gv = new GiaoVienBUS();
        [WebMethod]
        public List<GiaoVienDTO> LayDanhSachGiaoVien()
        {
            return gv.LayDanhSachGiaoVien();
        }
        [WebMethod]
        public bool ThemGiaoVien(GiaoVienDTO gvtam)
        {
            gv.giaoVien = gvtam;
            return gv.ThemGiaoVien();
        }
        [WebMethod]
        public bool CapNhapGiaoVien(GiaoVienDTO gvtam)
        {
            gv.giaoVien = gvtam;
            return gv.CapNhapGiaoVien();
        }
        [WebMethod]
        public bool XoaGiaoVien(GiaoVienDTO gvtam)
        {
            gv.giaoVien = gvtam;
            return gv.XoaGiaoVien();
        }

        //khoi
        public KhoiBUS kh = new KhoiBUS();
        [WebMethod]
        public List<KhoiDTO> LayDanhSachKhoi()
        {
            return kh.LayDanhSachKhoi();
        }

        //lop
        public LopBUS lop = new LopBUS();
        [WebMethod]
        public List<LopDTO> LayDanhSachLop()
        {
            return lop.LayDanhSachLop();
        }
        [WebMethod]
        public bool ThemLop(LopDTO loptam)
        {
            lop.lop = loptam;
            return lop.ThemLop();
        }
        [WebMethod]
        public bool CapNhapLop(LopDTO loptam)
        {
            lop.lop = loptam;
            return lop.CapNhapLop();
        }
        [WebMethod]
        public bool XoaLop(LopDTO loptam)
        {
            lop.lop = loptam;
            return lop.XoaLop();
        }

        //phuhuynh
        public PhuHuynhBUS ph = new PhuHuynhBUS();
        [WebMethod]
        public List<PhuHuynhDTO> LayThongTinPhuHuynh(int maphuhuynh)
        {
            return ph.LayThongTinPhuHuynh(maphuhuynh);
        }
        [WebMethod]
        public int ThemPhuHuynh(PhuHuynhDTO phuhuynh)
        {
            ph.phuHuynh = phuhuynh;
            return ph.ThemPhuHuynh();
        }
        [WebMethod]
        public bool CapNhapPhuHuynh(PhuHuynhDTO phuhuynh)
        {
            ph.phuHuynh = phuhuynh;
            return ph.CapNhapPhuHuynh();
        }
        [WebMethod]
        public bool XoaPhuHuynh(int maPH)
        {
            return ph.XoaPhuHuynh(maPH);
        }

        //suckhoe
        TinhTrangSucKhoeBUS sk = new TinhTrangSucKhoeBUS();
        [WebMethod]
        public List<TinhTrangSucKhoeDTO> LayThongTinSucKhoe(int masuckhoe)
        {
            return sk.LayThongTinSucKhoe(masuckhoe);
        }
        [WebMethod]
        public int ThemSucKhoe(TinhTrangSucKhoeDTO suckhoe)
        {
            sk.sucKhoe = suckhoe;
            return sk.ThemSucKhoe();
        }
        [WebMethod]
        public bool CapNhapSucKhoe(TinhTrangSucKhoeDTO suckhoe)
        {
            sk.sucKhoe = suckhoe;
            return sk.CapNhapSucKhoe();
        }
        [WebMethod]
        public bool XoaSucKhoe(int maSk)
        {
            return sk.XoaSucKhoe(maSk);
        }

        //tre
        public TreBUS tr = new TreBUS();
        [WebMethod]
        public List<TreDTO> LayDanhSachTre()
        {
            return tr.LayDanhSachTre();
        }
        [WebMethod]
        public List<TreDTO> LayDSTreTheoLop(string tenlop)
        {
            return tr.LayDSTreTheoLop(tenlop);
        }
        [WebMethod]
        public bool ThemTre(TreDTO tretam)
        {
            tr.tre = tretam;
            return tr.ThemTre();
        }
        [WebMethod]
        public bool CapNhapTre(TreDTO tretam)
        {
            tr.tre = tretam;
            return tr.CapNhapTre();
        }
        [WebMethod]
        public bool XoaTre(TreDTO tretam)
        {
            tr.tre = tretam;
            return tr.XoaTre();
        }

        //Truong
        public TruongBUS truong = new TruongBUS();
        [WebMethod]
        public TruongDTO LayThongTinTruong()
        {
            return truong.LayThongTinTruong();
        }
        [WebMethod]
        public bool SuaThongTinTruong(TruongDTO truonghoc)
        {
            truong.truong = truonghoc;
            return truong.SuaThongTinTruong();
        }
    }
}
