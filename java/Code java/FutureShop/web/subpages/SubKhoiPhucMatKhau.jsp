<%-- 
    Document   : SubKhoiPhucMatKhau
    Created on : Dec 20, 2011, 1:44:18 AM
    Author     : Nguyen Anh Tri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="info">
    <c:url var="KhoiPhucMatKhau" value="KhoiPhucMatKhau.do"/>
    <form action="${KhoiPhucMatKhau}" method="post" name="frm_KhoiPhucMatKhau" onsubmit="return ResetPassword();">
        <h3>
            RESET PASSWORD
        </h3>
        <p> Please give us your information, then we will send back you new password.</p>
        <p> If you don't, please create a new one.</p>
        <c:if test="${requestScope.error ne null}">
            <p>${requestScope.error}</p>
        </c:if>
        <c:if test="${requestScope.message ne null}">
            <p>${requestScope.message}</p>
        </c:if>
        <fieldset>
            <table>
                <tbody> 
                    <tr>
                        <td class="label">* Your ID</td>
                        <td class="value"><input type="text" name="id" id="id" /></td>
                        <td class="warning" id="invalid_id"></td>
                    </tr>
                    <tr>
                        <td class="label">* Your Email Address</td>
                        <td class="value"><input type="text" name="email" id="email"/></td>
                        <td class="warning" id="invalid_email"></td>
                    </tr>
                </tbody>
            </table>
        </fieldset>
        <p style="text-align: center;">
            <input class="btn" type="submit" name="reset" value="Reset Password"/>
            <input class="btn" type="button" value="Cancel" onclick="GoProfile();"/>
        </p> 
        <c:url var="Dangky" value="DangKy.do"/>
        <a href="${Dangky}"><font> Create an account now!</font></a>
    </form>
</div>