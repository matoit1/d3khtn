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
@WebServlet(name = "TimKiemNangCao.do", urlPatterns = {"/TimKiemNangCao.do"})
public class TimKiemNangCao extends HttpServlet {

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
            float gia = 0;
            try {
                if (request.getParameter("gia") != null) {
                    gia = Float.parseFloat(request.getParameter("gia").toString().trim());
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }

            int maHangSanXuat = 0;
            if (request.getParameter("maHangSanXuat") != null) {
                maHangSanXuat = Integer.parseInt(request.getParameter("maHangSanXuat").toString().trim());
            }
            int maLoaiSanPham = 0;
            if (request.getParameter("maLoaiSanPham") != null) {
                maLoaiSanPham = Integer.parseInt(request.getParameter("maLoaiSanPham").toString().trim());
            }

            int trang = 1;
            if (request.getParameter("trang") != null) {
                trang = Integer.parseInt(request.getParameter("trang").toString());
            }

            int soTrang = 1;
            soTrang = SanPhamDAO.TinhSoTrangTheoTimKiemNangCao(tenSanPham, trang, gia, maHangSanXuat, maLoaiSanPham);

            ArrayList<Sanpham> dsSanPham = new ArrayList<Sanpham>();
            dsSanPham = SanPhamDAO.TimKiemSanPhamNangCao(tenSanPham, trang, gia, maHangSanXuat, maLoaiSanPham);
            ArrayList<Hangsanxuat> dsHangSanXuat = HangSanXuatDAO.LayDanhSachHangSanXuat();
            ArrayList<Loaisanpham> dsLoaiSanPham = LoaiSanPhamDAO.LayDanhSachLoaiSanPham();
            request.setAttribute("dsHangSanXuat", dsHangSanXuat);
            request.setAttribute("dsLoaiSanPham", dsLoaiSanPham);
            request.setAttribute("dsSanPham", dsSanPham);
            request.setAttribute("soTrang", soTrang);
            request.setAttribute("tenSanPham",tenSanPham);
            request.setAttribute("maHangSanXuat",maHangSanXuat);
            request.setAttribute("maLoaiSanPham",maLoaiSanPham);
            request.setAttribute("gia",gia);
            RequestDispatcher rd = request.getRequestDispatcher("TimKiemNangCao.jsp");
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
