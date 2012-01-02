<%-- 
    Document   : SubXemDonDatHang
    Created on : Jan 2, 2012, 5:20:59 PM
    Author     : Nguyen Anh Tri
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



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
    <table width='100%' border='1' cellspacing='0' cellpadding='5'>
        <tr bgcolor='#666666'>
            <td class='bgColorMain'>
                <strong><font color='#FFFFFF'>ORDER HISTORY</font></strong>
            </td>
        </tr>
        <tr>
            <td>
                <table width='100%' border='1' cellspacing='0' cellpadding='5'>
                    <tr align='center' bgcolor='#999999'>
                        <th width="5%" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">NO.</span></th>
                        <th width="20%" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">DATE</span></th>
                        <th width="20%" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">TOTAL</span></th>
                        <th width="25%" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">QUANTITY</span></th>
                        <th colspan="2" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">OPTIONS</span></th>
                    </tr>
                    <c:forEach var="i" begin="0" step="1" end="${requestScope.DonDatHang.size()-1}">
                        <tr valign='top'>
                            <td align='center'>
                                ${i+1}
                            </td>
                            <td width='20%' align='center'>
                                <strong>${requestScope.DonDatHang[i].ngayDatHang}</strong>
                            </td>
                            <td width='20%' align='center'>
                                <strong><fmt:formatNumber value="${requestScope.DonDatHang[i].tongTien}" pattern="#,###"/>$</strong>
                            </td>
                            <td width='30%' align='center'>
                                <strong>${requestScope.DonDatHang[i].tinhtrangdondathang.tenTinhTrangDonDatHang}</strong>
                            </td>
                            <td width='15%' align='center'>
                                <c:url var="ChiTietDonDatHang" value="XemChiTietDonDatHang.do">
                                    <c:param name="maDonDatHang" value="${requestScope.DonDatHang[i].maDonDatHang}"/>
                                </c:url>
                                <a href="${ChiTietDonDatHang}">View Detail</a>
                            </td>
                            <td align='center'>
                                <c:url var="XoaDonDatHang" value="XoaDonDatHang.do">
                                    <c:param name="maDonDatHang" value="${requestScope.DonDatHang[i].maDonDatHang}"/>
                                </c:url>
                                <a href='${XoaDonDatHang}'><img src='images/delete.jpg' height="20" width="20" /></a>
                            </td>
                        </tr> 
                    </c:forEach>
                </table>
            </td>
        </tr>
    </table>
</c:if>