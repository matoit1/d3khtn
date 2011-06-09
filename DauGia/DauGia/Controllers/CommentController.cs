using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DauGia.Models;
namespace DauGia.Controllers
{
    public class CommentController : Controller
    {
        //
        // GET: /Comment/

        public ActionResult Index()
        {
            return View();
        }

        public void CapNhat()
        {
            try
            {
                string tenTaiKhoan = (string)Session["TenThanhVien"];
                TaiKhoan tk = TaiKhoanDAO.TimTaiKhoanTheoTen(tenTaiKhoan);
                SanPham sp = (SanPham)Session["sanpham"];
                Comment cm = new Comment();
                cm.NoiDungComment = Request["txt_NoiDung"].ToString();
                cm.MaSanPham = sp.MaSanPham;
                cm.MaTaiKhoan = tk.MaTaiKhoan;
                cm.NgayComment = System.DateTime.Now;
                CommentDAO.ThemComment(cm);
                Response.Redirect("//localhost:3271/SanPham/XemChiTietSanPham/" + cm.MaSanPham.ToString());
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        } 

    }
}
