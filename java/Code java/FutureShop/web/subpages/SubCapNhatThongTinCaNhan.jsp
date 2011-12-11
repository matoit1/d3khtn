<%-- 
    Document   : CapNhatThongTinCaNhan
    Created on : Dec 6, 2011, 1:28:17 PM
    Author     : Nguyen Anh Tri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="info">
    <c:if test="${requestScope.error eq null}">
        <c:url var="CapNhatTaiKhoan" value="CapNhatTaiKhoan.do"/>
        <form action="${CapNhatTaiKhoan}" method="post" name="frm_CapNhatTaiKhoan" onsubmit="return UpdateAccount();">
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
                            <td class="value">
                                <select name="gender" id="gender" style="width:100%"/>
                                <option value="0">Female</option>
                                <option value="1">Male</option>
                                </select>
                            </td>
                            <td class="warning" id="invalid_gender"></td>
                        </tr>
                        <tr>
                            <td class="label">* Mobile Phone</td>
                            <td class="value"><input type="text" name="phone" id="phone" value="${requestScope.account.soDienThoai}"/></td>
                            <td class="warning" id="invalid_phone"></td>
                        </tr>
                        <tr>
                            <td class="label">  Address </td>
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
    <c:if test="${requestScope.error ne null}">
        <p>${requestScope.error}</p>
    </c:if>
</div>