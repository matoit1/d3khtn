<%-- 
    Document   : Left
    Created on : Nov 21, 2011, 11:19:45 AM
    Author     : VIET
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<c:catch var="ex">
    <div id="left">
        <div id="categories">
            <h2>Categories</h2>
            <ul>
                <li><a href="#">Apple</a></li>
                <li><a href="#">Bell Internet</a></li>
                <li><a href="#">Bell Mobility</a></li>
                <li><a href="#">Bell TV</a></li>
                <li><a href="#">BlackBerry</a></li>
                <li><a href="#">Intel</a></li>
            </ul>
        </div>
        <!-- end #left -->
    </div>
</c:catch>
<c:if test="${ex ne null}">
    ${ex.message}
</c:if>