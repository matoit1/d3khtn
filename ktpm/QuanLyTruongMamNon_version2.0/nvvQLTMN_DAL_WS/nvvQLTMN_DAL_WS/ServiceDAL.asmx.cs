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

namespace nvvQLTMN_DAL_WS
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
         public GiaoVienDAO gv = new GiaoVienDAO();
        [WebMethod]
        public List<GiaoVienDTO> LayDanhSachGiaoVien()
        {
            return gv.LayDanhSachGiaoVien();
        }
        [WebMethod]
        public bool ThemGiaoVien(GiaoVienDTO gvtam)
        {
            return gv.ThemGiaoVien(gvtam);
        }
        [WebMethod]
        public bool CapNhapGiaoVien(GiaoVienDTO gvtam)
        {
            return gv.CapNhapGiaoVien(gvtam);
        }
        [WebMethod]
        public bool XoaGiaoVien(int maGv)
        {
            return gv.XoaGiaoVien(maGv);
        }

        //khoi
        public  KhoiDAO kh = new KhoiDAO();
        [WebMethod]
        public List<KhoiDTO> LayDanhSachKhoi()
        {
            return kh.LayDanhSachKhoi();
        }

        //lop
        public  LopDAO lop = new LopDAO();
        [WebMethod]
        public List<LopDTO> LayDanhSachLop()
        {
            return lop.LayDanhSachLop();
        }
        [WebMethod]
        public bool ThemLop(LopDTO loptam)
        {
            return lop.ThemLop(loptam);
        }
        [WebMethod]
        public bool CapNhapLop(LopDTO loptam)
        {
            return lop.CapNhapLop(loptam);
        }
        [WebMethod]
        public bool XoaLop(int maLop)
        {
            return lop.XoaLop(maLop);
        }

        //phuhuynh
        public PhuHuynhDAO ph = new PhuHuynhDAO();
        [WebMethod]
        public List<PhuHuynhDTO> LayThongTinPhuHuynh(int maphuhuynh)
        {
            return ph.LayThongTinPhuHuynh(maphuhuynh);
        }
        [WebMethod]
        public int ThemPhuHuynh(PhuHuynhDTO phuhuynh)
        {
            return ph.ThemPhuHuynh(phuhuynh);
        }
        [WebMethod]
        public bool CapNhapPhuHuynh(PhuHuynhDTO phuhuynh)
        {
            return ph.CapNhapPhuHuynh(phuhuynh);
        }
        [WebMethod]
        public bool XoaPhuHuynh(int maPH)
        {
            return ph.XoaPhuHuynh(maPH);
        }

        //suckhoe
        TinhTrangSucKhoeDAO sk = new TinhTrangSucKhoeDAO();
        [WebMethod]
        public List<TinhTrangSucKhoeDTO> LayThongTinSucKhoe(int masuckhoe)
        {
            return sk.LayThongTinSucKhoe(masuckhoe);
        }
        [WebMethod]
        public int ThemSucKhoe(TinhTrangSucKhoeDTO suckhoe)
        {
            return sk.ThemSucKhoe(suckhoe);
        }
        [WebMethod]
        public bool CapNhapSucKhoe(TinhTrangSucKhoeDTO suckhoe)
        {
            return sk.CapNhapSucKhoe(suckhoe);
        }
        [WebMethod]
        public bool XoaSucKhoe(int maSk)
        {
            return sk.XoaSucKhoe(maSk);
        }

        //tre
        public TreDAO tr = new TreDAO();
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
            return tr.ThemTre(tretam);
        }
        [WebMethod]
        public bool CapNhapTre(TreDTO tretam)
        {
            return tr.CapNhapTre(tretam);
        }
        [WebMethod]
        public bool XoaTre(int maTre)
        {
            return tr.XoaTre(maTre);
        }

        //Truong
        public TruongDAO truong = new TruongDAO();
        [WebMethod]
        public TruongDTO LayThongTinTruong()
        {
            return truong.LayThongTinTruong();
        }
        [WebMethod]
        public bool SuaThongTinTruong(TruongDTO truonghoc)
        {
            return truong.SuaThongTinTruong(truonghoc);
        }
    }
}
