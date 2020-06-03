<%@page import="kr.co.jsp.scores.model.ScoreDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    /*
    	파라미터 데이터 얻어온 후에 DAO에게 삭제 요청
    	주소값을 받아서 메서드를 호출.
    	public boolean delete()
    	
    	삭제가 완료되면 Score_list.jsp로 이동
    	삭제 실패시 Score_list.jsp
    	삭제가 성공실패는 스크립트 테그 사용
    	
    */
    	
    	
		ScoreDAO dao = ScoreDAO.getInstance();
		boolean flag = dao.delete(Integer.parseInt(request.getParameter("id")));
		
		if(flag){ %>
				<script>
				alter("삭제 성공!!!")
				location.href = "score_list.jsp";
				</script>
		<%} else  {%>
				<script>
				alter("삭제 실패!!!")
				location.href = "score_list.jsp";
				</script>
			<%} %>
