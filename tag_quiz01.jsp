<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%!
 
 int randomNumber(){
	 Random r = new Random();
	 return r.nextInt(45) + 1 ;
 }
 
 %>
 
 <%
 	ArrayList<Integer> arr = new ArrayList<>();
 	

 	while(true){
 		int a = randomNumber();
 		
 		if(arr.contains(a)){
 			continue;
 		}
 		else if(arr.size() == 6){
 			break;
 		}
 		else{
 			arr.add(a);
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

	<h2>오늘의 로또번호!!!!</h2>
	<h2><%= arr %></h2>
	
	
</body>
</html>