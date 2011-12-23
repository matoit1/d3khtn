<%-- 
    Document   : SubTimKiemSanPham
    Created on : Dec 22, 2011, 10:14:31 PM
    Author     : VIET
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
Trang
<c:forEach begin="1" end="${soTrang}" var="t">
    <a href="TimKiemSanPham.do?tenSanPham=${tenSanPham}&trang=${t}">${t}</a>
</c:forEach>
<c:forEach items="${requestScope.dsSanPham}" var="sp"  >
    <div class="danhsach"> 
        <div id="hinhanh"><a href="#" ><img alt="#"  src="images/product/${sp.maSanPham}_1.jpg" height="100" width="100" align="middle"/></a></div>
        <div id="chitiet">
            <p><a href="#">${sp.tenSanPham}</a></p>
            <p>webID:${sp.maSanPham}</p>
            <p>Customer Rating: <img alt="#" src="images/rating_on.png"/><img alt="#" src="images/rating_on.png"/></p>
            <p><img alt="#" src="images/available.png"/></p>
        </div>
        <div id="gia"><p>${sp.giaGoc}</p></div> 
    </div>
</c:forEach>
