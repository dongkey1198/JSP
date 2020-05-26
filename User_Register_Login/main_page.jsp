<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

	<%
	User user = (User) session.getAttribute("login_info");
	%>
	
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%if(user != null) { %>
	
		<h1>Main Page</h1>
		<h2><%=user.getNick()%>(<%=user.getAccount()%>)</h2>
		<a href = "login_page.jsp">1.Move to Login Page</a><br>
		<a href = "logout.jsp">2.Logout</a><br>
		<a href = "delete_account.jsp">3.Delete Account</a><br>
		
	<%} else { 
		response.sendRedirect("login_page.jsp");
	} %>
	
	
</body>
</html>