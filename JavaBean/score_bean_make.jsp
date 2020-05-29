<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
       
    <%--
    	액션태그를 사용하여 ScoreBean의 객체를 request범위로 생성하시고
    	setPRoperty로 사용하여 객체 내부에 파라미터 데이터를 셋팅한뒤
    	파라미터 데이터 3개와 총점, 평ㄱ슌을 구하여 총 5개
    	score_bean_user.jsp
     --%>
<jsp:useBean id="score" class="kr.co.jsp.score.ScoreBean" scope ="request"/>
<jsp:setProperty property="*" name="score"/>
<jsp:setProperty property="total" name="score" value ="<%= score.getEng() + score.getKor() 
																+ score.getMath() %>"/>
<jsp:setProperty property="average" name="score" value = "<%= score.getTotal()/3.0 %>"/>

<jsp:forward page="score_bean_user.jsp"/>