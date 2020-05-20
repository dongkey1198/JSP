<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
    <%
    
     Date date = new Date();
     SimpleDateFormat sdf = new SimpleDateFormat("yyyy년mm월dd일 E a mm분ss초");
     String dayInfo = sdf.format(date);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= date %><br>
	날짜정보: <%= dayInfo %>
</body>
</html>