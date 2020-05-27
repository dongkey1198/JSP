<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%
	//사용자가 입력한 인증번호 가지고 오기
	String code = request.getParameter("code");
	
	if(session.getAttribute("auth_code").equals(code)){
		
		session.setAttribute("auth_pass", true);
		response.sendRedirect("concert_reserve.jsp");
		
	} else { %>
	
		<script>
			alert("인증코드가 일치하지 않습니다.");
			location.href = "concert_auth.jsp";
		</script>
		
	<% } %>