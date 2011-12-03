<%-- 
    Document   : MainIndex
    Created on : Nov 22, 2011, 2:51:29 PM
    Author     : VIET
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<c:catch var="ex">
    <!-- InstanceBeginEditable name="NoiDungThayDoi" -->
    <div class="ad_top">
        <div id="slider">
            <ul>
                <li> <img src="images/banner(2).png"/></li>
                <li> <img src="images/BANNER (3).png"/></li>
                <li> <img src="images/banner(4).png"/></li>
            </ul>
        </div>
    </div>
    <br/>
    <h1 align="center" style="color: #FFB400; background-color:#A67500">Featured Promotions</h1>  
    <div id="black-bl">
        <c:forEach begin="0" var="sp" items="${requestScope.dsSanPham}">
            <div class="black-box">
                <h2><a href="ChiTietSanPham.do?maSp=${sp.maSanPham}" style="font-size: 14px; font-weight: bold">${sp.tenSanPham}</a></h2>
                <p><img src="images/product/${sp.maSanPham}_0.jpg" width="160" height="160" alt="Pic 1" /></p>
                <p style="color: #FB4844; font-weight: bold">Price: ${sp.giaGoc}$</p>
                <p>${sp.moTa}</p>
                <a href="ChiTietSanPham.do?maSp=${sp.maSanPham}"><p class="more">&gt; &gt;More</p></a>
            </div>
        </c:forEach>
        <div class="clear"></div>
    </div>
    <!-- InstanceEndEditable -->
    <!-- end #mainContent -->
</c:catch>
<c:if test="${ex ne null}">
    ${ex.message}
</c:if>