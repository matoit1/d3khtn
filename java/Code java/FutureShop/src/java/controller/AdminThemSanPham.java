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
import POJO.Tinhtrang;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author TRANTRI
 */
@WebServlet(name = "AdminThemSanPham", urlPatterns = {"/AdminThemSanPham.do"})
public class AdminThemSanPham extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String TMP_DIR_PATH = "C:\\temp";
    private File tmpDir;
    private static final String DESTINATION_DIR_PATH = "..//..//web//images//product";
    private File destinationDir;

    public void jspInit() {
        tmpDir = new File(TMP_DIR_PATH);

        if (tmpDir.exists() == false) {
            tmpDir.mkdir();
        }

        String realPath = getServletContext().getRealPath(DESTINATION_DIR_PATH);
        destinationDir = new File(realPath);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String url = "";
            if (request.getParameter("txtName") == null)//load trang
            {
                //khoi tao danh sach loai san pham va danh sach hang san xuat
                ArrayList<Loaisanpham> dsLoaiSP = LoaiSanPhamDAO.LayDanhSachLoaiSanPham();
                ArrayList<Hangsanxuat> dsHang = HangSanXuatDAO.LayDanhSachHangSanXuat();

                request.setAttribute("dsLoaiSP", dsLoaiSP);
                request.setAttribute("dsHang", dsHang);
                url = "/AdminThemSanPham.jsp";
            } else//them san pham
            {
                Sanpham sp = new Sanpham();
                sp.setTenSanPham(request.getParameter("txtName"));
                sp.setGiaGoc(Float.parseFloat(request.getParameter("txtPrice")));
                sp.setGiamGia(Float.parseFloat(request.getParameter("txtSale")));
                sp.setDanhGia(4);
                Hangsanxuat hsx = new Hangsanxuat();
                hsx.setMaHangSanXuat(Integer.parseInt(request.getParameter("cbbStore")));
                sp.setHangsanxuat(hsx);
                Loaisanpham lsp = new Loaisanpham();
                lsp.setMaLoaiSanPham(Integer.parseInt(request.getParameter("cbbCate")));
                sp.setLoaisanpham(lsp);
                sp.setMoTa(request.getParameter("txtShortDes"));
                Date d = new Date(request.getParameter("txtTime"));
                sp.setNgayHetHan(d);
                sp.setSoHinhAnh(1);
                sp.setSoLuong(Integer.parseInt(request.getParameter("txtQuality")));
                sp.setThongTinChiTiet(request.getParameter("txtLongDes"));
                Tinhtrang tt = new Tinhtrang();
                tt.setMaTinhTrang(1);
                sp.setTinhtrang(tt);

                int masp = SanPhamDAO.ThemSanPham(sp);
                //url ="ThemHinhAnhSanPham.do?maSP="+masp;

                //upload hinh anh
                try {
                    DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
                    fileItemFactory.setSizeThreshold(1 * 1024 * 1024); //1 MB        
                    fileItemFactory.setRepository(tmpDir);
                    ServletFileUpload uploadHandler = new ServletFileUpload(fileItemFactory);
                    try {
                        List items = uploadHandler.parseRequest(request);
                        Iterator itr = items.iterator();

                        while (itr.hasNext()) {
                            FileItem item = (FileItem) itr.next();
                            if (item.isFormField()) {
                            } else {

                                String content = item.getContentType();
                                if (content.contains("png") || content.contains("jpg") || content.contains("gif") || content.contains("jpeg")) {
                                    File file = new File(destinationDir, item.getName());
                                    //String fileName = file.getName();
                                    //HttpSession session = request.getSession();
                                    //session.setAttribute("filename", fileName);

                                    item.write(file);
                                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/AdminQuanLySanPham.do");
                                    rd.forward(request, response);
                                }
                            }
                        }

                        url = "/AdminQuanLySanPham.do";

                    } catch (FileUploadException ex) {
                        log("Lỗi phân tích yêu cầu upload file !", ex);
                    }
                } catch (Exception ex) {
                    log("Lỗi xãy ra trong quá trình upload file !", ex);
                }//ket thuc up anh
            }//ket thuc up san pham
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
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
