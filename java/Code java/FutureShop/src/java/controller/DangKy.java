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
import net.tanesha.recaptcha.ReCaptchaImpl;
import net.tanesha.recaptcha.ReCaptchaResponse;

/**
 *
 * @author TRANTRI
 */
@WebServlet(name = "DangKy", urlPatterns = {"/DangKy.do"})
public class DangKy extends HttpServlet {

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
            String url = "DangKy.jsp";
            request.setCharacterEncoding("UTF-8");
            response.setContentType("UTF-8");
            // Kiểm tra có ai đăng nhập hay chưa
            if (session.getAttribute("account") != null) {
                response.sendRedirect("index.jsp");
                return;
            }
            // Bắt sự kiện click vào nút đăng ký
            if (request.getParameter("Register") != null) {
                Khachhang account = null;
                String tenDangNhap = request.getParameter("id");
                String matKhau = request.getParameter("password");
                String hoTen = request.getParameter("fullname");
                String email = request.getParameter("email");
                String soDienThoai = request.getParameter("phone");

                if (request.getAttribute("account") == null) {
                    account = new Khachhang(tenDangNhap, matKhau, hoTen, email, soDienThoai);
                } else {
                    account = (Khachhang) request.getAttribute("account");
                    account.setTenDangNhap(tenDangNhap);
                    account.setMatKhau(matKhau);
                    account.setHoTen(hoTen);
                    account.setEmail(email);
                    account.setSoDienThoai(soDienThoai);
                }

                String remoteAddr = request.getRemoteAddr();
                ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
                reCaptcha.setPrivateKey("6LcnlsgSAAAAADTPvlmDbKgAIb7i9DoQT6iv5uGd");

                String challenge = request.getParameter("recaptcha_challenge_field");
                String uresponse = request.getParameter("recaptcha_response_field");
                request.setAttribute("account", account);
                ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);
                if (reCaptchaResponse.isValid()) {
                    try {
                        if (!KhachHangDAO.kiemTraTonTai(account.getTenDangNhap())) {
                            if (KhachHangDAO.themMoiKhachHang(account)) {
                                request.setAttribute("message", "Register Successful !");
                                String subject = "Registration Infomation";
                                String body = String.format("Hi %s, /nHere is your account infomation : /nYour ID : %s /nYour Password : %s /n ",account.getHoTen(),account.getMaKhachHang(),matKhau);
                                EmailDAO.send(account.getEmail(), subject, body);
                                request.removeAttribute("account");
                            } else {
                                request.setAttribute("message", "Register Unsuccessful !");
                            }
                        } else {
                            request.setAttribute("message", "This account is exist ! Please choose another account !");
                        }
                    } catch (Exception ex) {
                        System.err.println(ex);
                    }
                } else {
                    request.setAttribute("Captcha", "Wrong Security Value ! Please Correct Security value !");
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
