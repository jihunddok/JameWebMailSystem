<%-- 
    Document   : admin_menu.jsp
    Author     : jongmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cse.maven_webmail.model.UserAdminAgent"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html style="background-image:url('img/mail.PNG');">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>사용자 관리 메뉴</title>
        <link type="text/css" rel="stylesheet" href="css/materialize.css" />
    </head>
    <body>
        <jsp:include page="header.jsp" />

       
        
        <div id="main">
            <h2 class="white-text"> Admin menu</h2>
            <!-- 아래 코드는 위와 같이 Java Beans와 JSTL을 이용하는 코드로 바꾸어져야 함 -->
            <!-- cset, 함수 불러오기 및 구조 파악이 우선됨. -->
            <p class="white-text">Users</p>
            <%
                        String cwd =  this.getServletContext().getRealPath(".");
                        UserAdminAgent agent = new UserAdminAgent("localhost", 4555, cwd);
            %>
            <ul>
                <%
                            for (String userId : agent.getUserList()) {
                                out.println("<li class=\"white-text\">" + userId + "</li>");
                            }
                %>
            </ul>
        </div>
        <div id="sidebar">
            <jsp:include page="sidebar_admin_menu.jsp" />
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
