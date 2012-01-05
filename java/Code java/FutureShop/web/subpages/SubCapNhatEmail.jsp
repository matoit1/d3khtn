<%-- 
    Document   : CapNhatEmail
    Created on : Dec 6, 2011, 1:44:35 PM
    Author     : Nguyen Anh Tri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div style="width: 100%;height: 25px;border-style: ridge;">
    <a style="color: #000" href="index.do"><u>Home</u></a> / 
    <a style="color: #000" href="TrangThongTinCaNhan.do"><u>My Account</u></a> / 
    <a style="color: #000"><b>Address book</b></a>
</div>
<div class="info">
    <c:if test="${requestScope.error eq null}">
        <c:url var="CapNhatEmail" value="CapNhatEmail.do"/>
        <form action="${CapNhatEmail}" method="post" name="frm_CapNhatEmail" onsubmit="return ChangeEmail();">
            <h3>
                CHANGE EMAIL ADDRESS
            </h3>   
            <p>* Indicates a required field</p>
            <fieldset>
                <table>
                    <tbody> 
                        <tr>
                            <td class="label">* Current Email Address</td>
                            <td class="value"><input type="text" name="email" id="email" readonly="readonly" value="${sessionScope.account.email}"/></td>
                            <td class="warning" id="invalid_email"></td>
                        </tr>
                        <tr>
                            <td class="label">* Current Password </td>
                            <td class="value"><input type="password" name="password" id="password"/></td>
                            <td class="warning" id="invalid_pass"></td>
                        </tr>
                        <tr>
                            <td class="label">* Enter New Email Address </td>
                            <td class="value"><input type="text" name="newemail" id="newemail"/></td>
                            <td class="warning" id="invalid_newemail"></td>
                        </tr>
                        <tr>
                            <td class="label">* Retype New Email Address </td>
                            <td class="value"><input type="text" name="newemail2" id="newemail2"/></td>
                            <td class="warning" id="invalid_newemail2"></td>
                        </tr>
                    </tbody>
                </table>
            </fieldset>
            <c:if test="${requestScope.message ne null}">
                <p>${requestScope.message}</p>
            </c:if>
            <p style="text-align: center;">
                <input class="btn" type="submit" name="Update" value="Save"/>
                <input class="btn" type="button" value="Cancel" onclick="GoProfile();"/>
            </p>                    
        </form>
    </c:if>
    <c:if test="${requestScope.error ne null}">
        <p>${requestScope.error}</p>
    </c:if>
</div>