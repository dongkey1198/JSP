<%@page import="user.User"%>
<%@page import="user.UserRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("account");
	String pw = request.getParameter("password");
	
	User user = UserRepository.getUser(id);
	
	if(user != null){
		if(user.getPassword().equals(pw)){
			session.setAttribute("login_info", user);
			response.sendRedirect("main_page.jsp");	
		}else {%> 
			<script>
				alert("Account and Password does not match!!!");
				history.back();
			</script>
			<%}%>
			
	<% } else {%>
		<script>
		alert("This Account does not exist!!!");
		location.href = "login_page.jsp"
		</script>
	<%} %>
	


