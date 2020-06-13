<%-- 
    Document   : add_friend
    Created on : 2020. 6. 13., 오전 1:07:17
    Author     : jihun
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="pop3" scope="page" class="cse.maven_webmail.model.Pop3Agent" />

<%@page import="cse.maven_webmail.control.CommandType" %>
<%@page import="cse.maven_webmail.model.UserAdminAgent" %>
<!-- 세션값 받아오는 부분 jstl로 변경 -->
<c:set target="${pop3}" property="host" value="${host}" />
<c:set target="${pop3}" property="userid" value="${userid}" />
<c:set target="${pop3}" property="password" value="${password}" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ADD friends</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/mdb.min.css" rel="stylesheet">
        <link href="css/addons/datatables.min.css" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
    <body  id="with_draw" style="background-image:url('img/mail.PNG'); background-repeat: no-repeat; background-size:cover">

        <%@include file="header.jspf"%>

        <jsp:include page="addrbook_sidebar.jsp" />
        <div class="row left-align" style="margin-left:40%;margin-right: 10%;margin-top:5%">
            <div class="col s12 m6">
                <div class="card " style="background-color:rgb(54,52,52)">

                    <div class="card-content white-text">
                        <div class="container " id="withdraw_form">
                            <span class="card-title blue-grey-text text-lighten-2 ">WITH DRAW</span>
                            <div class="input-field white-text">
                                <form action="InsertFriend" method="POST">

                                    <p >Add Your Friend!</p>
                                    <br>
                                    <%
                                        //세션에 현재 로그인된 사용자 정보
                                        String userid = (String) session.getAttribute("userid");
                                    %>

                                    <input type="checkbox" name="owner_email" value="<%= userid%>" checked="checked">
                                    <input class="white-text" name="friend_email" type="text" placeholder="friend's email" required />
                                    <input class="white-text" name="nick_name" type="text" placeholder="friend's nick name" required />
                                    <input class="btn-small indigo "  type="submit"  value="Submit" style="margin-bottom: 20%"/>



                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
