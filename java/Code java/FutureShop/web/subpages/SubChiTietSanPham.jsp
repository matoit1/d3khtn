<%-- 
    Document   : SubChiTietSanPham
    Created on : Nov 30, 2011, 12:02:10 AM
    Author     : TRANTRI
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>

<h1 align="center" style="color: #FFB400; background-color:#A67500">Product Description</h1>
<table width="675" border="1" bordercolor="#C8C8C8" cellspacing='0' cellpadding='5'>
    <tr>
        <td width="242"><h1><span style="color: #009900; font-family: Verdana, Arial, Helvetica, sans-serif">${tenHangSX}</span></h1></td>
        <td width="417"><h3><span>${sp.tenSanPham}</span></h3></td>
    </tr>
    <tr>
        <td><img src="images/product/${sp.maSanPham}_1.jpg" width="250px" height="250px"/>
            <div align="center"><a href="XemAnhChiTiet.do?maSp=${sp.maSanPham}" target="_blank">See more</a> </div></td>
        <td>${sp.moTa}</td>
    </tr>
    <tr>
        <td>
            <div align="left" style="font-weight: bold">
                <span style="font-size: small; color: #FF9900">
                    Customer Rating 
                    <c:forEach begin="1" end="${sp.danhGia}" var="i">
                        <a href="DanhGiaSanPham.do?maSp=${sp.maSanPham}&rate=${i}"> <img src="images/rating_on.png"/></a>
                        </c:forEach>
                        <c:forEach begin="${sp.danhGia+1}" end="${5}" var="i">
                        <a href="DanhGiaSanPham.do?maSp=${sp.maSanPham}&rate=${i}"> <img src="images/rating_off.png"/></a>
                    </c:forEach> 
                            ${sp.danhGia}/5
                </span>
            </div>
        </td>
        <td>

            <div align="center">Quantity Remaining: 
                <c:if test="${sp.soLuong gt 0}">${sp.soLuong} 
                </c:if>
                <c:if test="${sp.soLuong lt 1}"> end product
                </c:if>
            </div>

        </td>

    </tr>
    <tr>
        <td>
            <div align="center"><span style="font-weight: bold; color:#FF9900; font-size: small">Save: ${sp.giamGia}$ </span></div>
            <br/>
            <div align="center"><span style="font-weight: bold; color: #FF0000; font-size: medium">Price: ${sp.giaGoc}$ </span></div>
        </td>
        <td>
            <div align="center">
                <c:if test="${sessionScope.admin ne null}">
                    <c:url var="AdminCapNhapSanPham" value="AdminCapNhapSanPham.do">
                        <c:param name="maSp" value="${sp.maSanPham}"/>
                    </c:url>
                    <a href="${AdminCapNhapSanPham}"><img src="images/button_edit_grey.gif"/></a>
                        <c:url var="XoaSanPham" value="XoaSanPham.do">
                            <c:param name="maSp" value="${sp.maSanPham}"/>
                        </c:url>
                    <a href="${XoaSanPham}"><img src="images/delete.jpg" height="20" width="20"/></a>
                    </c:if>
                    <c:if test="${sessionScope.admin eq null}">
                        <c:url var="DatMua" value="GioHang.do">
                            <c:param name="action" value="DatMua"/>
                            <c:param name="maSanPham" value="${sp.maSanPham}"/>
                        </c:url>
                        <c:if test="${sp.soLuong gt 0}">
                        <a href="${DatMua}"><img src="images/buy_now_big_on.gif"/></a>
                        </c:if>
                    <br/>
                    <c:url var="ThemSanPhamMongDoi" value="ThemSanPhamMongDoi.do">
                        <c:param name="maSanPham" value="${sp.maSanPham}"/>
                    </c:url>
                    <a href="${ThemSanPhamMongDoi}"><u>Add to wish list</u></a>
                    </c:if>
            </div>
        </td>
    </tr>
</table>
<p>&nbsp;</p>
<table width="674" border="1" cellspacing='0' cellpadding='5'>
    <tr>
        <td width="664" scope="col">
            <div align="left">
                <span style="color: #CC0000">Features &amp; Specs </span>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            ${sp.thongTinChiTiet}
        </td>
    </tr>
</table>
<p><br/>
</p>
<table width="674" border="1">
    <tr>
        <td width="664" bgcolor="#333333" scope="col"><div align="left"><span style="color: #FFCC00">Comments</span></div></td>
    </tr>
    <c:if test="${dsBL.size() == 0}">
        <tr>
            <td> No comment </td>
        </tr>
    </c:if>
    <c:forEach  var="bl" items="${dsBL}">
        <tr>
            <td><strong>${bl.LayTenKhachTheoMa()} (${bl.getThoiGian()}) said: </strong>${bl.noiDung}</td>
        </tr>
    </c:forEach>
</table>
<br/>
<c:if test="${sessionScope.account eq null}">
    Please <a href="DangNhap.do" target="_bank">Login</a> to comment for this product.
    <br/>
    <br/>
</c:if>
<c:if test="${sessionScope.account ne null}">    
    <script type="text/javascript" src="fckeditor/fckeditor.js"></script>
    <script type="text/javascript">
        window.onload = function()
        {
            var oFCKeditor = new FCKeditor( 'binhLuan' ) ;
            oFCKeditor.BasePath="fckeditor/";
            oFCKeditor.Height= 400;
            oFCKeditor.ReplaceTextarea() ;
        }
    </script>
    <table width='100%' border='1' cellspacing='0' cellpadding='5'>
        <tr bgcolor='#666666'>
            <td class='bgColorMain'><strong><font color='#FFFFFF'>YOUR COMMENT ABOUT THIS PRODUCT</font></strong></td>
        </tr>
        <tr>
            <td>
                <form action="BinhLuanSanPham.do?maSp=${sp.getMaSanPham()}" method="post" accept-charset="UTF-8" >
                    <p>
                        <textarea name="binhLuan" rows="200" cols="80"  style="width: 100%; height: 600px">write here</textarea>
                    </p>
                    <p>
                        <input type="submit" value="Submit" name="btComment" />
                    </p>
                </form>
            </td>
        </tr>
    </table>
</c:if>