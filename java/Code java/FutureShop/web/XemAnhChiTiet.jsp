<%-- 
    Document   : XemAnhChiTiet
    Created on : Dec 1, 2011, 1:04:25 AM
    Author     : TRANTRI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>  
        <title>Future Shop</title> 
        <script src="js/jquery.tools.min.js"></script> 
        <link rel="stylesheet" type="text/css" href="style/scrollable.css" /> 
        <link rel="stylesheet" type="text/css" href="style/buttons.css" /> 
    </head> 
    <body>
        <div align="center">

            <h2>${sp.tenSanPham}</h2>
            <a class="prevPage  left"></a> 
            <div class="scrollable">	
                <div class="items"> 
                    <!-- 1-4--> 
                    <c:forEach var='i' begin="1" end="${sp.soHinhAnh}">
                        <img src="images/product/${sp.maSanPham}_${i}.jpg" /> 
                    </c:forEach>


                </div> 
            </div> 
            <a class="nextPage right"></a> 

            <script> 
                $(function()  { $("div.scrollable").scrollable({size: 1}); });
            </script> 
        </div>
    </body> 
</html>
