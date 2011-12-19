<%-- 
    Document   : SubAdminCapNhapSanPham
    Created on : Dec 15, 2011, 12:34:20 AM
    Author     : TRANTRI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1 align="center" style="color: #FFB400; background-color:#A67500">Edit Product</h1>
<form action="AdminCapNhapSanPham.do?maSp=${sp.maSanPham}" name="EditProduct" method="post">
    <table width="100%" border="0">
        <tr>
            <td width="32%"><div align="right">Name Product:</div></td>
            <td width="68%"><input type="text" name="txtName" value="${sp.tenSanPham}" style="width: 400px" /></td>
        </tr>
        <tr>
            <td width="32%"><div align="right">Image Product:</div></td>
            <td width="68%">
                <c:forEach var="i" begin="1" end="${sp.soHinhAnh}">
                    <img src="images/product/${sp.maSanPham}_1.jpg" height="100" width="100">
                </c:forEach>
                <br/>
                <a href="UploadHinhAnh.do?maSP=${sp.maSanPham}" target="_blank"> Edit images</a></td>
        </tr>
        <tr>
            <td><div align="right">Categories</div></td>
            <td><select name="cbbCate" >

                    <c:forEach var="loaisp" items="${dsLoaiSP}">
                        <option value="${loaisp.getMaLoaiSanPham()}">${loaisp.getTenLoaiSanPham()}</option>
                    </c:forEach>
                    <option  selected='selected' value='${sp.loaisanpham.getMaLoaiSanPham()}'> ${sp.getTenLoaiSanPham()}</option>
                </select></td>
        </tr>
        <tr>
            <td><div align="right">Store</div></td>
            <td>
                <select name="cbbStore" >
                    <c:forEach var="hang" items="${dsHang}">
                        <option value="${hang.getMaHangSanXuat()}">${hang.getTenHangSanXuat()}</option>
                    </c:forEach>
                    <option  selected='selected' value='${sp.hangsanxuat.getMaHangSanXuat()}'> ${sp.getTenHangSX()}</option>
                </select></td>
        </tr>
        <tr>
            <td><div align="right">Time Deadline</div></td>
            <td><input type="text" name="txtTime" value="${sp.ngayHetHan}" /> 
                (yyyy/mm/dd) </td>
        </tr>
        <tr>
            <td><div align="right">Quality</div></td>
            <td><input type="text" name="txtQuality" value="${sp.soLuong}" /></td>
        </tr>
        <tr>
            <td><div align="right">Product Price:</div></td>
            <td><input type="text" name="txtPrice" value="${sp.giaGoc}" /></td>
        </tr>
        <tr>
            <td><div align="right">Sale Price:</div></td>
            <td><input type="text" name="txtSale" value="${sp.giamGia}" /></td>
        </tr>
        <tr>
            <td valign="top"><div align="right">Short Description:</div></td>
            <td><textarea name="txtShortDes" cols="70" rows="5" >  ${sp.moTa} </textarea></td>
        </tr>
        <tr>

        <script type="text/javascript" src="fckeditor/fckeditor.js"></script>
        <script type="text/javascript">
            window.onload = function()
            {
                var oFCKeditor = new FCKeditor( 'txtLongDes' ) ;
                oFCKeditor.BasePath="fckeditor/";
                oFCKeditor.Height= 400;
                oFCKeditor.ReplaceTextarea() ;
            }

        </script>  
        <td valign="top"><div align="right">Product Description: </div></td>
        <td><textarea name="txtLongDes" cols="70" rows="30" >  ${sp.thongTinChiTiet} </textarea></td>
        </tr>
        <tr>
            <td><div align="right"></div></td>
            <td><input type="submit" name="btSubmit" value="Edit Product"></td>
        </tr>
    </table>
</form>