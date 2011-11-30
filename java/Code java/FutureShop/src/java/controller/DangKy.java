/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.tanesha.recaptcha.ReCaptcha;
import net.tanesha.recaptcha.ReCaptchaFactory;

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
            //khoi tao recapcha roi load len
            ReCaptcha c = ReCaptchaFactory.newReCaptcha("6LclnsgSAAAAAEkKyYILYaGl_rQR83XcBePwt2r1", "6LclnsgSAAAAAO-KFN8GMdEgTPchllcVOuciVtOF", false);
            String recaptcha = c.createRecaptchaHtml(null, null);

            // xu ly du lieu
            if (request.getParameter("btnRegister") == null) {
                //khoi tao trang
                //request.setAttribute("recapcha", recapcha);
                //request.setAttribute("mess", mess);
                request.setAttribute("recaptcha", recaptcha);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/DangKy.jsp");
                rd.forward(request, response);
            } else {
                //kiem tra du lieu de dang ky
                request.setAttribute("recaptcha", recaptcha);
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/DangKy.jsp");
                rd.forward(request, response);
            }
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
