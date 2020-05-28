<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%--
    	JSP action tag 사용법
    	<jsp:forward 속성=값, 속성=값 ......></jsp:forward>
    	-닫는 태그는 태그 내부에 추가적으로 종속되어있는 태그나 텍스트가 없다면
    	닫는 태그를 생략하고 열린 태그의 끝부분에 />로 마감할수 있습니다.
     --%>
     
	<jsp:forward page="forward_ex02.jsp"/>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h3>여기는 forward_ex01페이지입니다.</h3>
		<p>그런데 포워드 기능 때문에 아마 이 메세지를 못 보실거에요~</p>
</body>
</html>