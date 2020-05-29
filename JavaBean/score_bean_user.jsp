<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="score" class="kr.co.jsp.score.ScoreBean" scope ="request"/> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	#국어: <jsp:getProperty property="kor" name="score"/>점<br>
	#영어: <jsp:getProperty property="eng" name="score"/>점<br>
	#수학: <jsp:getProperty property="math" name="score"/>점<br>
	<hr>
	#총점: <jsp:getProperty property="total" name="score"/>점<br>
	#평균: <jsp:getProperty property="average" name="score"/>점
</body>
</html>