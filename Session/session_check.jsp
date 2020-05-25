<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    /*
    	- 세션에 저장한 데이터는 브라우저 창이 종료될 때까지 혹은
    	세션의 유효시간이 만료되기 전까지 웹 어플리케이션의 
    	모든 jsp 페이지에서 사용할 수 있습니다.
    	
    	-세션에 저장된 데이터를 가져오려면 session객체의
    	getAttribute()메서드를 사용하며, 매개값으로 가져올 데이터의 // getAttribute의 타입은 object이기때문에 형변화 필요
    	세션이름을 적는다.
    */
    
    String nick = (String) session.getAttribute("nickname");
    String[] hobbys = (String[]) session.getAttribute("hobbys");
    
    out.print(nick + "<br>");
    out.print(Arrays.toString(hobbys)+ "<br>");
    out.print("---------------------<br>");
    
    //세션의 유효시간 설정.
    session.setMaxInactiveInterval(60*60); //초단위 시간설정
    
    int sTime = session.getMaxInactiveInterval(); //세션의 유효시간 확인
    out.print(sTime + "초<br>");
    out.print("---------------------<br>");
    
    //특정 세션의 데이터를 삭제.
    session.removeAttribute("nickname");
    nick = (String) session.getAttribute("nickname");
    out.print("삭제후 닉의 값: " + nick + "<br>");
    out.print("---------------------<br>");
    
    //모든 세션의 데이터를 삭제.
    session.invalidate();	// 로그아웃 혹은 회원 탈퇴를 할때 많이사용...
    
    //isRequestedSessionIdValid()
    //현제 페이지에서 유효한 세션 데이터가 존재하는지를 확인하는 메소드.
    if(request.isRequestedSessionIdValid()){
    	out.print("유효한 세션이 존재함");
    }else{
    	out.print("유효한 세션이 존재하지 않음");
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>