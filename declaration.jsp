<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
	public int i;
	public String name;
	
	
	public int add(int n1, int n2){
		return n1 + n2;
	}
%>

<%	
	int result = add(4,7);
	int j = 0; //지역변수는 초기화를 해줘야한다. 
	i++;
	j++;
	double d = Math.random();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
	out.print("i의 값:" + i + "<br>");
	out.print("j의 값:" + j + "<br>");
	out.print("result의 값:" + result + "<br>");
	out.print("d의 값:" + d + "<br>");
	%>
	
	<hr>
	
	i의 값은: <%= i %><br>
	j의 값은: <%= j %><br>
	result의 값은: <%= result %><br>
	무작위 난수: <%= Math.random() %><br>
	
	
</body>
</html>