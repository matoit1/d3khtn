/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.HangSanXuatDAO;
import DAO.LoaiSanPhamDAO;
import DAO.SanPhamDAO;
import POJO.Hangsanxuat;
import POJO.Loaisanpham;
import POJO.Sanpham;
import POJO.Tinhtrang;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author TRANTRI
 */
@WebServlet(name = "AdminCapNhapSanPham", urlPatterns = {"/AdminCapNhapSanPham.do"})
public class AdminCapNhapSanPham extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            int maSp = 1;
            if (request.getParameter("maSp") != null) {
                maSp = Integer.parseInt(request.getParameter("maSp"));
            }
            Sanpham sp = SanPhamDAO.LaySanPhamTheoMa(maSp);
            String url = "/AdminCapNhapSanPham.jsp";
            if (request.getParameter("btSubmit") == null) {//load trang

                ArrayList<Loaisanpham> dsLoaiSP = new ArrayList<Loaisanpham>();
                dsLoaiSP = LoaiSanPhamDAO.LayDanhSachLoaiSanPham();
                ArrayList<Hangsanxuat> dsHang = HangSanXuatDAO.LayDanhSachHangSanXuat();

                request.setAttribute("dsLoaiSP", dsLoaiSP);
                request.setAttribute("dsHang", dsHang);
                request.setAttribute("sp", sp);

            } else {//cap nhap lai san pham
                sp.setTenSanPham(request.getParameter("txtName"));
                sp.setGiaGoc(Float.parseFloat(request.getParameter("txtPrice")));
                sp.setGiamGia(Float.parseFloat(request.getParameter("txtSale")));
               // sp.setDanhGia(4);
                Hangsanxuat hsx = new Hangsanxuat();
                hsx.setMaHangSanXuat(Integer.parseInt(request.getParameter("cbbStore")));
                sp.setHangsanxuat(hsx);
                Loaisanpham lsp = new Loaisanpham();
                lsp.setMaLoaiSanPham(Integer.parseInt(request.getParameter("cbbCate")));
                sp.setLoaisanpham(lsp);
                sp.setMoTa(request.getParameter("txtShortDes"));
                String date = request.getParameter("txtTime");
               
                date = date.replaceAll("-", "/");
                Date d = new Date(date);
                sp.setNgayHetHan(d);
                //sp.setSoHinhAnh(1);
                sp.setSoLuong(Integer.parseInt(request.getParameter("txtQuality")));
                sp.setThongTinChiTiet(request.getParameter("txtLongDes"));
                Tinhtrang tt = new Tinhtrang();
                tt.setMaTinhTrang(1);
                sp.setTinhtrang(tt);

                SanPhamDAO.CapNhapSanPham(sp);
                request.setAttribute("tenSP", sp.getTenSanPham());
                request.setAttribute("maSP", maSp);
                url = "/UploadHinhAnh.jsp";
                //url = "/AdminQuanLySanPham.do";
            }

            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
