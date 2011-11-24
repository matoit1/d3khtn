<%-- 
    Document   : Header
    Created on : Nov 21, 2011, 11:16:26 AM
    Author     : VIET
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<c:catch var="ex">
    <div id="header">
        <div id="banner">
            <div id="logo"><a href="#"><img src="images/futureshop_logo.png"/></a></div>
            <div id="menu_right">
                <div id="mainmenu">
                    <div class="menumainItem"> <a href="#" title="noi dung cua menu"> ABOUT </a></div>
                    <div class="menumainItem"> <a href="#" title="noi dung cua menu"> HELP </a></div>
                    <div class="menumainItem"> <a href="#" title="noi dung cua menu"> SEARCH </a></div>
                    <div class="menumainItem"> <a href="#" title="noi dung cua menu"> HOME </a></div>
                </div>
                <div id="profilemenu">
                    <div class="profilemenuItem"> <a href="#" title="noi dung cua menu"> >> My Acount </a></div>
                    <div class="profilemenuItem"> <a href="#" title="noi dung cua menu"> >> My Orders </a></div>
                    <div class="profilemenuItem"> <a href="#" title="noi dung cua menu"> >> Wish List </a></div>
                </div>
            </div>
        </div>
        <div id="menu">
            <ul id="jsddm">
                <li class="current_item"><a href="#"> Short by Department </a>
                    <ul>
                        <c:forEach begin="0" items="${dsNhomsanPham}" var="nsp">
                            <li><a href="#">${nsp.tenNhomSanPham}</a></li>
                        </c:forEach> 
                    </ul>
                </li>
                <li class="current_item"><a href="#">Specially Stores</a>
                    <ul>
                        <c:forEach begin="0" items="${listSpecialStores}" var="hsx">
                            <li><a href="#">${hsx.tenHangSanXuat}</a></li>
                        </c:forEach> 
                    </ul>
                </li>
                <div id="subtotal"> <a href="#">SUBTOTAL </a></div>
                <div id="subtotal"><a href="#" ><img src="images/view_cart.gif" /></a></div>
            </ul>
        </div>
        <div id="search">
            <form action="#" name="search">
                <input type="text" name="txtsearch" />
                <input type="image" src="images/search_sm_on.gif" name="btSearch" style="margin-top:10px;"/>
                <div id="account"> Welcome! <a  href="#"> Create an Account </a>|<a  href="#">Sign In</a> </div>
            </form>
        </div>
        <!-- end #header -->
    </div>
</c:catch>
<c:if test="${ex ne null}">
    ${ex.message}
</c:if>