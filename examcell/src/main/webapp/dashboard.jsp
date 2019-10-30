<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="header1.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		if(session.getAttribute("uname")==null)
			response.sendRedirect("login.jsp");
	%>
	<br>
	<br>
	<br>
	<br>
	<h1>Dash Board Under Construction coming soon.....</h1>
</body>
</html>