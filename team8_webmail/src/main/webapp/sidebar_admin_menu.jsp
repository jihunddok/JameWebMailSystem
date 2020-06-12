<%-- 
    Document   : sidebar_admin_menu.jsp
    Author     : jongmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cse.maven_webmail.control.CommandType" %>

<!DOCTYPE html>

<div style="float:left;width: 33%;padding-left: 5%;padding-top: 5%">

    <span class="white-text"> <strong style="font-size: 30pt; "><%= session.getAttribute("userid")%> </strong> </span> <br>
    <p><a href="add_user.jsp">사용자 추가</a> </p>
    <p><a href="delete_user.jsp"> 사용자 제거</a> </p>
    <p><a href="Login.do?menu=<%= CommandType.LOGOUT%>">로그아웃</a></p>
    
</div>

