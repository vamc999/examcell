<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<!-- mathjx script -->
	<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
	<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>
	<script type="text/javascript" src="js/jspdf.min.js"></script>
	<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
        function genPDF(){
        	<%String str = request.getParameter("subject");%>
            var filename = "<%=str%>".concat('.pdf');
            var doc = new jsPDF();
            doc.fromHTML($('#printarea').get(0));
            doc.save(filename);
        }
    </script>
    <script>
        $(".navbar-nav li a").click(function(){
        	$('.navbar-nav').find(".active").removeClass("active");
        	$(this).parent().addClass("active");
        });
	 	
	</script>
	<style>
		.bg-primary {
		    background-color: #2B6BAF!important;
		    position: fixed;
		    overflow: hidden;
		    z-index: 1;
		    width:100%;	
		}
		.btn{
			margin-left:2px;
			margin-right:2px;
		}
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
			width: 2cm;
			height: 2cm;
		}
		img.left{
			display: inline;
			
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
		<%
			if(session.getAttribute("uname")==null)
				response.sendRedirect("login.jsp");
		%>
	<nav class="navbar navbar-expand-lg  navbar-dark bg-primary">
		  <a class="navbar-brand" href="dashboard">Home</a>
		  <div class="collapse navbar-collapse" id="navbarTogglerDemo03">
		    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
		      <li class="nav-item">
		        <a class="nav-link" href="homemidpaper.jsp">Mid Question Paper</span></a>
		      </li>
		      <li class="nav-item">
		        <a class="nav-link" href="#">External Question Paper</a>
		      </li>
		    </ul>
<!-- 		      <button class="btn  btn-outline-success my-2 my-sm-0" >Print</button> -->
<!-- 		      <button class="btn  btn-outline-success my-2 my-sm-0" onclick="genPDF()">Download</button> -->
			<form class="form-inline my-2 my-lg-0" action="Logout" method="post" >
      			<button class="btn  btn-outline-success my-2 my-sm-0" type="submit">Logout</button>
    		</form>		  
    	</div>
	</nav>
		<br>
		<br>
		<br>
	<div id="printarea" class="printquestionpaper">
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
					<td style="text-align: left;">Year/Sem: <%=request.getParameter("year")%> B.Tech
						 <%=request.getParameter("semester")%> Sem
					</td>
					<td style="text-align: right;">Time: <%=request.getParameter("examtime")%></td>
				</tr>
				<tr>
					<td colspan="2" style="border-bottom: 2px solid black;"></td>
				</tr>
				<tr>
					<td style="text-align: left;"><i></i></td>
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
					<td style="text-align: left;">Year/Sem: <%=request.getParameter("year")%> B.Tech
						 <%=request.getParameter("semester")%> Sem
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
	</div>
</body>
</html>