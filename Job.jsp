<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!

	public String[] jobs = {"전사", "도적", "사냥꾼", "마법사", "사제"};
	public ArrayList<String> party = new ArrayList<>();
	public ArrayList<Integer> img =new ArrayList<>();
	
	
	int randomNumber(){	
		Random r = new Random();
		return r.nextInt(5);
	}
%>

<%
	int a = randomNumber();
	int count = 0;
	
	party.add(jobs[a]);
	img.add(a);// 파티에 추가되는 이미지 넘버 저장
	
	for(String i: party){
		if(jobs[a].equals(i)){
			count++;
		}
	}
	
	
	if(party.size() > 10){
		party.clear();
		img.clear();
	}
	
	if(party.size() == 0){
		count = 0;
		party.add(jobs[a]);
		img.add(a);
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
	<p><img src ="C:\Users\utdhk\eclipse-workspace\BasicJSP\
	WebContent\Workspace\<%=a%>.png" width = "40px" height = "40px"/>당신에게 부여된 역활은 <b>[<%= jobs[a] %>]</b> 입니다.</p>
	
	<p>현재 파티에 당신과 같은 역활을 가진 플레이어는 <%=count %>명 입니다.</p>
	<div>현재 파티 구성:</div><br>
	
	<% for(int i: img) { %>
	<img src ="C:\Users\utdhk\eclipse-workspace\BasicJSP\
	WebContent\Workspace\<%=i%>.png" width = "20px" height = "20px"/>
	<%} %>
	<div>(<%=party.size()%>/10 명 참가 중 )</div>
	
	
</body>
</html>