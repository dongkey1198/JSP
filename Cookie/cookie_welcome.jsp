<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	Cookie[] cookies =request.getCookies();
    	
    	String userID = null;
    	
    	for(Cookie c: cookies){
    		if(c.getName().equals("id_cookie")){
    			userID = c.getValue();
    			break;
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

	<%if(userID != null) {%>

		<%=userID%>님 환영합니다.!!!!
		<p>
			<a href = "cookie_login.jsp"> 로그인 화면으로 돌아가기</a>
		</p>
	<%} else {%>
		<p>
		시간이 지나 자동 로그아웃 처리되었습니다.<br>
		<a href = "cookie_login.jsp">다시 로그인하기!!</a>
		</p>
	<%} %>
	

</body>
</html>