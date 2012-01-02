/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.ChiTietDonDatHangDAO;
import DAO.DonDatHangDAO;
import DAO.EmailDAO;
import DAO.SanPhamDAO;
import DAO.TinhTrangDAO;
import DAO.TinhTrangDonDatHangDAO;
import POJO.Chitietdondathang;
import POJO.Dondathang;
import POJO.Khachhang;
import POJO.SanPhamGioHang;
import POJO.Sanpham;
import POJO.Tinhtrang;
import POJO.Tinhtrangdondathang;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
 * @author Nguyen Anh Tri
 */
@WebServlet(name = "DatHang", urlPatterns = {"/DatHang.do"})
public class DatHang extends HttpServlet {

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
            String url = "DatHang.jsp";

            if (session.getAttribute("account") != null && session.getAttribute("GioHang") != null) {
                Khachhang account = (Khachhang) session.getAttribute("account");
                ArrayList<SanPhamGioHang> gioHang = new ArrayList<SanPhamGioHang>();
                gioHang = (ArrayList<SanPhamGioHang>) session.getAttribute("GioHang");

                Date todays = new Date(System.currentTimeMillis());
                SimpleDateFormat sdf_MMddyyyy = new SimpleDateFormat("MM/dd/yyyy");
                String orderday = sdf_MMddyyyy.format(todays);

                request.setAttribute("orderday", orderday);

                if (request.getParameter("Purchase") != null) {
                    String remoteAddr = request.getRemoteAddr();

                    ReCaptchaImpl reCaptcha = new ReCaptchaImpl();
                    reCaptcha.setPrivateKey("6LcnlsgSAAAAADTPvlmDbKgAIb7i9DoQT6iv5uGd");

                    String challenge = request.getParameter("recaptcha_challenge_field");
                    String uresponse = request.getParameter("recaptcha_response_field");
                    ReCaptchaResponse reCaptchaResponse = reCaptcha.checkAnswer(remoteAddr, challenge, uresponse);
                    if (challenge != null && uresponse != null) {
                        if (reCaptchaResponse.isValid()) {
                            Dondathang ddh_temp = new Dondathang();
                            ddh_temp.setKhachhang(account);
                            ddh_temp.setNgayDatHang(orderday);
                            // Lấy thông tin tình trạng đơn đặt hàng
                            Tinhtrangdondathang ttddh = TinhTrangDonDatHangDAO.layThongTin(1);
                            // Lấy thông tin tình trạng
                            Tinhtrang tt = TinhTrangDAO.layThongTin(1);
                            float subTotal = (Float)session.getAttribute("subTotal");
                            ddh_temp.setTongTien(subTotal);
                            ddh_temp.setTinhtrangdondathang(ttddh);
                            ddh_temp.setTinhtrang(tt);
                            int hinhThuc = Integer.parseInt(request.getParameter("Availability"));

                            if (hinhThuc == 1) {
                                ddh_temp.setHinhThucMuaHang("Ship to home");
                                String diaDiem = request.getParameter("address");
                                ddh_temp.setDiaDiemGiaoHang(diaDiem);
                            } else {
                                ddh_temp.setHinhThucMuaHang("Pick at store");
                            }

                            int temp = DonDatHangDAO.themDonDatHang(ddh_temp);
                            for (int i = 0; i < gioHang.size(); i++) {
                                Chitietdondathang ctddh = new Chitietdondathang();
                                SanPhamGioHang spgh = gioHang.get(i);
                                Sanpham sp = SanPhamDAO.LaySanPhamTheoMa(spgh.getMaSanPham());
                                sp.setSoLuong(sp.getSoLuong() - spgh.getSoLuong());
                                SanPhamDAO.CapNhapSanPham(sp);
                                Dondathang ddh = DonDatHangDAO.layThongTinDonDatHang(temp);
                                ctddh.setSanpham(sp);
                                ctddh.setDondathang(ddh);
                                ctddh.setDonGia((spgh.getGiaGoc() - spgh.getGiamGia()) * spgh.getSoLuong());
                                ctddh.setSoLuong(spgh.getSoLuong());
                                
                                boolean kq = ChiTietDonDatHangDAO.themChiTiet(ctddh);
                                
                            }
                            // Thực hiện gửi email
                            try {
                                request.setAttribute("message", "Order Successful !");
                                String subject = "Order Infomation";
                                String body = String.format("Hi %s, <br/>Here is your order infomation : <br/>", account.getHoTen());
                                String body1 = "Product                   Quantity<br/>";
                                String body2 = "";
                                String body3 = "<br/>Total : " + session.getAttribute("subTotal");
                                for (int i = 0; i < gioHang.size(); i++) {
                                    String tam = String.format("%s                 %s<br/>", gioHang.get(i).getTenSanPham(), gioHang.get(i).getSoLuong());
                                    body2 = body2 + tam;
                                }
                                body = body + body1 + body2 + body3;
                                EmailDAO.send(account.getEmail(), subject, body);
                                session.removeAttribute("subTotal");
                                session.removeAttribute("GioHang");
                                url = "TrangThongTinCaNhan.jsp";
                            } catch (Exception ex) {
                                System.err.println(ex);
                            }
                        }
                    }
                }
            }  
            else
            {
                request.setAttribute("error", "This side only for user");
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
