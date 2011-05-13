using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using D3.Models;
namespace D3.Controllers
{
    public class SanPhamController : Controller
    {
        //
        // GET: /SanPham/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult XemChiTietSanPham(string buffer)
        {
            string maSanPham;
            int dem = 0;
            string tam = Request.Path;
            for (int i = tam.Length - 1; i > 0; i--)
            {

                if (tam[i -1] == '/')
                {
                    dem = i ;
                    break;
                }
            }
            maSanPham = tam.Substring(dem);
            DauGiaDataContext data = new DauGiaDataContext();
            SanPham sp=data.TimSanPhamTheoMaSanPham(maSanPham);
            ViewData["SanPhamChiTiet"] = sp;
            return View();
        }
        public ActionResult XemDanhSachSanPhamMoiDang()
        {
            DauGiaDataContext data = new DauGiaDataContext();
            List<SanPham> ds = data.TimSanPhamMoiDang();
            ViewData["Title"] = "Danh Sách Sản Phẩm Mới Đăng";
            ViewData["DanhSachSanPhamMoiDang"] = ds;
            return View();
        }
        public ActionResult XemDanhSachSanPhamDauGiaNhieuNhat()
        {
            DauGiaDataContext data = new DauGiaDataContext();
            List<SanPham> ds = data.TimSanPhamDauGiaNhieuNhat();
            ViewData["Title"] = "Danh Sách Sản Phẩm Mới Đấu Giá Nhiều Nhất";
            ViewData["DanhSachSanPhamDauGiaNhieuNhat"] = ds;
            return View();
        }
    }
}
