<%-- 
    Document   : SubTrangThongTinCaNhan
    Created on : Dec 5, 2011, 11:19:08 PM
    Author     : Nguyen Anh Tri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="width: 100%;height: 25px;border-style: ridge;">
    <a style="color: #000" href="index.do"><u>Home</u></a> / 
    <a style="color: #000"><b>My Account</b></a>
</div>
<div>
    <c:if test="${requestScope.error ne null}">
        <p>${requestScope.error}</p>
    </c:if>
    <c:if test="${requestScope.error eq null}">
        <p>Welcome to your account! Manage your information and enjoy faster checkout by saving your billing, shipping and credit card information to your account. Get offers by Email when you sign up for our newsletter in your account profile. Simply click the links below</p>
    </c:if>
</div>