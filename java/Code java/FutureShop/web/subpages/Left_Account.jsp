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
            <c:url var="XemHoaDon" value="XemDonDatHang.do"/>
            <li><a href="${XemHoaDon}">Order History</a></li>
            <c:url var="XemSanPhamMongDoi" value="XemSanPhamMongDoi.do"/>
            <li><a href="${XemSanPhamMongDoi}">Wish List</a></li>
            <c:url var="XuatExcell" value="XuatExcell.do"/>
            <li><a href="${XuatExcell}">Price Watch</a></li>
        </ul>
        <p><strong>Account Details</strong></p>
        <ul>
            <c:url var="CapNhatThongTinCaNhan" value="CapNhatThongTinCaNhan.do"/>
            <li><a href="${CapNhatThongTinCaNhan}" title="Update account information">Account Profile</a></li>
            <c:url var="CapNhatMatKhau" value="CapNhatMatKhau.do"/>
            <li><a href="${CapNhatMatKhau}" title="Change your password">Change Password</a></li>
            <c:url var="CapNhatEmail" value="CapNhatEmail.do"/>
            <li><a href="${CapNhatEmail}" title="Change your email address">Change Email Address</a></li>
        </ul>
    </div>
</div>
