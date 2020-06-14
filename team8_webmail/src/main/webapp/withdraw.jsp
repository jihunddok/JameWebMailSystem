<%-- 
    Document   : withdraw
    Created on : 2020. 6. 13., 오전 1:08:39
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
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/mdb.min.css" rel="stylesheet">
        <link href="css/addons/datatables.min.css" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css" />
        <title>With draw</title>
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
    <body  id="with_draw" style="background-image:url('img/mail.PNG'); background-repeat: no-repeat; background-size:cover">

        <%@include file="header.jspf"%>

        <jsp:include page="sidebar_previous_menu.jsp" />
        <div class="row left-align" style="margin-left:40%;margin-right: 10%;margin-top:5%">
            <div class="col s12 m6">
                <div class="card " style="background-color:rgb(54,52,52)">

                    <div class="card-content white-text">
                        <div class="container " id="withdraw_form">
                            <span class="card-title blue-grey-text text-lighten-2 ">WITH DRAW</span>
                            <div class="input-field white-text">
                                <form action="WithdrawHandler?menu=<%=CommandType.DELETE_USER_COMMAND%>" method="POST">

                                    <p >Input Confirm Text below.</p>
                                    <br>
                                    <%
                                        //세션에 현재 로그인된 사용자 정보
                                        String userid = (String) session.getAttribute("userid");
                                    %>
                                    
                                    <p id="confrim_text">asdf</p>
                                    <input type="checkbox" name="userid" value="<%= userid %>" checked="checked">
                                    <input class="white-text" type="text" placeholder="confrim_text"  id="input_confrim_text" oninput="is_confrimed()" required />
                                    <input class="btn-small indigo red-text bold" id="confirm_btn" type="submit" value="With draw Mail system" disabled style="margin-bottom: 20%" />


                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            document.getElementById('with_draw').onload = function () {
                set_randstring();
            }
            function set_randstring() {

                var chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz";
                var string_length = 15;
                var confrimtext = "";
                var conf_text = document.getElementById('confrim_text');

                for (var i = 0; i < string_length; i++) {
                    var rnum = Math.floor(Math.random() * chars.length);
                    confrimtext += chars.substring(rnum, rnum + 1);
                    console.log(confrimtext);
                }
                conf_text.innerText = confrimtext;


            }
        </script>
        <script>

            function is_confrimed() {
                const confirm_text = document.getElementById('confrim_text').innerText;
                const input_text = document.getElementById('input_confrim_text').value;

                if (confirm_text == input_text) {
                    document.getElementById('confirm_btn').disabled = false;
                    console.log("true");
                } else {
                    document.getElementById('confirm_btn').disabled = true;
                    console.log("false");
                }

            }


        </script>

        <%@include file="footer.jspf"%>

    </body>


    <script>


    </script>

    <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script type="text/javasciprt" src="js/jquery.min.js"></script>
    <script type="text/javasciprt" src="js/popper.min.js"></script>
    <script type="text/javasciprt" src="js/bootstrap.min.js"></script>
    <script type="text/javasciprt" src="js/mdb.min.js"></script>
    <script type="text/javascript" src="js/addons/datatables.min.js"></script>

</html>
