<%@page import="java.util.Random"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%!
    List<String> party = new ArrayList<>();
    List<Integer> jobNumber = new ArrayList<>();
    
    int randomNumber(){	
		Random r = new Random();
		return r.nextInt(5);
	}
    
    %>
    <%
    String[] jobs = {"전사", "도적", "사냥꾼", "마법사", "사제"};
    
    // 직업 갯수만크의 정수 난수를 발생.
    int r = randomNumber();
    String job = jobs[r];
    party.add(job);
    jobNumber.add(r);
    
    //현재 선택된 직업이 몇개 존재하는지 확인하는 변수
    int cnt = 0;
    
    for(String i : party){
    	if(job.equals(i)){
    		cnt++;
    	}
    }
    
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h2>당신의 역할</h2>
	<p>
		<img src = "img/<%=r %>.png" width = "40px" height ="40px"></img>
		당신에게 부여된 역활은 <strong><%=job %></strong>입니다. <br>
		현재 파티에 당신과 같은 역할을 가진 플레이어느 <%=cnt %>명 입니다.
	</p>
	<p>
	<% for(int idx : jobNumber) { %>
		<img src = "img/<%=idx%>.png" width = "20px" height ="20px"/>
	<% } %>
		(<%=party.size() %>명 참가중)
	</p>
	
	
	<%
	if(party.size() == 10){
		party.clear();
		jobNumber.clear();
	}
	%>
	
	
</body>
</html>