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
                    <div class="menumainItem"> <a href="#" title="noi dung cua menu"> ABOUT </a></div>
                    <div class="menumainItem"> <a href="#" title="noi dung cua menu"> HELP </a></div>
                    <div class="menumainItem"> <a href="#" title="noi dung cua menu"> SEARCH </a></div>
                    <div class="menumainItem"> <a href="index.do" title="noi dung cua menu"> HOME </a></div>
                </div>
                <div id="profilemenu">
                    <c:url var="TrangThongTinCaNhan" value="TrangThongTinCaNhan.do"/>
                    <div class="profilemenuItem"> <a href="${TrangThongTinCaNhan}" title="noi dung cua menu"> >> My Acount </a></div>
                    <div class="profilemenuItem"> <a href="#" title="noi dung cua menu"> >> My Orders </a></div>
                    <div class="profilemenuItem"> <a href="#" title="noi dung cua menu"> >> Wish List </a></div>
                </div>
            </div>
        </div>

        <div id="menu">
            <ul id="MenuBar1" class="MenuBarHorizontal">

                <li><a href="">Short by Department</a>
                    <ul>
                        <c:forEach begin="0" items="${dsNhomsanPham}" var="nsp">
                            <li><a href="#">${nsp.tenNhomSanPham}</a></li>
                        </c:forEach> 

                    </ul>
                </li>
                <li><a href="">Specially Stores</a>
                    <ul>
                        <c:forEach begin="0" items="${listSpecialStores}" var="hsx">
                            <li><a href="#">${hsx.tenHangSanXuat}</a></li>
                        </c:forEach> 
                    </ul>
                </li>

            </ul>
            <div id="subtotal"> <a href="#">SUBTOTAL </a></div>
            <div id="subtotal"><a href="#" ><img src="images/view_cart.gif" /></a></div>
            <script type="text/javascript">

                var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"SpryAssets/SpryMenuBarDownHover.gif", imgRight:"SpryAssets/SpryMenuBarRightHover.gif"});

            </script>

        </div>
        <div id="search">
            <form action="#" name="search">
                <input type="text" name="txtsearch" style="width: 200px; height: 25px"/>
                <input type="image" src="images/search_sm_on.gif" name="btSearch" style="margin-top:10px;"/>
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
        <!-- end #header -->
    </div>
</c:catch>
<c:if test="${ex ne null}">
    ${ex.message}
</c:if>