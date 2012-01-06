<%-- 
    Document   : SubAdminTimKiemSanPham
    Created on : Jan 6, 2012, 11:27:00 AM
    Author     : VIET
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 align="center" style="color: #FFB400; background-color:#A67500">Products Manager</h1>  

<div id="WrapperLookup">
    <form name="formTimKiem" method="get" action="AdminTimKiemSanPham.do">
        <h2>Find Products</h2>
        <label>Product'name</label> 
        <input type="text" id="tenSanPham" name="tenSanPham" value="${param.tenSanPham}"/>
        <br/>
        <label>Manufacturer</label> 
        <select name="maHangSanXuat">
            <c:forEach items="${dsHangSanXuat}" var="hsx">
                <option value="${hsx.maHangSanXuat}">${hsx.tenHangSanXuat}</option>
            </c:forEach>
        </select>
        <label>Categories</label> 
        <select name="maLoaiSanPham">
            <c:forEach items="${dsLoaiSanPham}" var="lsp">
                <option value="${lsp.maLoaiSanPham}">${lsp.tenLoaiSanPham}</option>
            </c:forEach>
        </select>
        <br/>
        <!--<input  type="button" name="btnTim" value="Find" onclick="KiemTraTimKiemNangCao()"/>--> 
        <input type="image" src="images/binoculars.jpg" alt="find" height="80" width="80" style="margin: 10px"/>
    </form>
</div>
<div align="right">           
    Page ${page}
    <br/>
    <c:if test="${page-1 gt 0}">
        <c:url var="AdminQuanLySanPham1" value="AdminTimKiemSanPham.do">
            <c:param name="page" value="${page-1}"/>
            <c:param name="maHangSanXuat" value="${maHangSanXuat}"/>
            <c:param name="maLoaiSanPham" value="${maLoaiSanPham}"/>
            <c:param name="tenSanPham" value="${tenSanPham}"/>
        </c:url>
        <a href="${AdminQuanLySanPham1}"> Previous </a>
    </c:if>
    <c:forEach var="i" begin="1"  end="${soTrang-1}">
        <c:url var="AdminQuanLySanPham2" value="AdminTimKiemSanPham.do">
            <c:param name="page" value="${i}"/>
            <c:param name="maHangSanXuat" value="${maHangSanXuat}"/>
            <c:param name="maLoaiSanPham" value="${maLoaiSanPham}"/>
            <c:param name="tenSanPham" value="${tenSanPham}"/>
        </c:url>
        <a href="${AdminQuanLySanPham2}">${i}</a> |
    </c:forEach>
    <c:url var="AdminQuanLySanPham3" value="AdminTimKiemSanPham.do">
        <c:param name="page" value="${soTrang}"/>
        <c:param name="maHangSanXuat" value="${maHangSanXuat}"/>
        <c:param name="maLoaiSanPham" value="${maLoaiSanPham}"/>
        <c:param name="tenSanPham" value="${tenSanPham}"/>
    </c:url>
    <a href="${AdminQuanLySanPham3}">${soTrang}</a> 

    <c:if test="${page+1 le soTrang}">
        <c:url var="AdminQuanLySanPham4" value="AdminTimKiemSanPham.do">
            <c:param name="page" value="${page+1}"/>
            <c:param name="maHangSanXuat" value="${maHangSanXuat}"/>
            <c:param name="maLoaiSanPham" value="${maLoaiSanPham}"/>
            <c:param name="tenSanPham" value="${tenSanPham}"/>
        </c:url>
        <a href="${AdminQuanLySanPham4}"> Next</a>
    </c:if>
</div>

<table width="100%" border="1" cellspacing="0" cellpadding="5">
    <tr style="color:#006600; background-color:#FFCC33">
        <th width="8%" scope="col">Product Key</th>
        <th width="38%" scope="col">Product Name</th>
        <th width="14%" scope="col">Image</th>
        <th width="18%" scope="col">Department</th>
        <th width="18%" scope="col">Stores</th>
        <th width="11%" scope="col">Edit</th>
        <th width="11%" scope="col"><p>Delete (Restore)</p>
</th>
</tr>
<c:forEach  var="sp" items="${dsSP}">
    <tr>
        <td><div align="center">${sp.maSanPham}</div></td>
        <td>
            <span style="font-weight: bold; color:#993300">
                <c:url var="ChiTietSanPham" value="ChiTietSanPham.do">
                    <c:param name="maSp" value="${sp.maSanPham}"/>
                </c:url>
                <a href="${ChiTietSanPham}">${sp.tenSanPham}</a>
            </span>
        </td>
        <td><img src="images/product/${sp.maSanPham}_1.jpg" height="100" width="100"></td>
        <td>${sp.getTenLoaiSanPham()}</td>
        <td>${sp.getTenHangSX()}</td>
        <td>
            <div align="center">
                <c:url var="AdminCapNhapSanPham" value="AdminCapNhapSanPham.do">
                    <c:param name="maSp" value="${sp.maSanPham}"/>
                </c:url>
                <a href="${AdminCapNhapSanPham}" ><img src="images/button_edit_grey.gif"/></a>
            </div>
        </td>
        <c:if test="${sp.getMaTinhTrang() eq 1}">
            <td>
                <div align="center">
                    <c:url var="XoaSanPham" value="XoaSanPham.do">
                        <c:param name="maSp" value="${sp.maSanPham}"/>
                        <c:param name="page" value="${page}"/>
                    </c:url>
                    <a href="${XoaSanPham}" ><img src="images/delete.jpg" height="20" width="20"/></a>
                </div>
            </td>
        </c:if>
        <c:if test="${sp.getMaTinhTrang() ne 1}">
            <td>
                <div align="center">
                    <c:url var="KhoiPhucSanPham" value="KhoiPhucSanPham.do">
                        <c:param name="maSp" value="${sp.maSanPham}"/>
                        <c:param name="page" value="${page}"/>
                    </c:url>
                    <a href="${KhoiPhucSanPham}" ><img src="images/restore.jpg" height="20" width="20"/></a>
                </div>
            </td>
        </c:if>
    </tr>
</c:forEach>
</table>
<br/>
<br/>