<%@page import="kr.co.jsp.scores.model.Scores"%>
<%@page import="java.util.List"%>
<%@page import="kr.co.jsp.scores.model.ScoreDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    	String keyword = "%"+request.getParameter("keyword")+"%";
   		
   		
   		List<Scores> searchList = ScoreDAO.getInstance().search(keyword); 
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
		<%if(searchList.size() > 0) { %>
		<table border ="1">
			<thead>
				<th>이름</th>
				<th>국어</th>
				<th>영어</th>
				<th>수학</th>
				<th>총점</th>
				<th>평균</th>
				<th>비고</th>
			</thead>
			<tbody>
			<%for(Scores s : searchList) {%>
				<tr>
					<td><%=s.getName()%></td>
					<td><%=s.getKor()%></td>
					<td><%=s.getEng()%></td>
					<td><%=s.getMath()%></td>
					<td><%=s.getTotal()%></td>
					<td><%=s.getAverage()%></td>
					<td>
						<a class="del-btn" href = "delete.jsp?id=<%=s.getId()%>">삭제</a>
					</td>
				</tr>
				<%} %>
			</tbody>
		</table>
		<%} else {%>
		<h2>검색 결과가 없습니다.</h2>
		<%} %>
		<a href = "insert_form.jsp">다른 점수 등록하기</a>
		<a href = "score_list.jsp">목록으로 돌아가기</a>

</body>
</html>