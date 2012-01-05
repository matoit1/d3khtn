<%-- 
    Document   : Header
    Created on : Nov 21, 2011, 11:16:26 AM
    Author     : VIET
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<c:catch var="ex">
    <div id="header">
        <div id="banner">
            <div id="logo"><a href="index.do"><img src="images/futureshop_logo.png"/></a></div>
            <div id="menu_right">
                <div id="mainmenu">   
                    <c:url var="about" value="About.do"/>
                    <div class="menumainItem"> <a href="${about}" title="noi dung cua menu"> ABOUT </a></div>
                    <div class="menumainItem"> <a href="#" title="noi dung cua menu"> HELP </a></div>
                    <div class="menumainItem"> <a href="TimKiemNangCao.do" title="noi dung cua menu"> SEARCH </a></div>
                    <c:url var="index" value="index.do"/>
                    <div class="menumainItem"> <a href="${index}" title="noi dung cua menu"> HOME </a></div>
                </div>
                <div id="profilemenu">
                    <div class="profilemenuItem"> <a href="#" title="noi dung cua menu">>>Wish List</a></div>
                    <c:url var="XemHoaDon" value="XemDonDatHang.do"/>
                    <div class="profilemenuItem"> <a href="${XemHoaDon}" title="View order history">>>My Orders</a></div>
                    <c:url var="TrangThongTinCaNhan" value="TrangThongTinCaNhan.do"/>
                    <c:url var="AdminQuanLySanPham" value="AdminQuanLySanPham.do"/>
                    <c:if test="${sessionScope.admin eq null}">
                        <div class="profilemenuItem"> <a href="${TrangThongTinCaNhan}" title="Account Infomation">>>My Account</a></div>
                    </c:if>
                    <c:if test="${sessionScope.admin ne null}">
                        <div class="profilemenuItem"> <a href="${AdminQuanLySanPham}" title="Admin Right">>>Administrator</a></div>
                    </c:if>
                </div>
            </div>
        </div>
        <div id="menu">
            <ul id="MenuBar1" class="MenuBarHorizontal">
                <li><a href="">Short by Department</a>
                    <ul>
                        <c:forEach items="${dsNhomsanPham}" var="nsp">
                            <c:url var="DanhSachSanPham" value="DanhSachSanPham.do">
                                <c:param name="maNhomSanPham" value="${nsp.maNhomSanPham}"/>
                                <c:param name="trang" value="1"/>
                            </c:url>
                            <li>
                                <a href="${DanhSachSanPham}">${nsp.tenNhomSanPham}</a>
                            </li>
                        </c:forEach> 
                    </ul>
                </li>
                <li><a href="">Specially Stores</a>
                    <ul>
                        <c:forEach items="${listSpecialStores}" var="hsx">
                            <c:url var="DanhSachSanPham" value="DanhSachSanPham.do">
                                <c:param name="maHangSanXuat" value="${hsx.maHangSanXuat}"/>
                                <c:param name="trang" value="1"/>
                            </c:url>
                            <li><a href="${DanhSachSanPham}">${hsx.tenHangSanXuat}</a></li>
                        </c:forEach> 
                    </ul>
                </li>
            </ul>
            <c:url var="GioHang" value="GioHang.do"/>
            <c:if test="${sessionScope.subTotal ne null}">
                <div id="subtotal"><a href="${GioHang}">SUBTOTAL ${sessionScope.subTotal}$</a></div> 
            </c:if>
            <c:if test="${sessionScope.subTotal eq null}">
                <div id="subtotal"><a href="#">SUBTOTAL</a></div> 
            </c:if>

            <div id="viewcart"><a href="${GioHang}" ><img src="images/view_cart.gif" /></a></div>
            <script type="text/javascript">
                var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});
            </script>
        </div>
        <div id="search">
            <form action="TimKiemSanPham.do" name="search">
                <input type="text" name="txtsearch" style="width: 200px; height: 20px;"/>
                <input type="image" src="images/search_sm_on.gif" name="btSearch" style="width: 100px; height: 20px;margin-top:10px;"/>
                <c:if test="${sessionScope.account eq null}">
                    <div id="account">
                        <c:url var="DangKy" value="DangKy.do"/>
                        <a  href="${DangKy}"> Create an Account </a> |
                        <c:url var="DangNhap" value="DangNhap.do"/>
                        <a  href="${DangNhap}">Sign In</a> 
                    </div> 
                </c:if>
                <c:if test="${sessionScope.account ne null}">
                    <div id="account"> Welcome, 
                        <c:url var="TrangThongTinCaNhan" value="TrangThongTinCaNhan.do"/>
                        <a  href="${TrangThongTinCaNhan}"> ${sessionScope.account.hoTen} </a> |   
                        <c:url var="DangXuat" value="DangXuat.do"/>
                        <a href="${DangXuat}">Sign Out</a> 
                    </div> 
                </c:if>
            </form>
        </div>
    </div>
</c:catch>
<c:if test="${ex ne null}">
    ${ex.message}
</c:if>