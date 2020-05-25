<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    response.setCharacterEncoding("utf-8");
    if(session.getAttribute("user_id") == null){
    	out.print("로그인한 사용자만 이용할수있는  페이지 입니다!!!");
    	response.sendRedirect("session_login.jsp");
    }
    
    String userID = (String) session.getAttribute("user_id");
    String userNick = (String) session.getAttribute("user_nick");
    

    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>
		<%=(String)userNick%>(<%=userID%>)님 성공적으로 로그인 하셨습니다!!!!!<br>
		<a href = "session_login.jsp">1. 로그인 화면으로 돌아가기</a><br>
		<a href = "..\..\req_album.jsp">2. 앨범리스트 보기</a><br>
		<a href = "session_logout.jsp">3.로그아웃</a>
	</p>
</body>
</html>