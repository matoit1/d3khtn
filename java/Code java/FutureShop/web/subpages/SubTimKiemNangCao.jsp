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
            <h2>Find Products</h2>
            <label>Product'name</label> 
            <input type="text" id="tenSanPham" name="tenSanPham" value="${param.tenSanPham}"/>
            <label>Cost</label> 
            <input type="text" id="gia" name="gia" value="${param.gia}"/>
            <br/>
            <label>Manufacturer</label> 
            <select name="maHangSanXuat">
                <c:forEach items="${dsHangSanXuat}" var="hsx">
                    <option value="${hsx.maHangSanXuat}">${hsx.tenHangSanXuat}</option>
                </c:forEach>
            </select>
            <label>Categories</label> 
            <select name="maLoaiSanPham">
                <c:forEach items="${dsLoaiSanPham}" var="lsp">
                    <option value="${lsp.maLoaiSanPham}">${lsp.tenLoaiSanPham}</option>
                </c:forEach>
            </select>
            <br/>
            <!--<input  type="button" name="btnTim" value="Find" onclick="KiemTraTimKiemNangCao()"/>--> 
            <input type="image" src="images/binoculars.jpg" alt="find" height="80" width="80" style="margin: 10px"/>
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
<<<<<<< .mine
                    <p>Customer Rating: 
                        <c:forEach begin="1" end="${sp.danhGia}" var="i">
                            <img alt="rating_on" src="images/rating_on.png"/>
                        </c:forEach>
                        <c:forEach begin="${sp.danhGia+1}" end="${5}" var="i">
                            <img alt="rating_off" src="images/rating_off.png"/>
                        </c:forEach>
                    </p>
                    <p>
                        <c:if test="${sp.soLuong > 0}">
                            <img alt="#" src="images/available.png"/>
                        </c:if>
                        <c:if test="${sp.soLuong <= 0}">
                            <img alt="#" src="images/notavailable.png"/>
                        </c:if>
                    </p>
=======
                    <p>Customer Rating: 
                        <c:forEach begin="1" step="1" end="${sp.danhGia}" var="i">
                            <a> <img src="images/rating_on.png"/></a>
                            </c:forEach>
                            <c:forEach begin="${sp.danhGia + 1}" end="${5}" step="1" var="i">
                            <a> <img src="images/rating_off.png"/></a>
                            </c:forEach> 
                    </p>
                    <c:if test="${sp.soLuong gt 0}">
                        <p><img alt="#" src="images/available.png"/></p>
                        </c:if>
                        <c:if test="${sp.soLuong eq 0}">
                        <p><img alt="#" src="images/notavailable.png"/></p>
                    </c:if>
>>>>>>> .r277
                </div>
                <div id="gia"><p>${sp.giaGoc}</p></div> 
            </div>
        </c:forEach>
    </div>
</c:catch>
<c:if test="${ex ne null}">
    ${ex.message}
</c:if>