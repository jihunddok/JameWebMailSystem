<%-- 
    Document   : main_menu.jsp
    Author     : jongmin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="cse.maven_webmail.model.Pop3Agent" %>
<!DOCTYPE html>
 
 <jsp:useBean id="pop3" scope="page" class="cse.maven_webmail.model.Pop3Agent" />
<!-- 세션값 받아오는 부분 jstl로 변경 -->
<c:set target="${pop3}" property="host" value="${host}" />
<c:set target="${pop3}" property="userid" value="${userid}" />
<c:set target="${pop3}" property="password" value="${password}" />

<%-- // c:set으로 pop3 객체의 속성값이 제대로 지정되었는지 확인
    System.out.println("host : " + pop3.getHost());
    System.out.println("userid : " + pop3.getUserid());
    System.out.println("password : " + pop3.getPassword());
--%>

 <%--
<jsp:setProperty name="pop3" property="host" value="${host}"/>
<jsp:setProperty name="pop3" property="userid" value="${userid}"/>
<jsp:setProperty name="pop3" property="password" value="${password}"/>
 --%>


<%--
            //String pageno = (String) request.getParameter("pageno");
            //if (pageno != null) {
            //    session.setAttribute("pageno", pageno);
            //}
            pop3.setHost((String) session.getAttribute("host"));
            pop3.setUserid((String) session.getAttribute("userid"));
            pop3.setPassword((String) session.getAttribute("password"));
            //pop3.setPageno((int)Integer.parseInt((String)session.getAttribute("pageno")));
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>주메뉴 화면</title>
        <link type="text/css" rel="stylesheet" href="css/main_style.css" />
    </head>

    <body>
        <%@include file="header.jspf"%>

        <div id="sidebar">
            <jsp:include page="sidebar_menu.jsp" />
        </div>

        <div id="main">
            ${pop3.getMessageList()} <!-- el표현식으로 변경 -->
            <%--= pop3.getMessageList() --%>
        </div>

        <%@include file="footer.jspf"%>

    </body>
</html>
