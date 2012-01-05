<%-- 
    Document   : SubDangNhap
    Created on : Dec 2, 2011, 1:37:02 AM
    Author     : Nguyen Anh Tri
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div style="width: 100%;height: 25px;border-style: ridge;">
    <a style="color: #000" href="index.do"><u>Home</u></a> / 
    <a style="color: #000"><b>Sign in to my account</b></a>
</div>
<div class="info">
    <c:url var="DangNhap" value="DangNhap.do"/>
    <form action="${DangNhap}" method="post" name="frm_DangNhap" onsubmit="return SigninAccount();">
        <h3>
            SIGN IN
        </h3>
        <p> If you have an account already, please sign in for fast and easy check out.</p>
        <p> If you don't, please create a new one.</p>
        <c:if test="${requestScope.error ne null}">
            <p>${requestScope.error}</p>
        </c:if>
        <fieldset>
            <table>
                <tbody> 
                    <tr>
                        <td class="label">Your ID</td>
                        <td class="value"><input type="text" name="id" id="id" /></td>
                        <td class="warning" id="invalid_id"></td>
                    </tr>
                    <tr>
                        <td class="label">Your Password</td>
                        <td class="value"><input type="password" name="password" id="password"/></td>
                        <td class="warning" id="invalid_pass"></td>
                    </tr>
                </tbody>
            </table>
        </fieldset>
        <p style="text-align: center;">
            <input class="btn" type="submit" name="signin" value="Sign In"/>
            <input class="btn" type="button" value="Cancel" onclick="GoIndex();"/>
        </p> 
        <c:url var="Reset" value="KhoiPhucMatKhau.do"/>
        <a href="${Reset}"><font> Reset password</font></a>
        <br/>
        <c:url var="Dangky" value="DangKy.do"/>
        <a href="${Dangky}"><font> Create an account now!</font></a>
    </form>
</div>


