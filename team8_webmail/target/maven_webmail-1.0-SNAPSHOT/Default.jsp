<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body style="background-image:url('img/mail.PNG'); background-repeat: no-repeat; background-size:cover">
<%
	String id = request.getParameter("txtuserid");
	String pw = request.getParameter("txtpassword");
	
	/* out.println(id);
	out.println(pw);
	 */
%>

<%=id %>
<%=pw %>


</body>
</html>