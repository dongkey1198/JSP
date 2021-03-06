<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
    <%
    /*
    #쿠키 생성 방법:
    1. 쿠키 객체를 생성 - 생성자읭 매개값으로 쿠키의 이름과 저장할 데이터를 입력(String)
    			  -  쿠키에는 공백을 입력하면 안된다.
    */
    
    Cookie choco = new Cookie("choco_cookie","초코쿠키");
    Cookie apple = new Cookie("apple_cookie","사과쿠키");
    
    //2. 쿠키 클래스의 setter메서드로 쿠키의 속성을 설정
    choco.setMaxAge(60*60); // 쿠키의 수명(유효 시간)은 초단위로 설정가능하다.
    apple.setMaxAge(20);
    
    //3. http응답시 response 객체에 생성된 쿠키를 탑재하여 클라이언트로 전송.
    response.addCookie(choco);
    response.addCookie(apple);
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<a href = "cookie_check.jsp">쿠키 확인하기~</a>

</body>
</html>