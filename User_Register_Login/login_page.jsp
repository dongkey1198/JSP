<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(session.getAttribute("login_info") != null) { %>
		<h2>You are already logged on this web page!!!</h2>
		<a href ="main_page.jsp">Move to Main Page</a>
		<%} else { %>
			<form action="login_con.jsp" method ="post">
			<input type ="text" name="account" placeholder="ID:"><br>
			<input type ="password" name = "password" placeholder = "PW:"><br>
			<input type = "submit" value ="Login">
			<button type ="button" onclick ="location.href = 'register_form.jsp'">Register</button>
			</form>
			<%} %>
</body>
</html>