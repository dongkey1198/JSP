<%@page import="user.UserRepository"%>
<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
    <%
    	request.setCharacterEncoding("utf-8");
    	
    
    	/* String id = request.getParameter("account");
    	String pw = request.getParameter("password");
    	String name = request.getParameter("name");
    	String nick = request.getParameter("nickName");
    	
    	User user = new User(id, pw, name, nick); */
    	
    	User user = new User(
    			request.getParameter("account"),
    			request.getParameter("password"),
    			request.getParameter("name"),
    			request.getParameter("nickName")
    			);
    	
    	UserRepository.save(user);
    	UserRepository.showUsers();
    	
    	response.sendRedirect("register_result.jsp");
    	
    	
    %>
