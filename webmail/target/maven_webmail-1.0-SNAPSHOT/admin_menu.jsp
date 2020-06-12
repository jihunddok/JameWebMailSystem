<%-- 
    Document   : admin_menu.jsp
    Author     : jongmin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="cse.maven_webmail.model.UserAdminAgent" %>
<%@ page import="cse.maven_webmail.model.UserAgent" %>


<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>사용자 관리 메뉴</title>
        <link type="text/css" rel="stylesheet" href="css/main_style.css" />
    </head>
    <body>
        <%@include file="header.jspf"%>

        <div id="sidebar">
            <jsp:include page="sidebar_admin_menu.jsp" />
        </div>

        <div id="main">
            <h2> 메일 사용자 목록 </h2>
            <!-- 아래 코드는 위와 같이 Java Beans와 JSTL을 이용하는 코드로 바꾸어져야 함 -->
            
            <%
                        String cwd =  this.getServletContext().getRealPath(".");
            %>
            <jsp:useBean id="userAgent" scope="page" class="cse.maven_webmail.model.UserAgent" />
            <c:set target="${userAgent}" property="cwd" value="${cwd}" />
            
            <%-- <jsp:setProperty name="userAgent" property="cwd" value="<%= cwd %>"/> --%>
            <%--
            
            ${adminAgent.setServer("localhost")}
            ${adminAgent.setPort(4555)}
            --%>
            
            <ul>
                
                    
                <c:forEach var="userId" items="${userAgent.getUserList()}">
                    <li>
                        <c:out value="${userId}" />
                    </li>
                </c:forEach>
                    

                    
                <%--
                            for (String userId : agent.getUserList()) {
                                out.println("<li>" + userId + "</li>");
                            }
                --%>
            </ul>
        </div>

        <%@include file="footer.jspf"%>
    </body>
</html>
