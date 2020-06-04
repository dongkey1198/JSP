<%@page import="kr.co.jsp.board.model.Board"%>
<%@page import="kr.co.jsp.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    Board article = BoardDAO.getInstance().selectOne(Integer.parseInt(request.getParameter("b_Id")));
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1><%=article.getBoard_Id() %>번 게시물 내용</h1>
		<p>
		# 글 번호: <%=article.getBoard_Id() %><br>
		# 작 성자: <%=article.getWriter() %><br>
		# 제목: <%=article.getTitle() %><br>
		# 내용: <br> <textarea rows="5"><%=article.getContent() %></textarea><br>
		# 작성일: <%=article.getCreateAt() %>
		
		</p>
		<a href = "list.jsp">글 목록보기</a>
		<a href = "modify.jsp">글 수정하기</a>
</body>
</html>