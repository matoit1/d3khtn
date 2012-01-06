<%-- 
    Document   : SubAdminQuanLyDonDatHang
    Created on : Jan 6, 2012, 1:50:31 PM
    Author     : Nguyen Anh Tri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${sessionScope.admin eq null}">
    <c:if test="${sessionScope.account eq null}">
        <table width='100%' border='1' cellspacing='0' cellpadding='5'>
            <tr>
                <td>
                    <p>Your are not sign in. Please sign in your account!</p>
                    <p>If you have not an account. Please sign up for an account</p>
                </td>
            </tr>
        </table>
    </c:if>
    <c:if test="${sessionScope.account ne null}">
        <table width='100%' border='1' cellspacing='0' cellpadding='5'>
            <tr>
                <td>
                    <p>For administrator only!</p>
                </td>
            </tr>
        </table>
    </c:if>    
</c:if>

<c:if test="${sessionScope.account ne null}">
    <table width='100%' border='1' cellspacing='0' cellpadding='5'>
        <tr bgcolor='#666666'>
            <td class='bgColorMain'>
                <strong><font color='#FFFFFF'>CUSTOMER ORDER HISTORY</font></strong>
            </td>
        </tr>
        <tr>
            <td>
                <table width='100%' border='1' cellspacing='0' cellpadding='5'>
                    <tr align='center' bgcolor='#999999'>
                        <th width="5%" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">NO.</span></th>
                        <th width="20%" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">CUSTOMER</span></th>
                        <th width="20%" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">DATE</span></th>
                        <th width="15%" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">TOTAL</span></th>
                        <th width="30%" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">STATE</span></th>
                        <th width="10%" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">OPTIONS</span></th>
                    </tr>
                    <c:forEach var="i" begin="0" step="1" end="${requestScope.DSDonDatHang.size()-1}">
                        <tr valign='top'>
                            <td align='center'>
                                ${i+1}
                            </td>
                            <td width='20%' align='center'>
                                <strong>${requestScope.DSDonDatHang[i].khachhang.tenDangNhap}</strong>
                            </td>
                            <td width='20%' align='center'>
                                <strong>${requestScope.DSDonDatHang[i].ngayDatHang}</strong>
                            </td>
                            <td width='20%' align='center'>
                                <strong><fmt:formatNumber value="${requestScope.DSDonDatHang[i].tongTien}" pattern="#,###"/>$</strong>
                            </td>
                            <td width='30%' align='center'>
                                <strong>${requestScope.DSDonDatHang[i].tinhtrangdondathang.tenTinhTrangDonDatHang}</strong>
                            </td>
                            <td width='15%' align='center'>
                                <c:url var="ChiTietDonDatHang" value="XemChiTietDonDatHang.do">
                                    <c:param name="maDonDatHang" value="${requestScope.DSDonDatHang[i].maDonDatHang}"/>
                                </c:url>
                                <a href="${ChiTietDonDatHang}">View Detail</a>
                            </td>
                        </tr> 
                    </c:forEach>
                </table>
            </td>
        </tr>
    </table>
</c:if>

