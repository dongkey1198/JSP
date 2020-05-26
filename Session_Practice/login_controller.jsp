<%@page import="java.util.ArrayList"%>
<%@page import="user.UserRepository"%>
<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("utf-8");
    
    //입력된 회원 정보 가져오기
    String id = request.getParameter("account");
	String pw = request.getParameter("password");
    
	//로그인 시도하는 회원 정보확인
    User userInfo = UserRepository.getUser(id);
    
    if(userInfo != null){
    	if(pw.equals(userInfo.getPassword())){
    		session.setAttribute("login", userInfo);
    		response.sendRedirect("login_welcome.jsp"); 
    		
    	}else { %>
    		<script>
	 			alert("비밀번호가 틀렸습니다..");
	 			history.back();
	 		</script>
    	<% }%>

    <%}else{ %>
    	<script>
	 		alert("존재하지 않는 아이디입니다.");
	 		location.href="login_form.jsp";
	 	</script>
   <%}%> 
   
   
