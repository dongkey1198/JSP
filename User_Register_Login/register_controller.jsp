<%@page import="user.UserRepository"%>
<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	request.setCharacterEncoding("utf-8");
	
	User user = new User(
			request.getParameter("account"),
			request.getParameter("password"),
			request.getParameter("username"),
			request.getParameter("nickname"));
	 
	UserRepository.save(user);
	UserRepository.showUser();
	response.sendRedirect("register_result.jsp");
	
	%>