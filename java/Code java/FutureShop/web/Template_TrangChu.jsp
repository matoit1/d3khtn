<%-- 
    Document   : Template_TrangChu
    Created on : Dec 12, 2011, 10:59:09 AM
    Author     : TRANTRI
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib  uri="http://java.sun.com/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'
    'http://www.w3.org/TR/html4/loose.dtd'>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Future Shop</title>
        <link href="style/StyteMain.css" type="text/css" rel="stylesheet"/>
        <link href="style/style.css" type="text/css" rel="stylesheet"/>
        <script language="javascript" type="text/javascript" src="js/jquery.js"></script>
        <script language="javascript" type="text/javascript" src="js/jquery.easing.js"></script>
        <script language="javascript" type="text/javascript" src="js/script.js"></script>
        <script type="text/javascript">
            $(document).ready( function(){ 
                $('#lofslidecontent45').lofJSidernews( { interval:2000, easing:'easeInOutQuad', duration:1200, auto:true } );
                $("#cdn").hide();
                $(".btn").click(function(){$("#cdn").slideToggle(1000);});
            });
        </script>
        <script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
        <link href="SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css" />
    </head>
    <body class="MainBody"> 
        <div id="container">
            <tiles:insertAttribute name="header"/>
            <div id="mainContent" style="margin:5px; width:890px">
                <tiles:insertAttribute name="mainContent"/>
            </div>
            <br class="clearfloat" />
            <tiles:insertAttribute name="footer"/>
            <!-- end #container -->
        </div>

    </body>   
</html>  

