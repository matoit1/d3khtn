<%-- 
    Document   : CapNhatThongTinCaNhan
    Created on : Dec 6, 2011, 1:28:17 PM
    Author     : Nguyen Anh Tri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="info">
    <c:if test="${requestScope.message eq null}">
        <form action="#" method="post" name="frm_CapNhatTaiKhoan" onsubmit="return IsValid();">
            <h3>
                UPDATE ACCOUNT INFORMATION
            </h3>   
            <p>* Indicates a required field</p>
            <fieldset>
                <legend>Personal Information</legend>
                <table>
                    <tbody> 
                        <tr>
                            <td class="label">* Full Name</td>
                            <td class="value"><input type="text" name="fullname" id="fullname" value="${requestScope.account.hoTen}"/></td>
                            <td class="warning" id="invalid_name"></td>
                        </tr>
                        <tr>
                            <td class="label"> Day Of Birth </td>
                            <td class="value"><input type="text" name="dayofbirth" id="dayofbirth"/></td>
                            <td class="warning" id="invalid_dayofbirth"></td>
                        </tr>
                        <tr>
                            <td class="label"> Gender </td>
                            <td class="value"><input type="text" name="gender" id="gender"/></td>
                            <td class="warning" id="invalid_gender"></td>
                        </tr>
                        <tr>
                            <td class="label">  Mobile Phone</td>
                            <td class="value"><input type="text" name="phone" id="phone" value="${requestScope.account.soDienThoai}"/></td>
                            <td class="warning" id="invalid_phone"></td>
                        </tr>
                        <tr>
                            <td class="label">* Address </td>
                            <td class="value"><input type="text" name="address" id="address"/></td>
                            <td class="warning" id="invalid_address"></td>
                        </tr>
                    </tbody>
                </table>
            </fieldset>
            <p style="text-align: center;">
                <input class="btn" type="submit" name="Update" value="Save"/>
                <input class="btn" type="button" value="Cancel"  />
            </p>                    
        </form>
    </c:if>
    <c:if test="${requestScope.message ne null}">
        <p>${requestScope.message}</p>
    </c:if>
</div>