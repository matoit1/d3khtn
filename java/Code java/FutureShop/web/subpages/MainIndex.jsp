<%-- 
    Document   : MainIndex
    Created on : Nov 22, 2011, 2:51:29 PM
    Author     : VIET
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<c:catch var="ex">
    <!-- InstanceBeginEditable name="NoiDungThayDoi" -->
    <div class="ad_top">
      <div id="slider">
        <ul>
          <li> <img src="images/banner(2).png"/></li>
          <li> <img src="images/BANNER (3).png"/></li>
          <li> <img src="images/banner(4).png"/></li>
        </ul>
      </div>
    </div>
    <br/>
    <h1 align="center" style="color: #FFB400; background-color:#A67500">Featured Promotions</h1>  
    <div id="black-bl">
      <div class="black-box">
        <h2><a href="#" style="font-size: 14px; font-weight: bold">Canon EOS Rebel XS DC Lens Kit &amp; DSLR Bag</a></h2>
        <p><img src="images/product/10166963.jpg" width="160" height="160" alt="Pic 1" /></p>
        <p style="color: #FB4844; font-weight: bold">Price: 100$</p>
        <p>Trade in your old camera and SAVE up to $100 on new Canon cameras! See how.</p>
         <a href="#"><p class="more">&gt; &gt;More</p></a>
      </div>
      <div class="black-box">
        <h2><a href="#" style="font-size: 14px; font-weight: bold">Canon EOS Rebel XS DC Lens Kit &amp; DSLR Bag</a></h2>
        <p><img src="images/product/10166963.jpg" width="160" height="160" alt="Pic 1" /></p>
        <p style="color: #FB4844; font-weight: bold">Price: 100$</p>
        <p>Trade in your old camera and SAVE up to $100 on new Canon cameras! See how.</p>
         <a href="#"><p class="more">&gt; &gt;More</p></a>
      </div>
        <div class="black-box">
        <h2><a href="#" style="font-size: 14px; font-weight: bold">Canon EOS Rebel XS DC Lens Kit &amp; DSLR Bag</a></h2>
        <p><img src="images/product/10166963.jpg" width="160" height="160" alt="Pic 1" /></p>
        <p style="color: #FB4844; font-weight: bold">Price: 100$</p>
        <p>Trade in your old camera and SAVE up to $100 on new Canon cameras! See how.</p>
         <a href="#"><p class="more">&gt; &gt;More</p></a>
      </div>
        <div class="black-box">
        <h2><a href="#" style="font-size: 14px; font-weight: bold">Canon EOS Rebel XS DC Lens Kit &amp; DSLR Bag</a></h2>
        <p><img src="images/product/10166963.jpg" width="160" height="160" alt="Pic 1" /></p>
        <p style="color: #FB4844; font-weight: bold">Price: 100$</p>
        <p>Trade in your old camera and SAVE up to $100 on new Canon cameras! See how.</p>
         <a href="#"><p class="more">&gt; &gt;More</p></a>
      </div>
        <div class="black-box">
        <h2><a href="#" style="font-size: 14px; font-weight: bold">Canon EOS Rebel XS DC Lens Kit &amp; DSLR Bag</a></h2>
        <p><img src="images/product/10166963.jpg" width="160" height="160" alt="Pic 1" /></p>
        <p style="color: #FB4844; font-weight: bold">Price: 100$</p>
        <p>Trade in your old camera and SAVE up to $100 on new Canon cameras! See how.</p>
         <a href="#"><p class="more">&gt; &gt;More</p></a>
      </div>
        <div class="black-box">
        <h2><a href="#" style="font-size: 14px; font-weight: bold">Canon EOS Rebel XS DC Lens Kit &amp; DSLR Bag</a></h2>
        <p><img src="images/product/10166963.jpg" width="160" height="160" alt="Pic 1" /></p>
        <p style="color: #FB4844; font-weight: bold">Price: 100$</p>
        <p>Trade in your old camera and SAVE up to $100 on new Canon cameras! See how.</p>
         <a href="#"><p class="more">&gt; &gt;More</p></a>
      </div>
      <div class="clear"></div>
    </div>
    <!-- InstanceEndEditable -->
    <!-- end #mainContent -->
</c:catch>
<c:if test="${ex ne null}">
    ${ex.message}
</c:if>