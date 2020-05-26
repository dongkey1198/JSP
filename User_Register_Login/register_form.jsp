<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>User Register Page</h1>
	<form action ="register_controller.jsp" method = "post">
		<input type ="text" name ="account" placeholder = "ID:"><br>
		<input type = "password" name = "password" placeholder = "PW:"><br>
		<input type = "text" name = "username" placeholder = "Name:"><br>
		<input type = "text" name = "nickname" placeholder = "Nick Name:"><br>
		<button type ="submit">Register</button>
	</form>
</body>
</html>