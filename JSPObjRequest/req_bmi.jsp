<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    <%--
    	bmi지수 계산 공식 = [체중(kg)/신장(m)*신장(m)]
    	18.5 미만이라면 "당신은 저체중입니다." 를 출력.
    	23를 초과한다면 "당신은 과체중입니다."
    	나머지는 "당신은 정상체중입니다."
    	
    	request.getParameter() 리턴 타입은 스트링 타입이기때문에
    	bmi지수를 계산하려면 실수나 정수로 변환을 해 주어야한다.
    	Integer.parseInt(변환하고 싶은 문자열 or 무자열이 들어있는 변수.)
     --%>
     
     <%
     //String bmi = request.getParameter("bmi");
     String height = request.getParameter("height");
     String weight = request.getParameter("weight");
     
     double a = Double.parseDouble(height);
     double b = Double.parseDouble(weight);
     
     //bmi
     double bmi = b / (a/100 * a/100); 
     bmi = Math.round(bmi*100)/100.0;
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>체질량 지수(BMI) 계산</h2>
	<hr>
	#신장: <%= height %><br>
	#체중: <%= weight %><br>
	#BMI: <%= bmi %><br>
	
	<%if(bmi<18.5) { %>
		<div>당신은 저체중입니다...</div>
	<%} else if(bmi > 23) {%>
		<div>당신은 과체중입니다...</div>
	<%} else { %>
		<div>당신은 정상체중입니다.</div>
	<%} %>
</body>
</html>