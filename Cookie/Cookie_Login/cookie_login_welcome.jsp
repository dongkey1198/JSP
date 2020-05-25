<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    Cookie[] cookies = request.getCookies();
    String userID = null;
    
    for(Cookie e: cookies){
    	if(e.getName().equals("id_cookie")){
    	 	userID = e.getValue();	
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
	<% if(userID != null) { %>
		<p>
			로그인성공!!! <br>
			<%=userID %>님 환영합니다.<br>
			<a href = "login_form.jsp">로그인 화면으로 돌아가기</a> 
		</p>
		<%} else {%>
			<p>제한시간이 지나 자동 로그아웃 처리되었습니다.</p>
			<a href = "login_form.jsp">다시 로그인하기</a> 
				<%} %>
	</div>
</body>
</html>