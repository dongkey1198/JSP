<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%
	response.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String nick = request.getParameter("nick");
	
	if(id.equals("abc") && pw.equals("123")){
		
		session.setAttribute("user_id", id);
		session.setAttribute("user_pw", pw);
		session.setAttribute("user_nick", nick);
		
		session.setMaxInactiveInterval(4);
		response.sendRedirect("session_login_welcome.jsp");
	} else { %>
		
	<script>
		alert("로그인 실패!!!")
		history.back();
	</script>
	<%} %>
		
	
	
	
	