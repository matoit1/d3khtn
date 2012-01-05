<%-- 
    Document   : SubDangKy
    Created on : Nov 28, 2011, 2:02:56 PM
    Author     : TRANTRI
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="net.tanesha.recaptcha.ReCaptchaFactory"%>
<%@page import="net.tanesha.recaptcha.ReCaptcha"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div style="width: 100%;height: 25px;border-style: ridge;">
    <a style="color: #000" href="index.do"><u>Home</u></a> / 
    <a style="color: #000"><b>Create an account</b></a>
</div>
<div class="info">
    <c:url var="DangKy" value="DangKy.do"/>
    <form action="${DangKy}" method="post" name="frm_DangKy" onsubmit="return RegisterAccount();">
        <h3>
            CREATE AN ACCOUNT
        </h3>   
        <p>* Indicates a required field</p>
        <c:if test="${requestScope.message ne null}">
            <p>${requestScope.message}</p>
        </c:if>
        <fieldset>
            <legend>Account Information</legend>
            <table>
                <tbody> 
                    <tr>
                        <td class="label">* Your ID</td>
                        <td class="value"><input type="text" name="id" id="id" value="${requestScope.account.tenDangNhap}"/></td>
                        <td class="warning" id="invalid_id"></td>
                    </tr>
                    <tr>
                        <td class="label">* Password</td>
                        <td class="value"><input type="password" name="password" id="password"/></td>
                        <td class="warning" id="invalid_pass"></td>
                    </tr>
                    <tr>
                        <td class="label">* Retype Password</td>
                        <td class="value"><input type="password" name="password2" id="password2"/></td>
                        <td class="warning" id="invalid_pass2"></td>
                    </tr>
                </tbody>
            </table>
        </fieldset>
        <fieldset>
            <legend>Personal Information</legend>
            <table>
                <tbody>
                    <tr>
                        <td class="label">* Full Name</td>
                        <td class="value"><input type="text" name="fullname" id="fullname" value="${requestScope.account.hoTen}"/></td>
                        <td class="warning" id="invalid_name"></td>
                    </tr>
                    <tr>
                        <td class="label">* Email Address</td>
                        <td class="value"><input type="text" name="email" id="email" value="${requestScope.account.email}"></td>
                        <td class="warning" id="invalid_email"></td>
                    </tr>
                    <tr>
                        <td class="label">* Retype Email Address</td>
                        <td class="value"><input type="text" name="email2" id="email2"></td>
                        <td class="warning" id="invalid_email2"></td>
                    </tr>
                    <tr>
                        <td class="label">* Mobile Phone</td>
                        <td class="value"><input type="text" name="phone" id="phone" value="${requestScope.account.soDienThoai}"/></td>
                        <td class="warning" id="invalid_phone"></td>
                    </tr>
                    <tr>
                        <td class="value" colspan="2">
                            <%
                                ReCaptcha c = ReCaptchaFactory.newReCaptcha("6LcnlsgSAAAAAMXdgM7gmpR8CAh9RLOxbMGCXRyg", "6LcnlsgSAAAAADTPvlmDbKgAIb7i9DoQT6iv5uGd", false);
                                out.print(c.createRecaptchaHtml(null, null));
                            %>
                            <br />
                            <span id="invalid_captcha" style="color:red;"></span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </fieldset>
        <p style="text-align: center;">
            <input class="btn" type="submit" name="Register" value="Register"/>
            <input class="btn" type="button" value="Cancel" onclick="GoIndex();"/>
        </p>                    
    </form>
</div>

