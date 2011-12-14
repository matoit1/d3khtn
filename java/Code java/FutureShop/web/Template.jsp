<%-- 
    Document   : Template
    Created on : Nov 21, 2011, 9:09:00 AM
    Author     : VIET
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'
    'http://www.w3.org/TR/html4/loose.dtd'>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Future Shop</title>
        <link type="text/css" rel="stylesheet" href="SpryAssets/SpryMenuBarHorizontal.css"/>
        <link type="text/css" rel="stylesheet" href="style/StyteMain.css"/>
        <link type="text/css" rel="stylesheet" href="style/css.css"/>
        <link type="text/css" rel="stylesheet" href="style/style.css"/>
        <script type="text/javascript" src="js/jquery.js" language="javascript"></script>
        <script type="text/javascript" src="js/query.js" language="javascript"></script>
        <script type="text/javascript" src="js/script.js" language="javascript"></script>
        <script type="text/javascript" src="js/jquery.easing.js" language="javascript"></script>
        <script src="SpryAssets/SpryMenuBar.js" type="text/javascript" language="javascript"></script>
        <script type="text/javascript">
            $(document).ready( function(){ 
                $('#lofslidecontent45').lofJSidernews( { interval:2000, easing:'easeInOutQuad', duration:1200, auto:true } );
                $("#cdn").hide();
                $(".btn").click(function(){$("#cdn").slideToggle(1000);});
            });
        </script>
    </head>
    <body class="MainBody"> 
        <div id="container">
            <tiles:insertAttribute name="header"/>
            
            <c:if test="${sessionScope.admin eq null}">
                <tiles:insertAttribute name="left"/>
            </c:if>
            <c:if test="${sessionScope.admin ne null}" >
                <tiles:insertAttribute name="left_admin"/>
            </c:if>
            <div id="mainContent">
                <tiles:insertAttribute name="mainContent"/>
            </div>
            <br class="clearfloat" />
            <tiles:insertAttribute name="footer"/>
            <!-- end #container -->
        </div>
    </body>   
</html>  

<script language="javascript" type="text/javascript" src="js/script.js"></script>
<script type="text/javascript">
    $(document).ready( function(){ 
        $('#lofslidecontent45').lofJSidernews( { interval:2000,
            easing:'easeInOutQuad',
            duration:1200,
            auto:true } );
        $("#cdn").hide();
        $(".btn").click(function(){
                <script language="javascript" type="text/javascript" src="js/jquery.js">
</script>
<script language="javascript" type="text/javascript" src="js/query.js"></script>
<script language="javascript" type="text/javascript" src="js/jquery.easing.js"></script>
<script language="javascript" type="text/javascript" src="js/script.js"></script>
<script type="text/javascript">
            $(document).ready( function(){ 
                $('#lofslidecontent45').lofJSidernews( { interval:2000,
                    easing:'easeInOutQuad',
                    duration:1200,
                    auto:true } );
                $("#cdn").hide();
                $(".btn").click(function(){
                    $("#cdn").slideToggle(1000);
                });
            });		
        });	
</script>



