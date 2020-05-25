<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <%if(session.getAttribute("user_id") != null) { %>
	 		<p>회원님은 이미 로그인 중입니다.</p>
	 		<a href = "session_login_welcome.jsp">메인페이지로 이동하기</a>
	<%} else { %>
	
	<form action="session_login_con.jsp" method = "post">
		<input type = "text" name = "id" size = "10" placeholder = "ID:"><br>
		<input type = "password" name = "pw" size = "11.5" placeholder = "PW:"><br>
		<input type = "text" name ="nick" size = "10" placeholder = "Nick Name:"><br>
		<input type = "submit" value ="로그인">
	</form>
	<%} %>
	
</body>
</html>