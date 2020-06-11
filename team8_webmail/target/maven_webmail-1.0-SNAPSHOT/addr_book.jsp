<%-- 
    Document   : addr_book
    Created on : 2020. 6. 3., 오후 9:49:06
    Author     : jihun
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="mytags" %>
<c:set var="userId" value="${userid}"/>
<!DOCTYPE html>
<html style="background-image:url('img/mail.PNG');">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= session.getAttribute("userid") %>님의 주소록</title>
        <link type="text/css" rel="stylesheet" href="css/main_style.css" />
        <script>console.log("${userId}")</script>
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <div id="sidebar">
            <jsp:include page="sidebar_menu.jsp" />
        </div>

        <div id="main">
            <mytags:addr user="team1" password="wlgns852" schema="james"
            owner="${userId}" table="addr_book"></mytags:addr> 
        </div>

        <jsp:include page="footer.jsp" />
    </body>
</html>