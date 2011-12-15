<%-- 
    Document   : SubAdminQuanLySanPham
    Created on : Dec 12, 2011, 11:27:18 PM
    Author     : TRANTRI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1 align="center" style="color: #FFB400; background-color:#A67500">Products Manager</h1>  

<div style="font-weight:bold"><a href="AdminThemSanPham.do"><img src="images/new.gif" height="40" width="100"/> Add new product</a></div>

<div align="right">           
    Page
    <c:forEach var="i" begin="1"  end="${soTrang-1}">
        <a href='AdminQuanLySanPham.do?page=${i}'>${i}</a> |
    </c:forEach>
    <a href='AdminQuanLySanPham.do?page=${soTrang}'>${soTrang}</a> 
</div>



<table width="100%" border="1" cellspacing="0" cellpadding="5">
    <tr style="color:#006600; background-color:#FFCC33">
        <th width="8%" scope="col">Order No</th>
        <th width="38%" scope="col">Product Name</th>
        <th width="14%" scope="col">Image</th>
        <th width="18%" scope="col">Department</th>
        <th width="18%" scope="col">Stores</th>
        <th width="11%" scope="col">Edit</th>
        <th width="11%" scope="col"><p>Delete (Restore)</p>
</th>
</tr>
<c:forEach  var="sp" items="${dsSP}">
    <tr>
        <td><div align="center">${sp.maSanPham}</div></td>
        <td><span style="font-weight: bold; color:#993300"><a href="ChiTietSanPham.do?maSp=${sp.maSanPham}">${sp.tenSanPham}</a></span></td>
        <td><img src="images/product/${sp.maSanPham}_0.jpg" height="100" width="100"></td>
        <td>${sp.getTenLoaiSanPham()}</td>
        <td>${sp.getTenHangSX()}</td>
        <td><div align="center"><a href="AdminCapNhapSanPham.do?maSp=${sp.maSanPham}" > <img src="images/button_edit_grey.gif"/> </a></div></td>
        <c:if test="${sp.getMaTinhTrang() eq 1}">
        <td><div align="center"><a href="XoaSanPham.do?maSp=${sp.maSanPham}" > <img src="images/delete.jpg" height="20" width="20"/></a></div></td>
        </c:if>
        <c:if test="${sp.getMaTinhTrang() ne 1}">
        <td><div align="center"><a href="KhoiPhucSanPham.do?maSp=${sp.maSanPham}" > <img src="images/restore.jpg" height="20" width="20"/></a></div></td>
        </c:if>
    </tr>
</c:forEach>
</table>
<br/>
<br/>
