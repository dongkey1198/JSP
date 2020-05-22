<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
			- 이 페이지는 form 에서 넘어온 아이디와 비밀번호값을 받아서 처리하는 페이지입니다.
			- 아이디가 "abc1234" 비밀번호 "aaa1111"이라고 가정 합시다.
			
			- 아이디가 일치하지 않는 경우 "res_id_fail.jsp" 
			-"존재하지 않는 회원입니다." 를 출력하고 다시 로그인 폼으로 돌갈수있는 링크제공
			
			-아이디가 일치할 경우, 비밀번호도 확인해서 비밀번호가 틀렷을 경우
			"res-pw_fail.jsp" "비밀번호가 틀렸습니다."
			
			-아이디, 비밀번호가 모두 일치하는 경우 "res_welcome.jsp"
			"회원님" 반갑습니다.
--%>    

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if(id.equals("abc1234")&&pw.equals("aaa1111")){
		response.sendRedirect("res_welcome.jsp");
		
	}else if(!id.equals("abc1234")){
		response.sendRedirect("res_id_fail.jsp");
		
	}else if(id.equals("abc1234") && !pw.equals("aaa1111")){
		response.sendRedirect("res-pw_fail.jsp");
	}
	
	/*
	if(id.equals("abc1234")){
		if(pw.equals("aaa1111")){
			response.sendRedirect("res_welcome.jsp");
		}else{
			response.sendRedirect("res-pw_fail.jsp");
		}
	}else{
		response.sendRedirect("res_id_fail.jsp");
	}
	
	*/
%>


