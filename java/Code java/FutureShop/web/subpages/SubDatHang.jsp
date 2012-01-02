<%-- 
    Document   : SubDatHang
    Created on : Jan 1, 2012, 12:29:43 AM
    Author     : Nguyen Anh Tri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import= "net.tanesha.recaptcha.ReCaptcha" %>
<%@page import= "net.tanesha.recaptcha.ReCaptchaFactory" %>
<%@page import= "net.tanesha.recaptcha.ReCaptchaResponse" %>
<%@page import= "net.tanesha.recaptcha.ReCaptchaImpl" %>

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
    <div class="info">
        <c:url var="DatHang" value="DatHang.do"/>
        <form action="${DatHang}" method="post" name="frm_DatHang" onsubmit="return OrderCheck();">
            <h3>
                CREATE AN ORDER
            </h3>   
            <c:if test="${requestScope.error ne null}">
                <p>${requestScope.error}</p>
            </c:if>
            <c:if test="${requestScope.message ne null}">
                <p>${requestScope.message}</p>
            </c:if>
            <fieldset>
                <legend>Personal Information</legend>
                <table>
                    <tbody> 
                        <tr>
                            <td class="label">Customer Name</td>
                            <td class="value"><input type="text" name="name" id="name" value="${sessionScope.account.hoTen}" readonly="readonly"/></td>
                            <td class="warning" id="invalid_name"></td>
                        </tr>
                        <tr>
                            <td class="label">Mobile Phone</td>
                            <td class="value"><input type="text" name="phone" id="phone" value="${sessionScope.account.soDienThoai}" readonly="readonly"/></td>
                            <td class="warning" id="invalid_phone"></td>
                        </tr>
                        <tr>
                            <td class="label">Email Address</td>
                            <td class="value"><input type="text" name="email" id="email" value="${sessionScope.account.email}" readonly="readonly"/></td>
                            <td class="warning" id="invalid_email"></td>
                        </tr>
                    </tbody>
                </table>
            </fieldset>
            <fieldset>
                <legend>Order Information</legend>
                <table>
                    <tbody>
                        <tr>
                            <td class="label">Customer ID</td>
                            <td class="value"><input type="text" name="id" id="id" value="${sessionScope.account.tenDangNhap}" readonly="readonly"/></td>
                            <td class="warning" id="invalid_id"></td>
                        </tr>
                        <tr>
                            <td class="label">Order Day</td>
                            <td class="value">
                                <input type="text" name="orderday" id="orderday" value="${requestScope.orderday}" readonly="readonly"/>
                                (mm/dd/yyyy)
                            </td>
                            <td class="warning" id="invalid_orderday"></td>
                        </tr>
                        <tr>
                            <td class="label">Availability</td>
                            <td class="value">
                                <select style="width: 100%" name="Availability" id="Availability" onchange="AddressShow();">
                                    <option value="0">Pick at store</option>
                                    <option value="1">Ship to home</option>
                                </select>
                            </td>
                        </tr>
                        <tr id="OrderAddress" hidden="true">
                            <td class="label">Address</td>
                            <td class="value">
                                <textarea style="width: 100%" name="address" id="address"></textarea>
                                (Only for "Ship to home")
                            </td>
                        </tr>
                    </tbody>
                </table>
            </fieldset>
            <fieldset>
                <legend>Product Information</legend>
                <table width="600" border="1">
                    <tr>
                        <td bgcolor="#CCCCCC" scope="col" width="40%"><span style="color: #000033">Product Description</span></td>
                        <td bgcolor="#CCCCCC" scope="col" width="10%"><span style="color: #000033">Quantity</span></td>
                        <td bgcolor="#CCCCCC" scope="col" width="15%"><span style="color: #000033">Unit Price</span></td>
                        <td bgcolor="#CCCCCC" scope="col" width="15%"><span style="color: #000033">Discount</span></td>
                        <td bgcolor="#CCCCCC" scope="col" width="20%"><span style="color: #000033">Price</span></td>
                    </tr>
                    <c:forEach var="i" step="1" begin="0" end="${sessionScope.GioHang.size()-1}">   
                        <tr>
                            <td width="209"><strong>${sessionScope.GioHang[i].tenSanPham}</strong> </td>
                            <td>${sessionScope.GioHang[i].soLuong}</td>
                            <td>${sessionScope.GioHang[i].giaGoc}$</td>
                            <td>${sessionScope.GioHang[i].giamGia}$</td>
                            <td><fmt:formatNumber value="${(sessionScope.GioHang[i].giaGoc - sessionScope.GioHang[i].giamGia) * sessionScope.GioHang[i].soLuong}" pattern="#,###.##"/>$</td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="2" rowspan="2"></td>
                        <td colspan="2" bgcolor="#999999">
                            <dl>
                                <dt> Product Total</dt>
                        </td>        
                        <td bgcolor="#999999">${sessionScope.subTotal}$</td>
                    </tr>
                </table>                       
            </fieldset>
            <fieldset>
                <legend>Security Information</legend>
                <table style="width: 600px">
                    <tr>
                        <td class="value" colspan="1" style="margin-right: 20px;width: 600px">
                            <%
                                ReCaptcha c = ReCaptchaFactory.newReCaptcha("6LcnlsgSAAAAAMXdgM7gmpR8CAh9RLOxbMGCXRyg", "6LcnlsgSAAAAADTPvlmDbKgAIb7i9DoQT6iv5uGd", false);
                                out.print(c.createRecaptchaHtml(null, null));
                            %>
                            <br/>
                            <span id="invalid_captcha" style="color:red;"></span>
                        </td>
                    </tr>
                </table>
            </fieldset>
            <p style="text-align: center;">
                <input class="btn" type="button" value="Back to cart" onclick="BackToCart();" />
                <input class="btn" type="submit" name="Purchase" value="Purchase"/>
                <input class="btn" type="button" value="Cancel" onclick="GoIndex();" />
            </p>                    
        </form>
    </div>
</c:if>