<%-- 
    Document   : CapNhatEmail
    Created on : Dec 6, 2011, 1:44:35 PM
    Author     : Nguyen Anh Tri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
    <c:if test="${requestScope.message ne null}">
        <p>${requestScope.message}</p>
    </c:if>
    <c:if test="${requestScope.message eq null}">
        <p>Cập nhật email</p>
    </c:if>
</div>
