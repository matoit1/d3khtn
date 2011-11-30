<%-- 
    Document   : XemAnhChiTiet
    Created on : Dec 1, 2011, 1:04:25 AM
    Author     : TRANTRI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

                        <img src="images/product/${sp.maSanPham}_1.jpg" /> 
                        <img src="images/product/${sp.maSanPham}_2.jpg" /> 
                        <img src="images/product/${sp.maSanPham}_3.jpg" /> 


                </div> 
        </div> 
        <a class="nextPage right"></a> 

        <script> 
                $(function()  { $("div.scrollable").scrollable({size: 1}); });
        </script> 
    </div>
</body> 
</html>
