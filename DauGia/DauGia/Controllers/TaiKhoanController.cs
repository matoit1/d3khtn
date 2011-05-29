using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DauGia.Models;
namespace DauGia.Controllers
{
    public class TaiKhoanController : Controller
    {
        //
        // GET: /TaiKhoan/
        //TaiKhoanDAO tkRepos = new TaiKhoanDAO();
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult DangNhap()
        {
            return View();
        }

        [HttpPost]
        public ActionResult DangNhap(LogOnModel model, string returnUrl)
        {

            if (ModelState.IsValid)
            {
                if (TaiKhoanDAO.LayTaiKhoan(model.UserName,model.Password)!=null)
                {
                    TaiKhoanDAO.DangNhap(model.UserName, model.RememberMe);
                    if (!String.IsNullOrEmpty(returnUrl))
                    {
                        return Redirect(returnUrl);
                    }
                    else
                    {
                        return RedirectToAction("Index", "TrangChu");
                    }
                }
                else
                {
                    ModelState.AddModelError("", "The user name or password provided is incorrect.");
                }
            }
            return View();
    }
        public ActionResult DangXuat()
        {
            TaiKhoanDAO.DangXuat();
            return RedirectToAction("Index", "TrangChu");
        }

    }
}
