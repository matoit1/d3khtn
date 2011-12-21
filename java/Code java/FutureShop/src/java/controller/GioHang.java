/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.SanPhamDAO;
import POJO.SanPhamGioHang;
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
 * @author Nguyen Anh Tri
 */
@WebServlet(name = "TrangDatHang", urlPatterns = {"/GioHang.do"})
public class GioHang extends HttpServlet {

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
            String url = "GioHang.jsp";

            // Thêm giỏ hàng
            ArrayList<SanPhamGioHang> gioHang;
            if (session.getAttribute("GioHang") == null) {
                gioHang = new ArrayList<SanPhamGioHang>();
                session.setAttribute("GioHang", gioHang);
            } else {
                gioHang = (ArrayList<SanPhamGioHang>) session.getAttribute("GioHang");
            }

            String action = request.getParameter("action");
            if (action != null) {
                // Đặt mua sản phẩm
                if ("DatMua".equals(action)) {
                    int maSanPham = Integer.parseInt(request.getParameter("maSanPham"));
                    boolean kq = false;
                    for (int i = 0; i < gioHang.size(); i++) {
                        SanPhamGioHang sp = gioHang.get(i);
                        if (sp.getMaSanPham() == maSanPham) {
                            sp.setSoLuong(sp.getSoLuong() + 1);
                            kq = true;
                            break;
                        }
                    }
                    if (kq == false) {
                        SanPhamGioHang sp = SanPhamDAO.layThongTinSanPhamGioHang(maSanPham);
                        sp.setSoLuong(1);
                        gioHang.add(sp);
                    }
                    session.setAttribute("GioHang", gioHang);
                } else {
                    // Xoá sản phẩm trong giỏ hàng
                    if ("Xoa".equals(action)) {
                        int maSanPham = Integer.parseInt(request.getParameter("maSanPham"));
                        for (int j = 0; j < gioHang.size(); j++) {
                            if (gioHang.get(j).getMaSanPham() == maSanPham) {
                                gioHang.remove(j);
                                break;
                            }
                        }
                        session.setAttribute("GioHang", gioHang);
                    }
                }
            }
//            // Cập nhật giỏ hàng
//            String capNhat = request.getParameter("capNhat.x");
//            if (capNhat != null) {
//                String[] sl = request.getParameterValues("soLuong");
//                for (int i = 0; i < gioHang.size(); i++) {
//                    int soLuong = Integer.parseInt(sl[i]);
//                    gioHang.get(i).setSoLuong(soLuong);
//                }
//                
//            }
            String capNhat = request.getParameter("capNhat.x");
            if (capNhat != null) {
                int stt = Integer.parseInt(request.getParameter("stt"));
                int soLuong = Integer.parseInt(request.getParameter("soLuong"));
                gioHang.get(stt).setSoLuong(soLuong);
                session.setAttribute("GioHang", gioHang);
            }
            double tongTien = 0;
            for(int i=0; i<gioHang.size(); i++)
            {
                SanPhamGioHang sp = gioHang.get(i);
                tongTien += (sp.getGiaGoc() - sp.getGiamGia()) * sp.getSoLuong();
            }
            
            request.setAttribute("tongTien", tongTien);
            // Check out
            String checkOut = request.getParameter("checkOut.x");
            if (checkOut != null) {
                session.removeAttribute("GioHang");
                url = "index.do";
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
