<%-- 
    Document   : XuatExcell
    Created on : Jan 6, 2012, 4:30:46 PM
    Author     : TRANTRI
--%>

<%@page contentType="application/vnd.ms-excel"
        pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table width="804"  border="1" align="left" bgcolor="">
    <tr bgcolor="#FFFF00">
        <th width="57" align="center" scope="col"><span class="style2">ID</span></th>
        <th width="172" align="center" scope="col"><span class="style2">Product Name</span></th>
        <th width="142" align="center" scope="col"><span class="style2">Categories</span></th>
        <th width="113" align="center" scope="col"><span class="style2">Store</span></th>
        <th width="143" align="center" scope="col"><span class="style2">Price (USD)</span></th>
        <th width="137" align="center" scope="col"><span class="style2">Sale (USD)</span></th>
    </tr>
  <c:forEach begin="0" var="sp" items="${dsSp}">
    <tr>
        <td align="center">${sp.maSanPham}</td>
        <td align="center">${sp.tenSanPham}</td>
        <td align="center">${sp.getTenLoaiSanPham()}</td>
        <td align="center">${sp.getTenHangSX()}</td>
        <td align="center">${sp.giaGoc}</td>
        <td align="center">${sp.giamGia}</td>
    </tr>
  </c:forEach>
</table>
