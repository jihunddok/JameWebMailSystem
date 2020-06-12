<%-- 
    Document   : sidebar_menu.jsp
    Author     : jongmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cse.maven_webmail.control.CommandType" %>

<!DOCTYPE html>
<div style="float:left;width: 33%;padding-left: 5%;padding-top: 5%">
    <span class="white-text"> <strong style="font-size: 30pt; "><%= session.getAttribute("userid") %> </strong> </span> <br>
        
        <p class="white-text" style="padding-top: 10%"> menu</p>
        <p class="white-text"> <a href="main_menu.jsp"> mail box </a> </p>
        <p class="white-text"> <a href="write_mail.jsp"> send mail </a> </p>
        <p class="white-text"> <a href="addr_book.jsp"> address book </a> </p>
         
        <p class="white-text"><a href="Login.do?menu=<%= CommandType.LOGOUT %>">logout</a></p>
        <p > <a style="color:red;" href="withdraw.jsp"> withdraw </a> </p>    
</div>