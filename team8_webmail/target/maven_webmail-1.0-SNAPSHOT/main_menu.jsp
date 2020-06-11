<%-- 
    Document   : main_menu.jsp
    Author     : jongmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<jsp:useBean id="pop3" scope="page" class="cse.maven_webmail.model.Pop3Agent" />
<%
            //String pageno = (String) request.getParameter("pageno");
            //if (pageno != null) {
            //    session.setAttribute("pageno", pageno);
            //}
            pop3.setHost((String) session.getAttribute("host"));
            pop3.setUserid((String) session.getAttribute("userid"));
            pop3.setPassword((String) session.getAttribute("password"));
            //pop3.setPageno((int)Integer.parseInt((String)session.getAttribute("pageno")));
%>

<html style="background-image:url('img/mail.PNG');">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>주메뉴 화면</title>
        <link type="text/css" rel="stylesheet" href="css/materialize.css" />
    </head>

    <body>
        <jsp:include page="header.jsp" />

       
            <jsp:include page="sidebar_menu.jsp" />
   

        <div class="white-text" id="main" style="padding-left: 20%;">
            <%= pop3.getMessageList() %>
        </div>

        <jsp:include page="footer.jsp" />

    </body>
</html>
