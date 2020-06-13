<%-- 
    Document   : add_user.jsp
    Author     : jongmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cse.maven_webmail.control.CommandType" %>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>사용자 추가 화면</title>
        <link type="text/css" rel="stylesheet" href="css/materialize.css" />
    </head>
   <body style="background-image:url('img/mail.PNG'); background-repeat: no-repeat; background-size:cover">
        <%@include file="header.jspf"%>

        <div id="sidebar">
                <jsp:include page="addrbook_sidebar.jsp" />
        </div>

        <div class="white-text" id="main" style=" float: left;width: 65%;margin-top:5%; margin-bottom : 5%; padding-right: 30%">
            추가로 등록할 사용자 ID와 암호를 입력해 주시기 바랍니다. <br> <br>

            <form name="AddUser" action="UserAdmin.do?menu=<%= CommandType.ADD_USER_COMMAND%>"
                  method="POST">
                <table>
                    <tr>
                        <td>사용자 ID</td>
                    </tr>
                    <tr>
                        <td> <input type="text" placeholder="new id" name="id" id="newID" required pattern="[A-Za-z0-9+]{8,12}"/>  </td>
                    </tr>
                    <tr>
                        <td>암호 </td>
                    </tr>
                    <tr>
                        <td> <input type="password" name="password" placeholder="new passwd" id="passwd" pattern="[A-Za-z0-9+]{6,14}$" /> </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="등록" name="register" />
                            <input type="reset" value="초기화" name="reset" />
                        </td>
                    </tr>
                </table>

            </form>
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
