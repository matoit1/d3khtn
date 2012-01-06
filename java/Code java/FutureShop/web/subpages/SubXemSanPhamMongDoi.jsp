<%-- 
    Document   : SubXemSanPhamMongDoi
    Created on : Jan 5, 2012, 10:32:22 AM
    Author     : Nguyen Anh Tri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div style="width: 100%;height: 25px;border-style: ridge;">
    <a style="color: #000" href="index.do"><u>Home</u></a> / 
    <a style="color: #000" href="TrangThongTinCaNhan.do"><u>My Account</u></a> / 
    <a style="color: #000"><b>My Wish List</b></a>
</div>

<c:if test="${sessionScope.account eq null}">
    <c:if test="${sessionScope.admin eq null}">
        <table width='100%' border='1' cellspacing='0' cellpadding='5'>
            <tr>
                <td>
                    <p>Your are not sign in. Please sign in your account!</p>
                    <p>If you have not an account. Please sign up for an account</p>
                </td>
            </tr>
        </table>
    </c:if>
    <c:if test="${sessionScope.admin ne null}">
        <table width='100%' border='1' cellspacing='0' cellpadding='5'>
            <tr>
                <td>
                    <p>For user only!</p>
                </td>
            </tr>
        </table>
    </c:if>    
</c:if>

<c:if test="${sessionScope.account ne null}">
    <c:if test="${sessionScope.TuHang.size() gt 0}">
        <h1 style="color: #FFB400; background-color:#A67500">Your Wish List</h1>
        <table width="677" border="1">
            <tr>
                <th  align="center" colspan="2" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">Product Description</span></th>
                <th  align="center" colspan="1" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">Date</span></th>
                <th  align="center" colspan="2" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">Options</span></th>
            </tr>
            <c:forEach var="i" step="1" begin="0" end="${sessionScope.TuHang.size()-1}">
                <tr>
                    <td width="70"><img src= "images/product/${sessionScope.TuHang[i].sanpham.maSanPham}_1.jpg" width="70px" height="70px"/></td>
                    <td width="250">
                        <div align="left">
                            <strong>${sessionScope.TuHang[i].sanpham.tenSanPham}</strong>
                        </div>
                        <div>
                            Quantity : ${sessionScope.TuHang[i].sanpham.soLuong}
                        </div>
                        <div align="left" style="font-weight: bold">
                            <span style="font-size: small; color: #FF9900">
                                Customer Rating
                                <br/>
                                <c:forEach begin="1" step="1" end="${sessionScope.TuHang[i].sanpham.danhGia}" var="j">
                                    <a> <img src="images/rating_on.png"/></a>
                                    </c:forEach>
                                    <c:forEach begin="${sessionScope.TuHang[i].sanpham.danhGia + 1}" end="${5}" step="1" var="j">
                                    <a> <img src="images/rating_off.png"/></a>
                                    </c:forEach> 
                            </span>
                        </div>
                        <div>
                            <c:if test="${sessionScope.TuHang[i].sanpham.soLuong gt 0}">
                                <img src="images/available.png"/>
                            </c:if>
                            <c:if test="${sessionScope.TuHang[i].sanpham.soLuong eq 0}">
                                <img src="images/notavailable.png"/>
                            </c:if>
                        </div>
                    </td>
                    <td align="center" width="100">${sessionScope.TuHang[i].ngayThemVao}</td>
                    <td width="150">
                        <div align="center"><span style="font-weight: bold; color:#FF9900; font-size: small">Save : ${sessionScope.TuHang[i].sanpham.giamGia}$ </span></div>
                        <br/>
                        <div align="center"><span style="font-weight: bold; color: #FF0000; font-size: medium">Price : ${sessionScope.TuHang[i].sanpham.giaGoc}$ </span></div>
                        <br/>
                        <div align="center">
                            <c:url var="DatMua" value="GioHang.do">
                                <c:param name="action" value="DatMua"/>
                                <c:param name="maSanPham" value="${sessionScope.TuHang[i].sanpham.maSanPham}"/>
                            </c:url>
                            <a href="${DatMua}"><img src="images/buy_now_big_on.gif"/></a>
                        </div>
                    </td>
                    <td width="30" align='center'>
                        <c:url var="XoaSanPhamMongDoi" value="XoaSanPhamMongDoi.do">
                            <c:param name="maSanPhamMongDoi" value="${sessionScope.TuHang[i].maSanPhamMongDoi}"/>
                        </c:url>
                        <a href='${XoaSanPhamMongDoi}'><img src='images/delete.jpg' height="20" width="20" /></a>
                    </td>
                </tr>
            </c:forEach> 
        </table>
    </c:if>
    <c:if test="${sessionScope.TuHang.size() eq 0}">
        <h1 style="color: #FFB400; background-color:#A67500">Your Wish List</h1>
        You have not chosen any items for your wish list!
    </c:if>
</c:if>

