/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.SanPhamDAO;
import DAO.SanPhamMongDoiDAO;
import DAO.TinhTrangDAO;
import POJO.Khachhang;
import POJO.Sanpham;
import POJO.Sanphammongdoi;
import POJO.Tinhtrang;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Nguyen Anh Tri
 */
@WebServlet(name = "ThemSanPhamMongDoi", urlPatterns = {"/ThemSanPhamMongDoi.do"})
public class ThemSanPhamMongDoi extends HttpServlet {

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
            HttpSession session = request.getSession();
            String url = "XemSanPhamMongDoi.jsp";

            Khachhang account = (Khachhang) session.getAttribute("account");
            int maSanPham = Integer.parseInt(request.getParameter("maSanPham"));
            Sanpham sp = SanPhamDAO.LaySanPhamTheoMa(maSanPham);
            Date todays = new Date(System.currentTimeMillis());
            SimpleDateFormat sdf_MMddyyyy = new SimpleDateFormat("MM/dd/yyyy");
            String today = sdf_MMddyyyy.format(todays);
            if (account != null) {
                Sanphammongdoi spmd = new Sanphammongdoi();
                spmd.setKhachhang(account);
                spmd.setSanpham(sp);
                Tinhtrang tt = TinhTrangDAO.layThongTin(1);
                spmd.setTinhtrang(tt);
                spmd.setNgayThemVao(today);
                List<Sanphammongdoi> dssp = SanPhamMongDoiDAO.layDanhSachTheoKhachHang(account.getMaKhachHang());
                if (dssp != null) {
                    int kq = 0;
                    Sanphammongdoi temp = new Sanphammongdoi();
                    for (int i = 0; i < dssp.size(); i++) {
                        temp = dssp.get(i);
                        if (temp.getSanpham().getMaSanPham() == maSanPham) {
                            if (temp.getTinhtrang().getMaTinhTrang() == 1) {
                                kq = 1;
                            } else {

                                kq = 2;
                            }
                            break;
                        }
                    }
                    if (kq == 0) {
                        if (SanPhamMongDoiDAO.themMoiSanPhamMongDoi(spmd)) {
                            url = "XemSanPhamMongDoi.do";
                        }
                    }
                    if (kq == 2) {
                        if (SanPhamMongDoiDAO.capNhatTinhTrang(temp)) {
                            url = "XemSanPhamMongDoi.do";
                        }
                    }
                }
            } else {
                request.setAttribute("error", "Please sign to do this!");
            }

            RequestDispatcher rd = request.getRequestDispatcher(url);
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
