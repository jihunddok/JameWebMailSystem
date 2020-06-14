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

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>메일 보기 화면</title>
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css" />
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/mdb.min.css" rel="stylesheet">
        <link href="css/addons/datatables.min.css" rel="stylesheet">
    </head>
    <body style="background-image:url('img/mail.PNG'); background-repeat: no-repeat; background-size:cover">
        <jsp:include page="header.jsp" />

        <div id="sidebar">
            <jsp:include page="sidebar_previous_menu.jsp" />
        </div>
        <div class="row left-align" style="margin-left:20%;margin-right: 25%;margin-top:10%">
            <div class="col m6">
                <div class="card " style="background-color:rgb(54,52,52)">
                    <div class="card-content">
                        <div class="container " >
                             <a style="float: right; " href="http://localhost:8080/maven_webmail/ReadMail.do?menu=41&msgid=<%=request.getParameter("msgid")%>">delete mail</a>
                            <span class="card-title blue-grey-text text-lighten-2 ">MAIL</span>
                            <br>
                            
                            <div class="white-text" id="msgBody" >
                                <%= pop3.getMessage(Integer.parseInt((String) request.getParameter("msgid")))%>

                               
                            </div>          
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <%@include file="footer.jspf"%>



    </body>
</html>
