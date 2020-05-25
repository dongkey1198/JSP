<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    response.setCharacterEncoding("utf-8");
    
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String check = request.getParameter("id_remember");
    
    if(id.equals("abc") && pw.equals("123")){
    	Cookie idCookie = new Cookie("id_cookie", id);
    	idCookie.setMaxAge(5);
    	response.addCookie(idCookie);
    	
    	if(check != null){
    		Cookie idCheck = new Cookie("id_remember", id);
    		idCheck.setMaxAge(10);
    		response.addCookie(idCheck);
    	}
    	response.sendRedirect("cookie_login_welcome.jsp");
    	
    }else{
    	response.sendRedirect("login_form.jsp");
    }
    
    %>
