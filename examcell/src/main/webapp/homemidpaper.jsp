<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header1.jspf" %>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	function validate(){
		return true;
	}
</script>
<style type="text/css">
	h1,h2{
		text-align: center;
		color: #2b6baf;
	}

	body{
		background: url(images/home-banner.jpg);
  		background-repeat: no-repeat;
  		background-size: cover;

	}
	table{
		margin: auto;
	}
	button{
		background-color: red;
		color: white;
		width: 100%;
		height: 100%;
	}
</style>
<head>
	<title>Vishnu Institute of Technology</title>
</head>
<body>
	<%
		if(session.getAttribute("uname")==null)
			response.sendRedirect("login.jsp");
	%>
	<h1> Vishnu Institute of Technology </h1>
	<h2> Mid Question Paper </h2>
   	<form action="MidQuestionPaper" onsubmit="return validate()" method="post">
   		<table>
   			<tr>
   				<td>
   					Year:
   				</td>
   				<td>
   					<select name="year" required>
	   					<option value="I"> I </option>
	   					<option value="II"> II </option>
	   					<option value="III"> III </option>
	   					<option value="IV"> IV </option>
	   				</select>
   				</td>
   			</tr>
   			<tr>
   				<td>
   					Semester:
   				</td>
   				<td>
   					<select name="semester" required>
   						<option value="I"> I </option>
   						<option value="II"> II </option>
   					</select>
   				</td>
   			</tr>
   			<tr>
   				<td>
   					Mid:
   				</td>
   				<td>
   					<select name="mid" required>
   						<option value="I"> I </option>
   						<option value="II"> II </option>
   					</select>
   				</td>
   			</tr>
   			<tr>
   				<td>
   					Subject Code:
   				</td>
   				<td>
   					<input type="text" name="subject" required>
   				</td>
   			</tr>
   			<tr>
   				<td>
   					Branch:
   				</td>
   				<td>
   					<input type="checkbox" name="branch" value="CIVIL"> CIVIL<br>
   					<input type="checkbox" name="branch" value="EEE"> EEE<br>
   					<input type="checkbox" name="branch" value="ME"> ME<br>
   					<input type="checkbox" name="branch" value="ECE"> ECE<br>
   					<input type="checkbox" name="branch" value="CSE"> CSE<br>
					<input type="checkbox" name="branch" value="IT"> IT<br>
					<input type="checkbox" name="branch" value="MBA"> MBA<br>
					<input type="checkbox" name="branch" value="Common to all branches">Common to all Branches<br>
   				</td>
   			</tr>
   			<tr>
   				<td>
   					Date:
   				</td>
   				<td>
   					<input type="text" name="examdate" required>
   				</td>
   			</tr>
   			<tr>
   				<td>
   					Time:
   				</td>
   				<td>
   					<input type="text" name="examtime" required>
   				</td>
   			</tr>
   			<tr>
   				<td>
   					Seed Value:
   				</td>
   				<td>
   					<input type="number" name="seed" required>
   				</td>
   			</tr>
   			<tr>
   				<td colspan="2" align="center">
   					<button type="submit"> Generate Paper</button> 
   				</td>
   			</tr>
   		</table>
   	</form>
</body>
</html>