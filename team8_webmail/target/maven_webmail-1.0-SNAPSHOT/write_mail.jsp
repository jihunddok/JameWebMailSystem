<%-- 
    Document   : write_mail.jsp
    Author     : jongmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cse.maven_webmail.control.CommandType" %>

<!DOCTYPE html>

<%-- @taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" --%>
<% request.setCharacterEncoding("UTF-8");%>

<html >
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>메일 쓰기 화면</title>    
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css" />
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/mdb.min.css" rel="stylesheet">
        <link href="css/addons/datatables.min.css" rel="stylesheet">
        <script type='text/javascript'>
            function check_size(input) {
                var num = ((input.files[0].size / 1024) / 1024);
                if (input.files && num > 10) {
                    alert("파일을 업로드할 수 없습니다. 해당 파일의 용량은 " + num.toFixed(2) + "MB로 10MB가 넘습니다.");
                    input.value = null;
                }
            }
        </script>

    </head>
    <body class="" style="background-image:url('img/mail.PNG');     background-repeat: no-repeat; background-size:cover">
         <%@include file="header.jspf"%>


        <div id="sidebar">
            <jsp:include page="sidebar_previous_menu.jsp" />
        </div>

        <div id="main" style=" float: left;width: 65%; margin-top:5%;">
                 <jsp:include page="mail_send_form.jsp" />
               
        </div>

      <%@include file="footer.jspf"%>
    </body>
</html>
