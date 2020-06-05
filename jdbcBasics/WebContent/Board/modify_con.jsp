<%@page import="javax.websocket.SendResult"%>
<%@page import="kr.co.jsp.board.model.BoardDAO"%>
<%@page import="kr.co.jsp.board.model.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("utf-8");
    /*
    	수정에 필요한 파라미터값을 불러와서 그것을 토대로
    	board 객체를 생성하세요
    	
    	BoardDAO의 update()를 이용하여 수정한 객체를 DB에 적용시켜 주시고, 결과가 성공이라면
    	해당글 상세보기 페이지로 이동시켜주세요
    	결과가 실패라면list.jsp로 리다이렉팅
    */
    	
    	
    	int id = Integer.parseInt(request.getParameter("bId"));
    	String writer = request.getParameter("writer");
    	String title = request.getParameter("title");
    	String content = request.getParameter("content");
    	
    	Board article = new Board();
    	article.setBoard_Id(id);
    	article.setWriter(writer);
    	article.setTitle(title);
    	article.setContent(content);
    	
    	Boolean flag = BoardDAO.getInstance().update(article);
    	
    	if(flag) {
    		response.sendRedirect("content.jsp?b_Id="+article.getBoard_Id());
    	}else{
    		response.sendRedirect("list.jsp");
    	}
    
    %>
