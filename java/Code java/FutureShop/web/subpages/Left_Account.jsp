<%-- 
    Document   : Left_Account
    Created on : Dec 6, 2011, 1:12:50 PM
    Author     : Nguyen Anh Tri
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div id="left">
    <div id="categories">
        <h2>My Account Home</h2>
        <p><strong>Shopping</strong></p>
        <ul>
            <li><a href="#">Order History</a></li>
            <li><a href="#">Wish List</a></li>
            <li><a href="#">Price Watch</a></li>
        </ul>
        <p><strong>Account Details</strong></p>
        <ul>
            <c:url var="CapNhatThongTinCaNhan" value="CapNhatThongTinCaNhan.do"/>
            <li><a href="${CapNhatThongTinCaNhan}">Account Profile</a></li>
            <c:url var="CapNhatMatKhau" value="CapNhatMatKhau.do"/>
            <li><a href="${CapNhatMatKhau}">Change Password</a></li>
            <c:url var="CapNhatEmail" value="CapNhatEmail.do"/>
            <li><a href="${CapNhatEmail}">Change Email Address</a></li>
        </ul>
    </div>
</div>
