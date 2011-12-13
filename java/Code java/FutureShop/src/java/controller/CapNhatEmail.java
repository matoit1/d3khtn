/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.EmailDAO;
import DAO.KhachHangDAO;
import POJO.Khachhang;
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
 * @author Nguyen Anh Tri
 */
@WebServlet(name = "CapNhatEmail", urlPatterns = {"/CapNhatEmail.do"})
public class CapNhatEmail extends HttpServlet {

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
            String url = "CapNhatEmail.jsp";
            request.setCharacterEncoding("UTF-8");
            response.setContentType("UTF-8");
            if (session.getAttribute("account") == null) {
                request.setAttribute("error", "You're not sign in, Please sign in ! If you does'nt have account, plese sign up for new account !");
            } else {
                if (request.getParameter("Update") != null) {
                    try {
                        Khachhang kh = (Khachhang) session.getAttribute("account");
                        String pass = request.getParameter("password");
                        String tenDangNhap = kh.getTenDangNhap();
                        if (KhachHangDAO.kiemTraDangNhap(tenDangNhap, pass)) {
                            String email = request.getParameter("newemail");
                            kh.setEmail(email);
                            if (KhachHangDAO.capNhatTaiKhoan(kh)) {
                                request.setAttribute("message", "Your Email Address have been successful changed !");
//                                String subject = "Registration Infomation";
//                                String body = String.format("Hi %s, /nHere is your account infomation : /nYour ID : %s ", kh.getHoTen(), kh.getMaKhachHang());
//                                EmailDAO.send(kh.getEmail(), subject, body);
                            } else {
                                request.setAttribute("message", "Your Email Address have not been successful changed !");
                            }
                        } else {
                            request.setAttribute("message", "Your Password is incorrect !");
                        }
                    } catch (Exception ex) {
                        System.err.println(ex);
                    }
                }
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
