/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.HangSanXuatDAO;
import DAO.SanPhamDAO;
import POJO.Hangsanxuat;
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

/**
 *
 * @author VIET
 */
@WebServlet(name = "AdminTimKiemSanPham.do", urlPatterns = {"/AdminTimKiemSanPham.do"})
public class AdminTimKiemSanPham extends HttpServlet {

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
            String tenSanPham = "";
            if (request.getParameter("tenSanPham") != null) {
                tenSanPham = request.getParameter("tenSanPham").toString().trim();
            }
            int maHangSanXuat = 0;
            if (request.getParameter("maHangSanXuat") != null) {
                maHangSanXuat = Integer.parseInt(request.getParameter("maHangSanXuat").toString().trim());
            }
            int maLoaiSanPham = 0;
            if (request.getParameter("maLoaiSanPham") != null) {
                maLoaiSanPham = Integer.parseInt(request.getParameter("maLoaiSanPham").toString().trim());
            }
            
            int page=1;
            if(request.getParameter("page")!=null)
            {
                page = Integer.parseInt(request.getParameter("page"));
            }
            int soTrang = 1;
            soTrang = SanPhamDAO.AdminTinhSoTrang(tenSanPham, page, maHangSanXuat, maLoaiSanPham);
            ArrayList<Sanpham> dsSP = SanPhamDAO.AdminTimKiemSanPham(tenSanPham,page,maHangSanXuat,maLoaiSanPham);
            ArrayList<Hangsanxuat> dsHangSanXuat = HangSanXuatDAO.LayDanhSachHangSanXuat();
            request.setAttribute("dsHangSanXuat", dsHangSanXuat);
            request.setAttribute("soTrang", soTrang);
            request.setAttribute("dsSP", dsSP);
            request.setAttribute("page", page);
            request.setAttribute("tenSanPham",tenSanPham);
            request.setAttribute("maHangSanXuat",maHangSanXuat);
            request.setAttribute("maLoaiSanPham",maLoaiSanPham);
            
            RequestDispatcher rd = request.getRequestDispatcher("AdminTimKiemSanPham.jsp");
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
