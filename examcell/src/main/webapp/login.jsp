<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function validate() {
		return true;
	}
</script>
<link rel="stylesheet" type="text/css" href="login.css">
<title>Login</title>
</head>
<body>
	<h1> Vishnu Institute of Technology </h1>
	<h2> WELCOME TO EXAMCELL </h2>
	<%
		String loginFail = (String) request.getAttribute("loginFail");
	%>
	<div class="center">
		<form action="LoginServlet"  onsubmit="return validate()" name="login" method="post">
			<table>
				<tr>
					<td> <h2> LOGIN </h2> </td>
				</tr>
				<tr>
					<td> <input type="text" name="username" placeholder="  USER NAME"  required> </td>
				</tr>
				<tr>
					<td> <input  type="password" name="password" placeholder="  PASSWORD" required> </td>
				</tr>
				<tr>
					<td> <button type="submit"><b>LOGIN</b></button> </td>
				</tr>
			</table> 
		</form>
		
		<div align="center" style="color: red; font-size: 20px; font-family: Oswald;">
			<%
				if (loginFail != null) {
			%>
			<%=loginFail%>
			<script type="text/javascript">
				document.forms["login"]["username"].placeholder = "  USER NAME";
				document.forms["login"]["password"].placeholder = "  PASSWORD";
			</script>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>