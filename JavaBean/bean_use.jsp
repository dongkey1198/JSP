<%@page import="kr.co.jsp.user.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    	//UserBean user = (UserBean) request.getAttribute("user");
    %>
    
<jsp:useBean id="user" class="kr.co.jsp.user.UserBean" scope ="request"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%-- 아이디: <%=user.getId() %><br>
	비밀번호: <%=user.getPw() %><br>
	이름: <%=user.getName() %><br>
	이메일: <%=user.getEmail() %> --%>
	
	ID: <jsp:getProperty property="id" name="user"/><br>
	PW :<jsp:getProperty property="pw" name="user"/><br>
	NAME :<jsp:getProperty property="name" name="user"/><br>
	EMAIL :<jsp:getProperty property="email" name="user"/><br>
	

</body>
</html>