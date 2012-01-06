<%-- 
    Document   : SubTimKiemNangCao
    Created on : Jan 5, 2012, 9:04:23 AM
    Author     : VIET
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script language='JavaScript' type='text/javascript'>       
    function KiemTraTimKiemNangCao(){   
        donGia  =formTimKiem.gia.value;
        
        if(isNaN(donGia)) {
            frmUpload.gia.style.backgroundColor = 'red';
            alert('Bắt buộc là số');
            formTimKiem.gia.focus();
            return;
        }
        formTimKiem.submit();
    }
</script>

<c:catch var="ex">
    <div id="WrapperLookup">
        <form name="formTimKiem" method="get" action="TimKiemNangCao.do">
            <h2>Tìm Kiếm Sản Phẩm</h2>
            <label>Tên Sản Phẩm</label> 
            <input type="text" id="tenSanPham" name="tenSanPham" value="${param.tenSanPham}"/>
            <label>Giá</label> 
            <input type="text" id="gia" name="gia" value="${param.gia}"/>
            <br/>
            <label>Hãng sãn xuất</label> 
            <select name="maHangSanXuat">
                <c:forEach items="${dsHangSanXuat}" var="hsx">
                    <option value="${hsx.maHangSanXuat}">${hsx.tenHangSanXuat}</option>
                </c:forEach>
            </select>
            <label>Loại sản phẩm</label> 
            <select name="maLoaiSanPham">
                <c:forEach items="${dsLoaiSanPham}" var="lsp">
                    <option value="${lsp.maLoaiSanPham}">${lsp.tenLoaiSanPham}</option>
                </c:forEach>
            </select>
            <br/>
            <input  type="button" name="btnTim" value="Tìm" onclick="KiemTraTimKiemNangCao()"/>
        </form>
    </div>
    <div id="WrapperList">
        Trang
        <c:forEach begin="1" end="${soTrang}" var="t">
            <a href="TimKiemNangCao.do?tenSanPham=${tenSanPham}&trang=${t}&maHangSanXuat=${maHangSanXuat}&maLoaiSanPham=${maLoaiSanPham}&gia=${gia}">${t}</a>
        </c:forEach>
        <c:forEach items="${requestScope.dsSanPham}" var="sp"  >
            <div class="danhsach"> 
                <div id="hinhanh"><a href="ChiTietSanPham.do?maSp=${sp.maSanPham}" ><img alt="#"  src="images/product/${sp.maSanPham}_1.jpg" height="100" width="100" align="middle"/></a></div>
                <div id="chitiet">
                    <p><a href="ChiTietSanPham.do?maSp=${sp.maSanPham}">${sp.tenSanPham}</a></p>
                    <p>webID:${sp.maSanPham}</p>
                    <p>Customer Rating: <img alt="#" src="images/rating_on.png"/><img alt="#" src="images/rating_on.png"/></p>
                    <p><img alt="#" src="images/available.png"/></p>
                </div>
                <div id="gia"><p>${sp.giaGoc}</p></div> 
            </div>
        </c:forEach>
    </div>
</c:catch>
<c:if test="${ex ne null}">
    ${ex.message}
</c:if>