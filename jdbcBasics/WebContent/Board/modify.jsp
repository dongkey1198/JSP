<%@page import="kr.co.jsp.board.model.Board"%>
<%@page import="kr.co.jsp.board.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    
    int id = Integer.parseInt(request.getParameter("bid"));
    Board article =BoardDAO.getInstance().selectOne(id);
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h1><%=article.getBoard_Id() %>번 게시물 내용 수정</h1>
		
		<form action="modify_con.jsp" method = "post">
		<!-- 히든 타입은 브라우저에 input창을 노출하지 않고
			데이터를 전송할때 사용하는 타입이다. -->
			<input type = "hidden" name ="bId" value ="<%=article.getBoard_Id()%>">
			<p>
				#글 번호: <%=article.getBoard_Id()%> <br>
				#작성자: <input type = "text" name ="writer" value ="<%=article.getWriter()%>"><br>
				#제목: <input type = "text" name ="title" value ="<%=article.getTitle()%>"><br>
				#내용: <br>
				<textarea rows="5" name = "content"><%=article.getContent()%></textarea><br>
				<input type = "submit" value ="수정">
			</p>
		
		</form>
		<br>
		<a href = "list.jsp">목록으로 돌아가기</a>
</body>
</html>