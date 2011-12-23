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
@WebServlet(name = "KhoiPhucMatKhau", urlPatterns = {"/KhoiPhucMatKhau.do"})
public class KhoiPhucMatKhau extends HttpServlet {

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
            String url = "KhoiPhucMatKhau.jsp";
            request.setCharacterEncoding("UTF-8");
            response.setContentType("UTF-8");

            if (request.getParameter("reset") != null) {
                String tenDangNhap = request.getParameter("id");
                String email = request.getParameter("email");

                Khachhang account = KhachHangDAO.layThongTinKhachHang(tenDangNhap);
                if (account == null) {
                    request.setAttribute("error", "Your ID is incorrect ! Please try again !");
                } else {
                    if (!account.getEmail().equals(email)) {
                        request.setAttribute("error", "Your Email Address is incorrect ! Please try again !");
                    } else {
                        String password = KhachHangDAO.randomPassword();
                        account.setMatKhau(password);
                        if (KhachHangDAO.capNhatMatKhau(account)) {
                            try {
                                String subject = "Reset Password Infomation";
                                String body = String.format("Hi %s, <br/>Here is your account infomation : <br/>Your ID : %s <br/>Your New Password : %s <br/>Please login and reset your password! <br/> ", account.getHoTen(), account.getTenDangNhap(), password);
                                EmailDAO.send(account.getEmail(), subject, body);
                                request.setAttribute("message", "Your New Password have been sent to your email !");
                            } catch (Exception ex) {
                                System.err.println(ex);
                            }
                        }
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