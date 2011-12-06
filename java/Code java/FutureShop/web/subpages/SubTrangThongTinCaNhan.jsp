<%-- 
    Document   : SubTrangThongTinCaNhan
    Created on : Dec 5, 2011, 11:19:08 PM
    Author     : Nguyen Anh Tri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div>
    <c:if test="${requestScope.message ne null}">
        <p>${requestScope.message}</p>
    </c:if>
    <c:if test="${requestScope.message eq null}">
        <p>Welcome to your account! Manage your information and enjoy faster checkout by saving your billing, shipping and credit card information to your account. Get offers by Email when you sign up for our newsletter in your account profile. Simply click the links below</p>
    </c:if>
</div>