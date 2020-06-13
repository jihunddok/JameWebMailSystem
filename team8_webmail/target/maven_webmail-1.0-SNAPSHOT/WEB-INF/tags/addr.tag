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
    SELECT friend_nickname, friend_email FROM ${table} WHERE user_id="${owner}"
</sql:query>

<table id="dtBasicExample" class="tb table table-striped table-bordered table-sm center" cellspacing="0" >
    <thead>
        <tr>
            <th class="th-sm white-text" >이메일</th>
            <th class="th-sm white-text">별명</th>
            <th class="th-sm white-text"><a herf="">삭제</a></th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="row" items="${rs.rows}">
            <tr >
                <td class="th-sm white-text center">${row.friend_email}</td>
                <td class="th-sm white-text center">${row.friend_nickname}</td>
                <td class="th-sm white-text center">
                    <form action="DeleteFriend" method="POST" style="height: 50px;">
                        <input type="checkbox" name="friend_email" value="${row.friend_email}" checked="checked" style="visibility: false;">
                    <input class="btn-small transparent"  type="submit"  value="삭제" style="margin-bottom: 20%"/>
                    </form>
                </td>
     

    </tr>
</c:forEach>
</tbody>
</table>