<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    	int age = Integer.parseInt(request.getParameter("age"));
    	
    	if(age >= 20) {
    		
    		//response 객체가 제공하는 sendRedirect()메서드 매개값으로
    		//이동시킬 URL 주소를 적으면 해당 페잊로 강제 이동하게 됩니다.
    		response.sendRedirect("res_basic_ok.jsp");
    		
    	} else {
    		
    		response.sendRedirect("res_basic_no.jsp");
    	}
    
    %>
    
    
    
    
