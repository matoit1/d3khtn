/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.DanhGiaSanPhamDAO;
import DAO.SanPhamDAO;
import POJO.Danhgiasanpham;
import POJO.Khachhang;
import POJO.Sanpham;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author TRANTRI
 */
@WebServlet(name = "DanhGiaSanPham", urlPatterns = {"/DanhGiaSanPham.do"})
public class DanhGiaSanPham extends HttpServlet {

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
            String url = "";
            HttpSession ss = request.getSession();
            Khachhang kh = (Khachhang) ss.getAttribute("account");
            if (kh == null) {
                url = "/DangNhap.do";
            } else {
                int maSp = 1;
                if (request.getParameter("maSp") != null) {
                    maSp = Integer.parseInt(request.getParameter("maSp"));
                }
                Sanpham sp = SanPhamDAO.LaySanPhamTheoMa(maSp);


                int rate = 5;
                if (request.getParameter("rate") != null) {
                    rate = Integer.parseInt(request.getParameter("rate"));
                }

                Danhgiasanpham dg = DanhGiaSanPhamDAO.KiemTraDanhGia(kh.getMaKhachHang(), maSp);

                if (dg == null) {
                    Danhgiasanpham danhGia = new Danhgiasanpham();
                    danhGia.setKhachhang(kh);
                    danhGia.setSanpham(sp);
                    danhGia.setDiemDanhGia(rate);
                    DanhGiaSanPhamDAO.DanhGia(danhGia);
                } else {
                    if (!dg.getDiemDanhGia().equals(rate)) {
                        dg.setDiemDanhGia(rate);
                        DanhGiaSanPhamDAO.CapNhapDanhGiaSanPham(dg);
                        rate = 0;
                    }
                }

                float diem = DanhGiaSanPhamDAO.TinhDiemDanhGia(maSp, rate);
                int mucDo = DanhGiaSanPhamDAO.XetMucDoTheoDiem(diem);
                //cap nhap lai danh gia san pham
                sp.setDanhGia(mucDo);
                SanPhamDAO.CapNhapSanPham(sp);
                url = "/ChiTietSanPham.do?maSp=" + sp.getMaSanPham();
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
