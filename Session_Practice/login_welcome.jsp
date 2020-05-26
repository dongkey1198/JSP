<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
   
    User user = (User) session.getAttribute("login");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(user != null ) { %>
	<p><%=user.getNickName()%>(<%=user.getAccount()%>)님 환영합니다.!!!</p>
	<a href = "login_form.jsp">로그인화면으로</a><br>
	<a href = "logout.jsp">로그아웃하기</a><br>
	<a href = "delete.jsp">회원탈퇴하기</a>
	<%} else { 
		response.sendRedirect("login_form.jsp");
	  }%>
</body>
</html>