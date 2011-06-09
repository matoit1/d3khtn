using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DauGia.Models;
namespace DauGia.Controllers
{
    public class SanPhamController : Controller
    {
        //
        // GET: /SanPham/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult XemChiTietSanPham(int id)
        {
            int maSanPham;
            //string maSanPham;
            //int dem = 0;
            //string tam = Request.Path;

            //for (int i = tam.Length - 1; i > 0; i--)
            //{
            //    if (tam[i - 1] == '/')
            //    {
            //        dem = i;
            //        break;
            //    }
            //}
            //maSanPham = tam.Substring(dem);
            maSanPham = id;
            SanPham sp = SanPhamDAO.TimSanPhamTheoMaSanPham(maSanPham);
            Session["sanpham"] = sp;
            List<Comment> cm = CommentDAO.LayDSCommentTheoMaSanPham(sp.MaSanPham);
            List<TaiKhoan> dsTaiKhoan = new List<TaiKhoan>();
            for (int i = 0; i < cm.Count; i++)
            {
                dsTaiKhoan.Add(TaiKhoanDAO.TimTaiKhoanTheoMa(cm[i].MaTaiKhoan));
            }
            ViewData["TaiKhoanComment"] = dsTaiKhoan;
            ViewData["DanhSachCommnet"] = cm;
            ViewData["SanPhamChiTiet"] = sp;
            return View();
        }
        public ActionResult XemDanhSachSanPhamMoiDang()
        {

            List<SanPham> ds = SanPhamDAO.TimSanPhamMoiDang();
            ViewData["Title"] = "Danh Sách Sản Phẩm Mới Đăng";
            ViewData["DanhSachSanPhamMoiDang"] = ds;
            return View();
        }
        public ActionResult XemDanhSachSanPhamDauGiaNhieuNhat()
        {

            List<SanPham> ds = SanPhamDAO.TimSanPhamDauGiaNhieuNhat();
            ViewData["Title"] = "Danh Sách Sản Phẩm Mới Đấu Giá Nhiều Nhất";
            ViewData["DanhSachSanPhamDauGiaNhieuNhat"] = ds;
            return View();
        }

    }
}
