<%@page import="kr.co.jsp.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    
    
    boolean flag = BoardDAO.getInstance().delete(Integer.parseInt(request.getParameter("bid")));
    
    
    if(flag) {
    	response.sendRedirect("list.jsp");
    }else {
    	response.sendRedirect("list.jsp");
    }
  	%>
    
