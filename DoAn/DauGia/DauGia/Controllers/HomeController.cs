using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DauGia.Models;
namespace DauGia.Controllers
{
    public class HomeController : Controller
    {
        
        
        public ActionResult Index()
        {
            ViewData["Title"] = "";
            List<SanPham> ds = SanPhamDAO.LayDSSanPhamTheoTrang(1);
            ViewData["DanhSachSanPham"] = ds;
            return View();
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
