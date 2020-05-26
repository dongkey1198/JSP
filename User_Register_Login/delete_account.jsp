<%@page import="user.UserRepository"%>
<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	User user  = (User) session.getAttribute("login_info");
	UserRepository.deleteUser(user.getAccount());
	session.invalidate();
	%>
	<script>
	alert("Your Account is successfully deleted!!!!");
	location.href = "login_page.jsp";
	</script>