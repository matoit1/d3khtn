<%-- 
    Document   : SubAdminThemHangSanXuat
    Created on : Dec 19, 2011, 11:51:27 PM
    Author     : TRANTRI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1 align="center" style="color: #FFB400; background-color:#A67500">Add New Store</h1>
<form action="AdminThemHangSanXuat.do" name="AddNewStore" method="post">
    <table width="100%" border="0">
        <tr>
            <td width="32%"><div align="right" >List Stores:</div></td>
            <td width="68%">
                <c:forEach var="hang" items="${dsHang}">
                    <div align="center">
                        ${hang.tenHangSanXuat}
                    </div>
                </c:forEach>
            </td>
        </tr>
        <tr>
            <td width="32%"><div align="right">New Store Name:</div></td>
            <td width="68%"><input type="text" name="txtName" value="" style="width: 400px" /></td>
        </tr>
        <tr>
            <td width="32%"><div align="right">Specically Store:</div></td>
            <td width="68%">
                <select name="cbb" >               
                    <option value="yes">Yes</option> 
                    <option value="no">No</option> 
                </select>
            </td>
        </tr>
        <tr>
            <td><div align="right"></div></td>
            <td><input type="submit" name="btSubmit" value="Add New Store"></td>
        </tr>
    </table>
</form>