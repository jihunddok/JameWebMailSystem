<%-- 
    Document   : sidebar_adduser_menu
    Author     : jongmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

    <div style="float:left;width: 33%;padding-left: 5%;padding-top: 5%">

        <span class="white-text">
            <strong style="font-size:30pt"><%= session.getAttribute("userid") %> </strong>
        </span> <br> <br>
        
        <a href="main_menu.jsp"> 이전 메뉴로 </a>
    </div>