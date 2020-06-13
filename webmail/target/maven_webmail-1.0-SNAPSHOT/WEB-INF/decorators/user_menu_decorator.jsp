<%-- 
    Document   : main_decorator
    Created on : 2020. 6. 13., 오전 2:37:28
    Author     : jdl
--%>

<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>
            <decorator:title default="WEBMAIL SYSTEM" />
        </title>
        <style>

        </style>
        <decorator:head />
        
    </head>
    <body>
        <%@include file="/WEB-INF/jspf/header.jspf"%>
        <div id="sidebar">
            <%@include file="/sidebar_previous_menu.jsp" %>
        </div>
        <decorator:body/>
        <script>
            // login 관련 script를 작성하였다.
        </script>
        <%@include file="/WEB-INF/jspf/footer.jspf"%>
    </body>
</html>