<%-- 
    Document   : sidebar_menu.jsp
    Author     : jongmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cse.maven_webmail.control.CommandType" %>

<!DOCTYPE html>

 <div class="sidenav">
        <span class="white-text"> <strong>사용자: <%= session.getAttribute("userid") %> </strong> </span> <br>
        
        <p class="white-text"> <a href="main_menu.jsp"> 메일 읽기 </a> </p>
        <p class="white-text"> <a href="write_mail.jsp"> 메일 쓰기 </a> </p>
        <p class="white-text"> <a href="addr_book.jsp"> 주소록 </a> </p>    
        <p class="white-text"><a href="Login.do?menu=<%= CommandType.LOGOUT %>">로그아웃</a></p>
 </div>