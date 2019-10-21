<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.lang.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/questionpaper.css">
<title>Question Paper</title>
</head>
<body>
	<div class="a4">
		<p class="header">
			<b>VISHNU INSTITUTE OF TECHNOLOGY</b> <br />
		</p>
		<p style="float: left;margin-left:1cm;"><%=request.getParameter("subject")%></p>
		<p style="float: right;margin-right:1cm;"><%=request.getParameter("examdate")%></p>
		<br /> <br />
		<hr>
		<c:set var="questionno" scope="page" value="1"/>
		<c:forEach items="${requestScope.questions}" var="question">
			<p style="margin-left:1cm;">
				<c:out value="${question}"/>  
			</p>
			
			<c:choose>
			<c:when test="${questionno%2 != 0}">
				<p style="text-align:center;"> (or)</p>
			</c:when>
			<c:otherwise>
				<br/>
			</c:otherwise>
			</c:choose>
			<c:set var="questionno" scope="page" value="${questionno + 1}"/>
		</c:forEach>
	</div>
	<form> 
        <input type="button" value="Print" 
               onclick="window.print()" /> 
    </form> 
</body>
</html>