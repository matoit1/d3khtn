<%-- 
    Document   : SubAdminThemSanPham
    Created on : Dec 12, 2011, 11:17:57 PM
    Author     : TRANTRI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 align="center" style="color: #FFB400; background-color:#A67500">Add New Product</h1>
<form action="AdminThemSanPham.do" name="AddNewProduct" method="post">
    <table width="100%" border="0">
        <tr>
            <td width="32%"><div align="right">Name Product:</div></td>
            <td width="68%"><input type="text" name="txtName" value="" style="width: 400px" /></td>
        </tr>
        <tr>
            <td><div align="right">Categories</div></td>
            <td>
                <select name="cbbCate" >
                    <c:forEach var="loaisp" items="${dsLoaiSP}">
                        <option value="${loaisp.getMaLoaiSanPham()}">${loaisp.getTenLoaiSanPham()}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td><div align="right">Store</div></td>
            <td>
                <select name="cbbStore" >
                    <c:forEach var="hang" items="${dsHang}">
                        <option value="${hang.getMaHangSanXuat()}">${hang.getTenHangSanXuat()}</option>
                    </c:forEach>
                </select></td>
        </tr>
        <tr>
            <td><div align="right">Time Deadline</div></td>
            <td>
                <input type="text" name="txtTime" value="" /> 
                (yyyy/mm/dd) 
            </td>
        </tr>
        <tr>
            <td><div align="right">Quality</div></td>
            <td><input type="text" name="txtQuality" value="100" /></td>
        </tr>
        <tr>
            <td><div align="right">Product Price:</div></td>
            <td><input type="text" name="txtPrice" value="" /></td>
        </tr>
        <tr>
            <td><div align="right">Sale Price:</div></td>
            <td><input type="text" name="txtSale" value="" /></td>
        </tr>
        <tr>
            <td valign="top"><div align="right">Short Description:</div></td>
            <td><textarea name="txtShortDes" cols="70" rows="5" >  write here </textarea></td>
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
        <td><textarea name="txtLongDes" cols="70" rows="30" >  write here </textarea></td>
        </tr>
        <tr>
            <td><div align="right"></div></td>
            <td><input type="submit" name="btSubmit" value="Add New Product"></td>
        </tr>
    </table>
</form>