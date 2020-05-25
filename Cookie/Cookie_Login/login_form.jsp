<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    Cookie[] cookies = request.getCookies();
    
    boolean flag = false;
    String userID = "";
	
    if(cookies != null){
    	for(Cookie e : cookies){
    		if(e.getName().equals("id_cookie")){
    			flag = true;
    			break;
    		}
    		if(e.getName().equals("id_remember")){
    			userID = e.getValue();
    		}
    	}
    }
    
   
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<p>
		<h3>-Cookie Login-</h3>
			<% if(!flag) { %>
				<form action = "cookie_login_con.jsp" method = "post">
					<input type = "text" name = "id" size = "10" placeholder = "ID:" value ="<%=userID%>"><br>
					<input type = "password" name = "pw" size = "11.5" placeholder = "PW:"><br>
					<input type = "submit" value = "로그인"><br>
					<input type = "checkbox" name = "id_remember" value = "yes"><small>아이디 저장</small>
					
					
				
				</form>
			<% } else {  %>
					<h2>이미 로그인한 사용자입니다.<h2>
					<a href = "cookie_login_welcome.jsp">Welcome Page로 이동하기</a>
			<%} %>
		</p>
	</div>
</body>
</html>