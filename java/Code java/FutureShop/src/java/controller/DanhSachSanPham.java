/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.LoaiSanPhamDAO;
import DAO.NhomSanPhamDAO;
import DAO.SanPhamDAO;
import POJO.Loaisanpham;
import POJO.Sanpham;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.jasper.tagplugins.jstl.core.Catch;

/**
 *
 * @author VIET
 */
@WebServlet(name = "DanhSachSanPham.do", urlPatterns = {"/DanhSachSanPham.do"})
public class DanhSachSanPham extends HttpServlet {

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
            ArrayList<Sanpham> dsSanPham = new ArrayList<Sanpham>();
            ArrayList<Loaisanpham> dsLoaiSanPham = new ArrayList<Loaisanpham>();

            int trang = 1;
            if (request.getParameter("trang") != null) {
                trang = Integer.parseInt(request.getParameter("trang").toString().trim());
            }
            int soTrang = 1;

            int maNhomSanPham = 0;
            if (request.getParameter("maNhomSanPham") != null) {
                maNhomSanPham = Integer.parseInt(request.getParameter("maNhomSanPham").toString().trim());
                dsSanPham = SanPhamDAO.LayDanhSachSanPhamTheoNhomSanPham(maNhomSanPham, trang);
                session.removeAttribute("dsLoaiSanPham");
                dsLoaiSanPham = LoaiSanPhamDAO.LayDanhSachLoaiSanPhamTheoMa(maNhomSanPham);

                soTrang = SanPhamDAO.TinhSoTrangTheoNhomSanPham(maNhomSanPham);
            }
            int maLoaiSanPham = 0;
            if (request.getParameter("maLoaiSanPham") != null && !request.getParameter("maLoaiSanPham").equals("0")) {
                maLoaiSanPham = Integer.parseInt(request.getParameter("maLoaiSanPham").toString().trim());
                maNhomSanPham = NhomSanPhamDAO.TimMaNhomSanPham(maLoaiSanPham);
                session.removeAttribute("dsLoaiSanPham");
                dsLoaiSanPham = LoaiSanPhamDAO.LayDanhSachLoaiSanPhamTheoMa(maNhomSanPham);

                dsSanPham.clear();
                dsSanPham = SanPhamDAO.LayDanhSachSanPhamTheoLoaiSanPham(maLoaiSanPham, trang);

                soTrang = SanPhamDAO.TinhSoTrangTheoLoaiSanPham(maLoaiSanPham);
            }

            request.setAttribute("soTrang", soTrang);
            request.setAttribute("maNhomSanPham", maNhomSanPham);
            request.setAttribute("maLoaiSanPham", maLoaiSanPham);
            request.setAttribute("dsSanPham", dsSanPham);
            session.setAttribute("dsLoaiSanPham", dsLoaiSanPham);
            RequestDispatcher rd = request.getRequestDispatcher("DanhSachSanPham.jsp");
            rd.forward(request, response);
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
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
