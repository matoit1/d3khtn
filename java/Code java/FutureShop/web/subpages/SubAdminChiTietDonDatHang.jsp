<%-- 
    Document   : SubAdminChiTietDonDatHang
    Created on : Jan 6, 2012, 4:14:54 PM
    Author     : Nguyen Anh Tri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div style="width: 100%;height: 25px;border-style: ridge;">
    <a style="color: #000" href="index.do"><u>Home</u></a> / 
    <a style="color: #000" href="AdminQuanLySanPham.do"><u>Administrator</u></a> / 
    <a style="color: #000" href="AdminQuanLyDonDathang.do"><u>Customer order</u></a> / 
    <a style="color: #000"><b>Order details</b></a>
</div>

<table width='100%' border='1' cellspacing='0' cellpadding='5'>
    <tr bgcolor='#666666'>
        <td class='bgColorMain'>
            <strong><font color='#FFFFFF'>ORDER DATAIL</font></strong>
        </td>
    </tr>
    <tr>
        <td>
            <table width='100%' border='1' cellspacing='0' cellpadding='5'>
                <tr align='center' bgcolor='#999999'>
                    <th width="5%" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">NO.</span></th>
                    <th width="15%" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">CUSTOMER</span></th>
                    <th width="15%" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">DATE</span></th>
                    <th colspan="2" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">PRODUCT INFORMATION</span></th>
                    <th width="13%" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">QUANTITY</span></th>
                    <th width="12%" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">TOTAL</span></th>
                </tr>
                <c:forEach var="i" begin="0" step="1" end="${requestScope.ChiTietDonDatHang.size()-1}">
                    <tr valign='top'>
                        <td align='center'>
                            ${i+1}
                        </td>
                        <td width='15%' align='center'>
                            <strong>${requestScope.ChiTietDonDatHang[i].dondathang.khachhang.tenDangNhap}</strong>
                        </td>
                        <td width='15%' align='center'>
                            <strong>${requestScope.ChiTietDonDatHang[i].dondathang.ngayDatHang}</strong>
                        </td>
                        <td width="20%">
                            <img src= "images/product/${requestScope.ChiTietDonDatHang[i].sanpham.maSanPham}_1.jpg" width="100px" height="100px"/>
                        </td>
                        <td width='30%' align='left'>
                            <strong>${requestScope.ChiTietDonDatHang[i].sanpham.tenSanPham}</strong>
                        </td>
                        <td width='13%' align='center''>
                            <strong>${requestScope.ChiTietDonDatHang[i].soLuong}</strong>
                        </td>
                        <td width='12%' align='center'>
                            <strong><fmt:formatNumber value="${requestScope.ChiTietDonDatHang[i].donGia}" pattern="#,###.##"/> $</strong>
                        </td>
                    </tr> 
                </c:forEach>
            </table>
        </td>
    </tr>
</table>