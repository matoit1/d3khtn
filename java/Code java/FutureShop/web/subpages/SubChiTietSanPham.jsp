<%-- 
    Document   : SubChiTietSanPham
    Created on : Nov 30, 2011, 12:02:10 AM
    Author     : TRANTRI
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<h1 align="center" style="color: #FFB400; background-color:#A67500">Product Description</h1>
    <table width="675" border="1" bordercolor="#C8C8C8">
      <tr>
        <td width="242"><h1><span style="color: #009900; font-family: Verdana, Arial, Helvetica, sans-serif">${tenHangSX}</span></h1></td>
        <td width="417"><h3><span>${sp.tenSanPham}</span></h3></td>
      </tr>
      <tr>
        <td><img src="images/product/${sp.maSanPham}.jpg"/></td>
        <td>${sp.moTa}</td>
      </tr>
      <tr>
        <td><div align="center"><span style="font-weight: bold; color: #FF0000; font-size: medium">Price: ${sp.giaGoc}$ </span></div></td>
        <td><div align="center"><a href="#"><img src="images/buy_now_big_on.gif"/></a></div></td>
      </tr>
    </table>
    <br/>
    <table width="674" border="1">
      <tr>
        <th width="664" bgcolor="#333333" scope="col"><div align="left"><span style="color: #FFCC00">Comments</span></div></th>
      </tr>
      <tr>
        <td><strong>Tên người bình buận:</strong> nội dung binh luan</td>
      </tr>
      <tr>
        <td><strong>Tên người bình buận:</strong> nội dung binh luan</td>
      </tr>
    </table>
    <br/>
    <table width='100%' border='1' cellspacing='0' cellpadding='5'>
      <tr bgcolor='#666666'>
        <td class='bgColorMain'><strong><font color='#FFFFFF'>YOUR COMMENT ABOUT THIS PRODUCT</font></strong></td>
      </tr>
      <tr>
        <td><form action="#" method="post" accept-charset="UTF-8" >
            <p>
              <label for="binhLuan">Content:</label>
            </p>
            <p>
              <textarea name="binhLuan" rows="10" cols="80" style="width: 100%; height: 300px">write here</textarea>
            </p>
            <p>
              <input type="submit" value="Submit" name="btComment" />
            </p>
          </form></td>
      </tr>
    </table>