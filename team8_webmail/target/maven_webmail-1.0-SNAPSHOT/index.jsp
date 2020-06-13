<%--
    Document   : index.jsp
    Author     : jongmin
    Description:
        본 프로젝트의 목적은 SMTP/POP3를 사용하는 메일서버에 웹메일 인터페이스를 제공하여
        웹메일 시스템으로 사용할 수 있게 해주는데 있다.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cse.maven_webmail.control.CommandType"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>


<c:if test="${empty session.isNew()}">
    <c:set var="host" value="localhost" scope="session"/>
    <c:set var="debug" value="false" scope="session"/>
</c:if>

<html style="background-image:url('img/mail.PNG');">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>로그인 화면</title>
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css" />


    </head>
    <body style="align-content: center;">

        <%@include file="header.jspf"%>

        <div class="row left-align" style="margin-left:40%;margin-right: 10%;margin-top:15%">
            <div class="col s12 m6">
                <div class="card " style="background-color:rgb(54,52,52)">

                    <div class="card-content">
                        <div class="container " id="login_form">
                            <span class="card-title blue-grey-text text-lighten-2 ">Login</span>
                            <div class="input-field">
                                <form method="POST" action="Login.do?menu=<%= CommandType.LOGIN%>">

                                    <input class="input-field white-text" type="text" name="userid" size="20" style="margin: 3%;background-color:transparent; "> 
                                    <input class="white-text" type="password" name="passwd" size="20" style="margin: 3%;background-color:transparent; ">

                                    <input class="btn-flat white" type="submit" value="Login" name="B1" style="margin: 3%;">
                                    <input class="btn-flat white" type="button" value="Sign Up" onclick="location.href = 'sign_up.jsp'"  style="margin: 3%;">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <%@include file="footer.jspf"%>

    </body>
</html>
