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
                <c:forEach begin="0" items="${requestScope.DSLoaiSanPham}" var="lsp">
                    <li><a href="#">${lsp.tenLoaiSanPham}</a></li>
                </c:forEach>
                <c:forEach var="lsp" items="${dsLoaiSanPham}">
                    <li><a href="#">${lsp.getTenLoaiSanPham()}</a></li>
                </c:forEach>
            </ul>
        </div>
        <!-- end #left -->
    </div>
</c:catch>
<c:if test="${ex ne null}">
    ${ex.message}
</c:if>