/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import DAO.SanPhamDAO;
import POJO.Sanpham;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
//import org.apache.commons.fileupload.FileItem;
//import org.apache.commons.fileupload.FileUploadException;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author TRANTRI
 */
@WebServlet(name = "UploadHinhAnh", urlPatterns = {"/UploadHinhAnh.do"})
public class UploadHinhAnh extends HttpServlet {

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
            int maSP = 1;
            if (request.getParameter("maSP") != null) {
                maSP = Integer.parseInt(request.getParameter("maSP"));
            }
            String url="";
            if (request.getParameter("uploaded") == null) {
                String tenSP = SanPhamDAO.LaySanPhamTheoMa(maSP).getTenSanPham();
                request.setAttribute("tenSP", tenSP);
                request.setAttribute("maSP", maSP);
                url = "/UploadHinhAnh.jsp";
            } else {
                jspInit();
                DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
                fileItemFactory.setSizeThreshold(5 * 1024 * 1024); //1 MB        
                fileItemFactory.setRepository(tmpDir);
                ServletFileUpload uploadHandler = new ServletFileUpload(fileItemFactory);
                try {
                    List items = uploadHandler.parseRequest(request);
                    Iterator itr = items.iterator();
                    int i = 0;
                    while (itr.hasNext()) {
                        FileItem item = (FileItem) itr.next();
                        if (item.isFormField()) {
                        } else {
                            i++;
                            String content = item.getContentType();
                            if (content.contains("png") || content.contains("jpg") || content.contains("gif") || content.contains("jpeg")) {
                                File file = new File(destinationDir, maSP + "_" + i + ".jpg"); //dat lai ten hinh

                                item.write(file); //ghi hinh lai

                            }
                        }
                    }
                    //cap nhap lai so luong hinh anh
                    Sanpham sp = SanPhamDAO.LaySanPhamTheoMa(maSP);
                    sp.setSoHinhAnh(i);
                    SanPhamDAO.CapNhapSanPham(sp);


                   url="/AdminQuanLySanPham.do";
                } catch (FileUploadException ex) {
                    System.out.println("Lỗi phân tích yêu cầu upload file !");
                }
            }
             RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
                    rd.forward(request, response);
        } catch (Exception ex) {
            System.out.println("Lỗi xãy ra trong quá trình upload file !");
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
