<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    	String option = request.getParameter("option");
    
    	if(option.equals("wk")){
    		response.sendRedirect("TheWeeknd.jsp");
    		
    	}else if(option.equals("em")){
    		response.sendRedirect("Eminem.jsp");
    	}
    	
    %>
    
    
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<% if(option.equals("wk")) { %>
			<div align = center>
			<h2>선택하신 앨범 정보</h2>
			<p>
				당신이 선택하신 앨범은 The Weeknd의 "Starboy"입니다.
			</p>
			<hr>
			<h3>타이틀 곡 뮤직 비디오</h3>
			<iframe width="800" height="600" src="https://www.youtube.com/embed/34Na4j8AVgA?autoplay=1" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</div>
		<%}else if(option.equals("em")) { %>
		
			<div align = center>
			<h2>선택하신 앨범 정보</h2>
			<p>
				당신이 선택하신 앨범은 The Eminem의 "Godzilla"입니다.
			</p>
			<hr>
			<h3>타이틀 곡 뮤직 비디오</h3>
			<iframe width="800" height="600" src="https://www.youtube.com/embed/r_0JjYUe5jo?autoplay=1" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</div>
		
		<% } %>
</body>
</html> --%>