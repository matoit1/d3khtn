/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.HangSanXuatDAO;
import DAO.NhomSanPhamDAO;
import DAO.SanPhamDAO;
import POJO.Hangsanxuat;
import POJO.Nhomsanpham;
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

/**
 *
 * @author VIET
 */
@WebServlet(name = "index.do", urlPatterns = {"/index.do"})
public class index extends HttpServlet {

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
       
        ArrayList<Nhomsanpham> dsNhomSanPham = new ArrayList<Nhomsanpham>();
        ArrayList<Hangsanxuat> listSpecialStores = new ArrayList<Hangsanxuat>();
        ArrayList<Sanpham> dsSanPham = new ArrayList<Sanpham>();
        try {
            dsNhomSanPham = NhomSanPhamDAO.LayDanhSachNhomSanPham();
            listSpecialStores = HangSanXuatDAO.LayDanhSachSpecialStores();
            dsSanPham = SanPhamDAO.LayDanhSachNhomSanPham();
            HttpSession session = request.getSession();
            session.setAttribute("dsNhomsanPham", dsNhomSanPham);
            session.setAttribute("listSpecialStores", listSpecialStores);
            request.setAttribute("dsSanPham", dsSanPham);
            String url = "index.jsp";
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
