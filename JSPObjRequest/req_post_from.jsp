<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

		<%--
		- 전송 방식을 post로 사용하기 위해서는 반드시 from 태그가 필요하다.
		form 태그의 
 		--%>
	<form action = "req_post_take.jsp" method="post">
		- 아이디: <input type="text" name = "id" size= "10"/> <br>
		- 비밀번호: <input type="password" name = "pw" size= "10"/> <br>
		- 이름: <input type="text" name = "name" size= "10"/> <br>
		<input type = "submit" value="확인"/>
	</form>
</body>
</html>