<%-- 
    Document   : delete_user.jsp
    Author     : jongmin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="cse.maven_webmail.control.CommandType" %>
<%@page import="cse.maven_webmail.model.UserAdminAgent" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<script type="text/javascript">
    <!--
    function getConfirmResult() {
        var result = confirm("사용자를 정말로 삭제하시겠습니까?");
        return result;
    }
-->
</script>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>사용자 제거 화면</title>
        <link type="text/css" rel="stylesheet" href="css/main_style.css" />
    </head>
    <body>

    <div id="main">
        <h2> 삭제할 사용자를 선택해 주세요. </h2> <br>

        <!-- 아래 코드는 위와 같이 Java Beans와 JSTL을 이용하는 코드로 바꾸어져야 함 -->
        <%
            String cwd = this.getServletContext().getRealPath(".");
        %>
        <jsp:useBean id="userAgent" scope="page" class="cse.maven_webmail.model.UserAgent" />
        <c:set target="${userAgent}" property="cwd" value="<%= cwd %>" />

        <form name="DeleteUser" action="UserAdmin.do?menu=<%=CommandType.DELETE_USER_COMMAND%>"
              method="POST">

            
            <c:forEach var="userId" items="${userAgent.getUserList()}">
                <input type=checkbox name="selectedUsers" value="${userId}" />
                <c:out value="${userId}" /> <br/>
            </c:forEach>
            <%--
                for (String userId : agent.getUserList()) {
                    out.print("<input type=checkbox name=\"selectedUsers\" value=\"" + userId + "\" />");
                    out.println(userId + " <br>");
                }
                out.println("abc" + "<br>");
            --%>
            <br>
            <input type="submit" value="제거" name="delete_command" onClick ="return getConfirmResult()"/>
            <input type="reset" value="선택 전부 취소" />
        </form>
    </div>

</body>
</html>
