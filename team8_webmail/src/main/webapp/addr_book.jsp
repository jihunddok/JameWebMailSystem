<%-- 
    Document   : addr_book
    Created on : 2020. 6. 3., 오후 9:49:06
    Author     : jihun
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="mytags" %>
<c:set var="userId" value="${userid}"/>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= session.getAttribute("userid")%>님의 주소록</title>
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css" />
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/mdb.min.css" rel="stylesheet">
    
        <link href="css/addons/datatables.min.css" rel="stylesheet">
         <link href="css/addons/datatables.min.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script>console.log("${userId}")</script>
    </head>
    <body style="background-image:url('img/mail.PNG'); background-repeat: no-repeat; background-size:cover">
      <%@include file="header.jspf"%>

        <div id="sidebar">
            <jsp:include page="sidebar_previous_menu.jsp" />
        </div>

        <div class="white-text" id="main" style=" float: left;width: 65%;margin-top:5%; margin-bottom : 5%;">
            
            <mytags:addr user="team1" password="wlgns852" schema="james"
                         owner="${userId}" table="addr_book"></mytags:addr> 
            <input class="btn-flat white" type="button" value="add friend" onclick="location.href = 'add_friend.jsp'"  style="margin: 3%; float: right">
             
        </div>

            <!-- JQuery -->
            <script type="text/javasciprt" src="js/jquery.min.js"></script>
            <script type="text/javasciprt" src="js/popper.min.js"></script>
            <script type="text/javasciprt" src="js/bootstrap.min.js"></script>
            <script type="text/javasciprt" src="js/mdb.min.js"></script>
            <script type="text/javascript" src="js/addons/datatables.min.js"></script>


            <script type="text/javascript">
            $(document).ready(function () {
                $('#dtBasicExample').DataTable({
                    "pagingType": "first_last_numbers", // "simple" option for 'Previous' and 'Next' buttons only
                    "scrollY": "50vh",
                    "scrollCollapse": true,
                });

                $('.dataTables_length').addClass('bs-select');
                $('.page-link').css('color', 'white');
            });


            </script>

        <%@include file="footer.jspf"%>

    </body>
</html>