<%-- 
    Document   : SubUploadHinhAnh
    Created on : Dec 17, 2011, 6:16:05 PM
    Author     : TRANTRI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 align="center" style="color: #FFB400; background-color:#A67500">Upload Image for ${tenSP}</h1>  
<br/>
<div>Admin can upload more images, but least 1 image for product.</div>
<form  name="frmUploadHinhAnh" method="post" enctype='multipart/form-data' action="UploadHinhAnh.do?maSP=${maSP}">
    <table width="50%" border="1" align="center">
        <tr>
            <td>Select file upload  (jsp, png, gif)</td>
        </tr>
        <tr>
            <td>
                <input type="file" name="fileupload"  multiple ="true" />
                <input type="submit" name="upload" value="Thêm hình ảnh"/>
            </td>
        </tr>
    </table>
</form>