using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using D3.Models;
using System.Web.Mvc;

namespace D3.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        DauGiaDataContext data = new DauGiaDataContext();
        public ActionResult Index()
        {
            ViewData["Title"] = "";
            List<SanPham> ds = data.LayDSSanPhamTheoTrang(1);
            ViewData["DanhSachSanPham"] = ds;
            return View();
        }
        public ActionResult About()
        {
            return View();
        }
    }
}
