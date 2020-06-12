<%-- 
    Document   : show_message.jsp
    Author     : jongmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<jsp:useBean id="pop3" scope="page" class="cse.maven_webmail.model.Pop3Agent" />
<jsp:setProperty name="pop3" property="host" value="${host}"/>
<jsp:setProperty name="pop3" property="userid" value="${userid}"/>
<jsp:setProperty name="pop3" property="password" value="${password}"/>

<html style="background-image:url('img/mail.PNG');transition: margin-left .5s;
  padding: 20px;">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>메일 보기 화면</title>
        <link type="text/css" rel="stylesheet" href="css/main_style.css" />
    </head>
    <body>
        <jsp:include page="header.jsp" />

        <div id="sidebar">
            <jsp:include page="sidebar_previous_menu.jsp" />
        </div>

        <div id="msgBody">
            <%= pop3.getMessage(Integer.parseInt((String) request.getParameter("msgid")))%>
            <br>
            <a href="http://localhost:8080/maven_webmail/ReadMail.do?menu=41&msgid=<%=request.getParameter("msgid")%>"> delete </a>
            
        </div>


        <jsp:include page="footer.jsp" />


    </body>
</html>
