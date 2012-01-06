<%-- 
    Document   : SubAdminQuanLyDonDatHang
    Created on : Jan 6, 2012, 1:50:31 PM
    Author     : Nguyen Anh Tri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div style="width: 100%;height: 25px;border-style: ridge;">
    <a style="color: #000" href="index.do"><u>Home</u></a> / 
    <a style="color: #000" href="AdminQuanLySanPham.do"><u>Administrator</u></a> / 
    <a style="color: #000"><b>Customer order</b></a>
</div>

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

<c:if test="${sessionScope.admin ne null}">
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
                        <th width="18%" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">DATE</span></th>
                        <th width="20%" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">A.VA</span></th>
                        <th width="12%" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">TOTAL</span></th>
                        <th width="15%" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">STATE</span></th>
                        <th width="15%" bgcolor="#CCCCCC" scope="col"><span style="color: #000033">OPTIONS</span></th>
                    </tr>
                    <c:forEach var="i" begin="0" step="1" end="${requestScope.DSDonDatHang.size()-1}">
                        <tr valign='top'>
                            <td align='center'>
                                ${i+1}
                            </td>
                            <td width='20%' align='center'>
                                <strong>${requestScope.DSDonDatHang[i].khachhang.tenDangNhap}</strong>
                            </td>
                            <td width='18%' align='center'>
                                <strong>${requestScope.DSDonDatHang[i].ngayDatHang}</strong>
                            </td>
                            <td width='20%' align='center'>
                                <strong>${requestScope.DSDonDatHang[i].hinhThucMuaHang}</strong>
                            </td>
                            <td width='12%' align='center'>
                                <strong><fmt:formatNumber value="${requestScope.DSDonDatHang[i].tongTien}" pattern="#,###"/>$</strong>
                            </td>
                            <td width='15%' align='center'>
                                <c:url var="AdminQuanLyDonDatHang" value="AdminQuanLyDonDatHang.do"/>
                                <form action="${AdminQuanLyDonDatHang}" name="update">
                                <select style="width: 100%" name="state" id="state">
                                    <c:if test="${requestScope.DSDonDatHang[i].tinhtrangdondathang.maTinhTrangDonDatHang eq 1}">
                                        <option value="1">In-progress</option>
                                        <option value="2">Finish</option>
                                    </c:if>
                                    <c:if test="${requestScope.DSDonDatHang[i].tinhtrangdondathang.maTinhTrangDonDatHang eq 2}">
                                        <option value="2">Finish</option>
                                        <option value="1">In-progress</option>
                                    </c:if>
                                </select>
                                <br/>
                                <input type="image" src="images/update_on.gif" name="capNhat" />
                                <input type="hidden" name="TID" value="${requestScope.DSDonDatHang[i].maDonDatHang}"/>
                                </form>
                            </td>
                            <td align='center'>
                                <c:url var="ChiTietDonDatHang" value="AdminChiTietDonDatHang.do">
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

