<%-- 
    Document   : Left_Admin
    Created on : Dec 12, 2011, 11:22:03 PM
    Author     : TRANTRI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<div id="left">
    <div id="categories">
        <h2>Welcome Admin</h2>
        <p><strong>Product Manager</strong></p>
        <ul>
            <c:url var="AdminThemSanPham" value="AdminThemSanPham.do"/>
            <li><a href="${AdminThemSanPham}">Add New Product</a></li>
            <c:url var="AdminQuanLySanPham" value="AdminQuanLySanPham.do"/>
            <li><a href="${AdminQuanLySanPham}">Edit Product</a></li>
            <c:url var="AdminQuanLySanPham" value="AdminQuanLySanPham.do"/>
            <li><a href="${AdminQuanLySanPham}">Delete Product</a></li>
            <c:url var="AdminThemHangSanXuat" value="AdminThemHangSanXuat.do"/>
            <li><a href="${AdminThemHangSanXuat}">Add New Store</a></li>
            <c:url var="AdminTimKiemSanPham" value="AdminTimKiemSanPham.do"/>
            <li><a href="${AdminTimKiemSanPham}">Find Products</a></li>
        </ul>
        <p><strong>Account Manager</strong></p>
        <ul>
            <c:url var="CapNhatMatKhau" value="CapNhatMatKhau.do"/>
            <li><a href="${CapNhatMatKhau}">Chang Password Admin</a></li>
            <li><a href="">Block Account Member</a></li>
        </ul>
    </div>
</div>