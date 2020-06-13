<%-- 
    Document   : sidebar_adduser_menu
    Author     : jihun
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

    <div style="float:left;width: 33%;padding-left: 5%;padding-top: 5%">

        <span class="white-text">
            <strong id="username" style="font-size:30pt"><%= session.getAttribute("userid") %> </strong>
        </span> <br> <br>
        
        <a href="addr_book.jsp"> 이전 메뉴로 </a>
    </div>