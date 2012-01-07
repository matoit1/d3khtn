<%-- 
    Document   : MainIndex
    Created on : Nov 22, 2011, 2:51:29 PM
    Author     : VIET
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<c:catch var="ex">
    <br class="clearfloat"/>
    <div id="slite"><div id="container">
            <div id="lofslidecontent45" class="lof-slidecontent">
                <div class="preload"><div></div></div>
                <!-- MAIN CONTENT -->
                <div class="lof-main-outer">
                    <ul class="lof-main-wapper">
                        <li>
                            <a href="ChiTietSanPham.do?maSp=9"><img src="images/banner/homepage-slide-ho_en.jpg" title="Newsflash 2" height="300"/></a>
                            <div class="lof-main-item-desc"> </div>
                        </li>
                        <li>
                            <a href="ChiTietSanPham.do?maSp=17"><img src="images/banner/p-homepage-slide-tv_en.jpg" title="Newsflash 3" height="300" width="600"/></a>
                            <div class="lof-main-item-desc"> </div>
                        </li>
                        <li>
                            <a href="ChiTietSanPham.do?maSp=23"><img src="images/banner/p-homepage-slide-di_en.jpg" title="Newsflash 5" height="300" width="600"/></a>
                            <div class="lof-main-item-desc"></div>
                        </li>
                        <li>
                            <a href="ChiTietSanPham.do?maSp=31"><img src="images/banner/p-homepage-slide-major-app_en.jpg"  title="Newsflash 5" height="300" width="600"/></a>
                            <div class="lof-main-item-desc"></div>
                        </li>
                    </ul>
                </div>
                <div class="lof-navigator-outer">
                    <ul class="lof-navigator">
                        <li>
                            <div>
                                <a href="ChiTietSanPham.do?maSp=9"><img src="images/banner/homepage-slide--thumb-ho.png" /></a>
                                <h3>Wrap up the perfect laptop. </h3>
                            </div>
                        </li>
                        <li>
                            <div>
                                <a href="ChiTietSanPham.do?maSp=17"><img src="images/banner/homepage-slide--thumb-tv.png" /></a>
                                <h3> Get the best holiday deals on TVs. </h3>
                            </div>
                        </li>
                        <li>
                            <div>
                                <a href="ChiTietSanPham.do?maSp=23"><img src="images/banner/homepage-slide--thumb-camera.png" /></a>
                                <h3> Gifts they want, prices you'll love.</h3>
                            </div>
                        </li>
                        <li>
                            <div>
                                <a href="ChiTietSanPham.do?maSp=31"><img src="images/banner/homepage-slide--thumb-major-app.png" /></a>
                                <h3> We pay the tax on all major appliances!</h3>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div></div>
    <br class="clearfloat"/>
    <h1 align="center" style="color: #FFB400; background-color:#A67500">Featured Promotions</h1>  
    <div id="black-bl">
        <c:forEach begin="0" var="sp" items="${requestScope.dsSanPham}">
            <div class="black-box">
                <div style="height: 50px">
                    <h2>
                        <c:url var="ChiTietSanPham" value="ChiTietSanPham.do">
                            <c:param name="maSp" value="${sp.maSanPham}"/>
                        </c:url>
                        <a href="${ChiTietSanPham}" style="font-size: 14px; font-weight: bold">${sp.tenSanPham}</a>
                    </h2>
                </div>
                <p><img src="images/product/${sp.maSanPham}_1.jpg" width="160" height="160" alt="Pic 1" /></p>
                <p style="color: #FB4844; font-weight: bold">Price: ${sp.giaGoc}$</p>
                <div style="height: 50px">
                    <p>${sp.moTa}</p>
                </div>
                <a href="${ChiTietSanPham}"><p class="more">&gt; &gt;More</p></a>
            </div>
        </c:forEach>
        <div class="clear"></div>
    </div>
</c:catch>
<c:if test="${ex ne null}">
    ${ex.message}
</c:if>