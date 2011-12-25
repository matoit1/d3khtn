<%-- 
    Document   : Left
    Created on : Nov 21, 2011, 11:19:45 AM
    Author     : VIET
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<c:catch var="ex">
    <div id="left">
        <div id="categories">
            <h2>Categories</h2>
            <ul>
                <c:forEach var="lsp" items="${dsLoaiSanPham}">
                    <c:url var="DanhSachSanPham" value="DanhSachSanPham.do">
                        <c:param name="maLoaiSanPham" value="${lsp.maLoaiSanPham}"/>
                        <c:param name="trang" value="1"/>
                    </c:url>
                    <li><a href="${DanhSachSanPham}">${lsp.getTenLoaiSanPham()}</a></li>
                </c:forEach>
            </ul>
            <h2>Manufacturer</h2>
            <ul>
                <c:forEach var="hsx" items="${listSpecialStores}">
                    <c:url var="DanhSachSanPham" value="DanhSachSanPham.do">
                        <c:param name="maHangSanXuat" value="${hsx.maHangSanXuat}"/>
                        <c:param name="trang" value="1"/>
                    </c:url>
                    <li><a href="${DanhSachSanPham}">${hsx.tenHangSanXuat}</a></li>
                </c:forEach>
            </ul>
        </div>
        <!-- end #left -->
    </div>
</c:catch>
<c:if test="${ex ne null}">
    ${ex.message}
</c:if>