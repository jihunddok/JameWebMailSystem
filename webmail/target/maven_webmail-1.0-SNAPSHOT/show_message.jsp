<%-- 
    Document   : show_message.jsp
    Author     : jongmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

 
 <jsp:useBean id="pop3" scope="page" class="cse.maven_webmail.model.Pop3Agent" />
<!-- 세션값 받아오는 부분 jstl로 변경 -->
<c:set target="${pop3}" property="host" value="${host}" />
<c:set target="${pop3}" property="userid" value="${userid}" />
<c:set target="${pop3}" property="password" value="${password}" />

<%--
            pop3.setHost((String) session.getAttribute("host"));
            pop3.setUserid((String) session.getAttribute("userid"));
            pop3.setPassword((String) session.getAttribute("password"));
--%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>메일 보기 화면</title>
        <link type="text/css" rel="stylesheet" href="css/main_style.css" />
    </head>
    <body>

        <div id="msgBody">
            <!-- jstl, el 표현식으로 못바꾸나? -->
            <%= pop3.getMessage(Integer.parseInt((String) request.getParameter("msgid")))%>

        </div>
        
    </body>
</html>
