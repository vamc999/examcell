<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<style>
div.questionpaper {
	width: 210mm;
	margin: auto;
}
div.metaquestionpaper{
	width: 210mm;
	margin: auto;
	page-break-before: always;
}

table {
	width: 210mm;
}

td {
	text-align: center;
}

th {
	text-align: center;
}

img.logo{
	position: absolute;
	float: left;
	width: 3cm;
	height: 3cm;
}

img{
	display:block;
	margin-left:auto; 
	margin-right:auto; 
	height:300; 
	width:400
}
</style>

</head>
<body>
	<div class="questionpaper">
		<img src="images/logo.png" class="logo">
		<table>
			<tr>
				<th colspan="2">VISHNU INSTITUTE OF TECHNOLOGY</th>
			</tr>
			<tr>
				<td colspan="2">(AUTONOMOUS)</td>
			</tr>
			<tr>
				<td colspan="2">VISHNUPUR : BHIMAVARAM</td>
			</tr>
			<tr>
				<td colspan="2">MID - <%=request.getParameter("mid")%>
					Examinations
				</td>
			</tr>
			<tr>
				<td colspan="2"> <%=request.getParameter("subject")%> :: <c:out value="${requestScope.subjectname}"/></td>
			</tr>
			<tr>
				<td style="text-align: left;">Branch: <c:out
						value="${branches}" /></td>
				<td style="text-align: right;">Date: <%=request.getParameter("examdate")%></td>
			</tr>
			<tr>
				<td style="text-align: left;">Year/Sem: <%=request.getParameter("year")%>
					& <%=request.getParameter("semester")%>
				</td>
				<td style="text-align: right;">Time: <%=request.getParameter("examtime")%></td>
			</tr>
			<tr>
				<td colspan="2" style="border-bottom: 2px solid black;"></td>
			</tr>
			<tr>
				<td style="text-align: left;"><i>Answer all of the
						following Each carries 10 marks.</i></td>
				<td style="text-align: right;">Max. Marks : 30</td>
			</tr>
		</table>
		
		<table>
			<c:set var="questionno" scope="page" value="1" />
			<c:forEach items="${requestScope.questions}" var="question">
				<tr>
					<td style="text-align: left;vertical-align:top;"> <c:out value="(${questionno})" escapeXml="false"/> </td>
					<td style="text-align: left;"> <c:out value="${question.question}" escapeXml="false"/></td>
				</tr>
				<c:choose>
					<c:when test="${questionno%2 != 0}">
						<tr>
							<td colspan="3" style="text-align: center;"> (or) </td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr><td><br/></td></tr>
					</c:otherwise>
				</c:choose>
				<c:set var="questionno" scope="page" value="${questionno + 1}" />
			</c:forEach>
		</table>
	</div>
	<div class="metaquestionpaper">
		<img src="images/logo.png" class="logo">
		<table>
			<tr>
				<th colspan="3">VISHNU INSTITUTE OF TECHNOLOGY</th>
			</tr>
			<tr>
				<td colspan="3">(AUTONOMOUS)</td>
			</tr>
			<tr>
				<td colspan="3">VISHNUPUR : BHIMAVARAM</td>
			</tr>
			<tr>
				<td colspan="3">MID - <%=request.getParameter("mid")%>
					Examinations
				</td>
			</tr>
			<tr>
				<td colspan="3"><%=request.getParameter("subject")%> :: <c:out value="${requestScope.subjectname}"/></td>
			</tr>
			<tr>
				<td style="text-align: left;">Branch: <c:out
						value="${branches}" /></td>
				<td colspan="2" style="text-align: right;">Date: <%=request.getParameter("examdate")%></td>
			</tr>
			<tr>
				<td style="text-align: left;">Year/Sem: <%=request.getParameter("year")%>
					& <%=request.getParameter("semester")%>
				</td>
				<td colspan="2" style="text-align: right;">Time: <%=request.getParameter("examtime")%></td>
			</tr>
			<tr>
				<td colspan="3" style="border-bottom: 2px solid black;"></td>
			</tr>
			<tr> <td style="text-align: left;"><b>Question Paper Generaed by: </b><c:out value="${user}" /></td> 
				 <td><b>SEED VALUE:</b> <%= request.getParameter("seed")%> </td>
				 <td style="text-align: right;"><b>Time: </b><%= (new java.util.Date()).toLocaleString()%></td>
			</tr>
			<tr>
				<td colspan="3" style="border-bottom: 2px solid black;"></td>
			</tr>
			<tr>
				<td style="text-align: left;"><b>SELECTED QUESIONS: </b>
					<c:forEach items="${requestScope.questions}" var="question">
					  <c:out value="${question.qno}, "/>
					</c:forEach>
				</td> 
			</tr>
		</table>
		<table>
			<c:forEach items="${requestScope.allquestions}" var="question">
				<tr>
					<td style="text-align: left;vertical-align:top;"> <c:out value="(${question.qno})" escapeXml="false"/> </td>
					<td style="text-align: left;"> <c:out value="${question.question}" escapeXml="false"/> </td>
				</tr>
			</c:forEach>
		</table>
	</div>

</body>
</html>