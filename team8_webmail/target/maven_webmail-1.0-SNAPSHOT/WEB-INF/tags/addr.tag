<%-- 
    Document   : addr
    Created on : 2020. 6. 3., 오후 9:50:19
    Author     : jihun
--%>

<%@tag description="put the tag description here" pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="user" required="true" %>
<%@attribute name="password" required="true" %>
<%@attribute name="schema" required="true" %>
<%@attribute name="table" required="true" %>
<%@attribute name="owner" required="true" %>

<%-- any content can be specified here e.g.: --%>
<sql:setDataSource var="dataSrc"
                   url="jdbc:mysql://localhost:3306/${schema}?serverTimezone=Asia/Seoul"
                   driver="com.mysql.cj.jdbc.Driver"
                   user="${user}" password="${password}" />

<sql:query var="rs" dataSource="${dataSrc}">
    SELECT user_nickname, user_email FROM ${table} WHERE user_id="${owner}"
</sql:query>

<table border="1">
    <thead>
        <tr>
            <th>이메일</th>
            <th>별명</th>
            <th><a herf="">삭제</a></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="row" items="${rs.rows}">
            <tr>
                <td>${row.user_email}</td>
                <td>${row.user_nickname}</td>
                <%--
                <td>${row.phone}</td>
                --%>
                <td>삭제</td>
            </tr>
        </c:forEach>
    </tbody>
</table>