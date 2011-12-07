<%-- 
    Document   : SubCapNhatMatKhau
    Created on : Dec 6, 2011, 1:43:51 PM
    Author     : Nguyen Anh Tri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
    <c:if test="${requestScope.error eq null}">
        <c:url var="CapNhatMatKhau" value="CapNhatMatKhau.do"/>
        <form action="${CapNhatMatKhau}" method="post" name="frm_CapNhatMatKhau" onsubmit="return ChangePassword();">
            <h3>
                CHANGE PASSWORD
            </h3>   
            <p>* Indicates a required field</p>
            <fieldset>
                <table>
                    <tbody> 
                        <tr>
                            <td class="label">* Current Password </td>
                            <td class="value"><input type="password" name="password" id="password"/></td>
                            <td class="warning" id="invalid_pass"></td>
                        </tr>
                        <tr>
                            <td class="label">* Enter New Password </td>
                            <td class="value"><input type="password" name="newpass" id="newpass"/></td>
                            <td class="warning" id="invalid_newpass"></td>
                        </tr>
                        <tr>
                            <td class="label">* Retype New Password </td>
                            <td class="value"><input type="password" name="newpass2" id="newpass2"/></td>
                            <td class="warning" id="invalid_newpass2"></td>
                        </tr>
                    </tbody>
                </table>
            </fieldset>
            <c:if test="${requestScope.message ne null}">
                <p>${requestScope.message}</p>
            </c:if>
            <p style="text-align: center;">
                <input class="btn" type="submit" name="Update" value="Save"/>
                <input class="btn" type="button" value="Cancel"  />
            </p>                    
        </form>
    </c:if>
    <c:if test="${requestScope.error ne null}">
        <p>${requestScope.error}</p>
    </c:if>
</div>
