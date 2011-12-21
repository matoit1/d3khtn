<%-- 
    Document   : TrangDatHang
    Created on : Dec 21, 2011, 11:55:31 AM
    Author     : Nguyen Anh Tri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1 align="center" style="color: #FFB400; background-color:#A67500">Your Cart</h1>
You have chosen to purchase the items listed below. To complete your purchase click the "Checkout" button.
<div align="right"> 
    <a href="index.do"><img src="images/continue_shopping1_on.gif"/></a> 
    <input type="image" src="images/checkout_on.gif" name="checkOut"/> 
</div>
<table width="677" border="1">
    <tr>
        <th colspan="2" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">Product Description</span></th>
        <th width="63" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">Quantity</span></th>
        <th width="81" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">Availability</span></th>
        <th width="79" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">Unit Price</span></th>
        <th width="61" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">Price</span></th>
    </tr>
    <c:if test="${sessionScope.GioHang.size() gt 0}">
        <c:forEach var="i" step="1" begin="0" end="${sessionScope.GioHang.size()-1}">
            <tr>
                <td width="144"><img src= "${sessionScope.GioHang[i].hinhAnh}" width="150px" height="150px"/></td>
                <td width="209"><strong>${sessionScope.GioHang[i].tenSanPham}</strong> </td>
                <td>
                    <form action="GioHang.do" name="update">
                        <input name="soLuong" id="soLuong" type="text" value="${sessionScope.GioHang[i].soLuong}" size="6" width="60px"/>
                        <br/>
                        <br/>
                        <input type="image" src="images/update_on.gif" name="capNhat" />
                        <input type="hidden" name="stt" value="${i}"/>
                    </form>
                    <br/>
                    <br/>
                    <c:url var="Xoa" value="GioHang.do">
                        <c:param name="action" value="Xoa"/>
                        <c:param name="maSanPham" value="${sessionScope.GioHang[i].maSanPham}"/>
                    </c:url>
                    <a href="${Xoa}"> Remove </a> 
                </td>
                <td>
                    []Ship<br/>
                    []Pick Up<br/>
                    Learn More 
                </td>
                <td>${sessionScope.GioHang[i].giaGoc}</td>
                <td>
                    <fmt:formatNumber value="${(sessionScope.GioHang[i].giaGoc - sessionScope.GioHang[i].giamGia) * sessionScope.GioHang[i].soLuong}" pattern="#,###"/>
                </td>
            </tr>
        </c:forEach>
    </c:if>
    <tr>
        <td colspan="3" rowspan="2">&nbsp;</td>
        <td colspan="2" bgcolor="#999999">
            <dl>
                <dt> Product Total</dt>
        </td>        
        <td bgcolor="#999999">
            <fmt:formatNumber value="${requestScope.tongTien}" pattern="#,###"/>
        </td>
    </tr>
    <tr>
        <td colspan="2" bgcolor="#999999">
            <span style="font-weight: bold">Subtotal</span>
        </td>
        <td bgcolor="#999999">
            <span style="font-weight: bold">
                <fmt:formatNumber value="${requestScope.tongTien}" pattern="#,###"/>
            </span>
        </td>
    </tr>
</table>
<div align="right"> 
    <a href="index.do"><img src="images/continue_shopping1_on.gif"/></a>
    <input type="image" src="images/checkout_on.gif"  name="checkOut"/>
</div>