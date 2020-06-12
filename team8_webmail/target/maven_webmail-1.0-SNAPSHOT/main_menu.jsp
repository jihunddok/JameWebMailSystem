<%-- 
    Document   : main_menu.jsp
    Author     : jongmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="pop3" scope="page" class="cse.maven_webmail.model.Pop3Agent" />
<!-- 세션값 받아오는 부분 jstl로 변경 -->
<c:set target="${pop3}" property="host" value="${host}" />
<c:set target="${pop3}" property="userid" value="${userid}" />
<c:set target="${pop3}" property="password" value="${password}" />

 
<html >
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>주메뉴 화면</title>
        <link type="text/css" rel="stylesheet" href="css/materialize.css" />
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/mdb.min.css" rel="stylesheet">
        <link href="css/addons/datatables.min.css" rel="stylesheet">
        <style>
            th, td{

                text-align: center;


            }
            #no{
                width: 5%;
            }#sender{
                width: 30%;
            }#subject{
                width: 30%;
            }#date{
                width: 20%;
            }#delte{
                width: 15%;
            }

        </style>

    </head>

    <body style="background-image:url('img/mail.PNG'); background-repeat: no-repeat; background-size:cover">
         <%@include file="header.jspf"%>

        <jsp:include page="sidebar_menu.jsp" />


        <div class="white-text" id="main" style=" float: left;width: 65%;margin-top:5%; margin-bottom : 5%;">
                ${pop3.getMessageList()} <!-- el표현식으로 변경 -->

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
