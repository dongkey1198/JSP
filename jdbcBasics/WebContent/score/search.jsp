<%@page import="kr.co.jsp.scores.model.ScoreDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    	String keyword = "%"+request.getParameter("keyword")+"%";
   		ScoreDAO dao = ScoreDAO.getInstance();
    		/*
    		DAO의 서치메서드를 완성해서, 메서드 호출 후검색 결과를 리스트로 받아서
    		바디태그 내부에 검색 결과를 테블형식으로 출력
    		
    		*/
    %>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>