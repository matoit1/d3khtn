<%-- 
    Document   : CapNhatThongTinCaNhan
    Created on : Dec 6, 2011, 1:28:17 PM
    Author     : Nguyen Anh Tri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="width: 100%;height: 25px;border-style: ridge;">
    <a style="color: #000" href="index.do"><u>Home</u></a> / 
    <a style="color: #000" href="TrangThongTinCaNhan.do"><u>My Account</u></a> / 
    <a style="color: #000"><b>Account Profile</b></a>
</div>
<div class="info">
    <c:if test="${requestScope.error eq null}">
        <c:url var="CapNhatThongTinCaNhan" value="CapNhatThongTinCaNhan.do"/>
        <form action="${CapNhatThongTinCaNhan}" method="post" name="frm_CapNhatTaiKhoan" onsubmit="return UpdateAccount();">
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
                            <td class="value"><input type="text" name="fullname" id="fullname" value="${sessionScope.account.hoTen}"/></td>
                            <td class="warning" id="invalid_name"></td>
                        </tr>
                        <tr>
                            <td class="label">* Day Of Birth </td>
                            <td class="value">
                                <input type="text" name="dayofbirth" id="dayofbirth" value="${sessionScope.account.ngaySinh}"/>
                                (mm/dd/yyyy)
                            </td>
                            <td class="warning" id="invalid_dayofbirth"></td>
                        </tr>
                        <tr>
                            <td class="label">* Gender </td>
                            <td class="value">
                                <select style="width:100%" name="gender" id="gender">
                                <c:if test="${sessionScope.account.gioiTinh eq true}">
                        <option value="0">Female</option>
                        <option value="1">Male</option>
                    </c:if>
                    <c:if test="${sessionScope.account.gioiTinh ne true}">
                        <option value="1">Male</option>
                        <option value="0">Female</option>
                    </c:if>
                    </select>
                    </td>
                    <td class="warning" id="invalid_gender"></td>
                    </tr>
                    <tr>
                        <td class="label">* Mobile Phone</td>
                        <td class="value"><input type="text" name="phone" id="phone" value="${sessionScope.account.soDienThoai}"/></td>
                        <td class="warning" id="invalid_phone"></td>
                    </tr>
                    <tr>
                        <td class="label">* Address </td>
                        <td class="value"><input type="text" name="address" id="address" value="${sessionScope.account.diaChi}"/></td>
                        <td class="warning" id="invalid_address"></td>
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