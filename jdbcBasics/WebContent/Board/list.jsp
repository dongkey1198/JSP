<%@page import="kr.co.jsp.board.model.Board"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.jsp.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    //boardDAO 클래스의 selectAll()호출 하여
    //DB에 들어있는 모든 글들을 리트로 리턴받으셔야 합니다.
    
    List<Board> articles = BoardDAO.getInstance().selectAll();
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<!-- DB에서 얻어온 글이 하나도 없을 때는 게시물이 존재하지 않습니다. 문자을 브라우저에 띄어주세요!! -->
	<%if(articles.size() == 0) { %>
	
		<h2>게시물이 존재하지 않습니다.</h2>
	
	<%} else { %>
	<table border = "1">
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>비고</th>
			</tr>
		</thead>
		<tbody>
		<% for(Board b : articles) { %>
			<tr>
				<td><%= b.getBoard_Id() %></td>
				<td><%= b.getWriter() %></td>
				<td>
				<a href = "content.jsp?b_Id=<%=b.getBoard_Id()%>"><%= b.getTitle() %></a>
				</td>
				<td>[삭제]</td>
			</tr>
		<%} %>
		</tbody>
		
	</table>
	<%} %>
	<br>
	<a href = "write.jsp">-새 게시글 작성하기-</a>

</body>
</html>