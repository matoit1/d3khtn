<%-- 
    Document   : Template
    Created on : Nov 21, 2011, 9:09:00 AM
    Author     : VIET
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib  uri="http://java.sun.com/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN'
    'http://www.w3.org/TR/html4/loose.dtd'>

<<<<<<< .mine
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Future Shop</title>
        <link href="style/StyteMain.css" type="text/css" rel="stylesheet"/>
        <script src="js/jquery.min.js" type="text/javascript"></script>
    </head>
    <body class="MainBody"> 
        <div id="container">
            <tiles:insertAttribute name="header"/>
            <tiles:insertAttribute name="left"/>
            <div id="mainContent">
                <tiles:insertAttribute name="mainContent"/>
            </div>
=======
<html xmlns="http://www.w3.org/1999/xhtml">
>>>>>>> .r180

<<<<<<< .mine
            <br class="clearfloat" />
            <tiles:insertAttribute name="footer"/>
            <!-- end #container -->
        </div>

    </body>   
</html>  

<script type="text/javascript">
    var timeout         = 500;
    var closetimer		= 0;
    var ddmenuitem      = 0;
		
    function jsddm_open()
    {	jsddm_canceltimer();
        jsddm_close();
        ddmenuitem = $(this).find('ul').eq(0).css('visibility', 'visible');}
		
    function jsddm_close()
    {	if(ddmenuitem) ddmenuitem.css('visibility', 'hidden');}
		
    function jsddm_timer()
    {	closetimer = window.setTimeout(jsddm_close, timeout);}
		
    function jsddm_canceltimer()
    {	if(closetimer)
        {	window.clearTimeout(closetimer);
            closetimer = null;}}
		
    $(document).ready(function()
    {	$('#jsddm > li').bind('mouseover', jsddm_open);
        $('#jsddm > li').bind('mouseout',  jsddm_timer);
    });
		
    document.onclick = jsddm_close;
</script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/query.js"></script>
<script type="text/javascript" src="js/easySlider1.5.js"></script>
<script type="text/javascript">
    $(document).ready(function(){	
        $("#slider").easySlider({
            controlsBefore:	'<p id="controls">',
            controlsAfter:	'</p>',
            auto: true, 
            continuous: true
        });
=======
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Future Shop</title>
        <link href="style/StyteMain.css" type="text/css" rel="stylesheet"/>
        <script language="javascript" type="text/javascript" src="js/jquery.js"></script>
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
>>>>>>> .r180
<<<<<<< .mine
		
    });	
</script>
<script type="text/javascript">
    $(document).ready(function(){
    ${"ul#jsddm1 li"}.hover(function(){
            $(this).css({ 'background' : '#1376c9 url(topnav_active.gif) repeat-x'});
            $(this).find("li").show();
        },
        function(){
            $(this).css({ 'background' : 'none'});
            $(this).find("li").hide();
        });
    });
</script>=======

        </script>
        <script src="SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
        <link href="SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css" />
    </head>
    <body class="MainBody"> 
        <div id="container">
            <tiles:insertAttribute name="header"/>
            <tiles:insertAttribute name="left"/>
            <div id="mainContent">
                <tiles:insertAttribute name="mainContent"/>
            </div>
            <br class="clearfloat" />
            <tiles:insertAttribute name="footer"/>
            <!-- end #container -->
        </div>

    </body>   
</html>  
>>>>>>> .r180
