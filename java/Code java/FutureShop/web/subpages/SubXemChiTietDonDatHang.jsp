<%-- 
    Document   : SubXemChiTietDonDatHang
    Created on : Jan 2, 2012, 5:21:17 PM
    Author     : Nguyen Anh Tri
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                    <th width="61" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">NO.</span></th>
                    <th width="61" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">DATE</span></th>
                    <th colspan="2" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">PRODUCT INFORMATION</span></th>
                    <th width="63" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">QUANTITY</span></th>
                    <th width="81" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">TOTAL</span></th>
                </tr>
                <c:forEach var="i" begin="0" step="1" end="${requestScope.ChiTietDonDatHang.size()-1}">
                    <tr valign='top'>
                        <td align='center'>
                            ${i+1}
                        </td>
                        <td width='15%' align='center'>
                            <strong>${requestScope.ChiTietDonDatHang[i].dondathang.ngayDatHang}</strong>
                        </td>
                        <td width="20%">
                            <img src= "images/product/${requestScope.ChiTietDonDatHang[i].sanpham.maSanPham}_1.jpg" width="100px" height="100px"/>
                        </td>
                        <td width='20%' align='left'>
                            <strong>${requestScope.ChiTietDonDatHang[i].sanpham.tenSanPham}</strong>
                        </td>
                        <td width='10%' align='center''>
                            <strong>${requestScope.ChiTietDonDatHang[i].soLuong}</strong>
                        </td>
                        <td width='20%' align='center'>
                            <strong><fmt:formatNumber value="${requestScope.ChiTietDonDatHang[i].donGia}" pattern="#,###.##"/> $</strong>
                        </td>
                    </tr> 
                </c:forEach>
            </table>
        </td>
    </tr>
</table>

