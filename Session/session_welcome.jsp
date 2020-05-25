<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    /*
    1.로그인 하지 않은사용자가 주소창에 이페이지의 URL을 집적 적고
    들어왔을 경우 로그인창으로 돌려보내는 코드를 작성하세요.
    (조건문을 사용하여 로그인 성공시 생성되는 세션이 있는지를 확인)
    
    2. 로그인한 회원 아이디와 별명을 통해 "nick(id)"님 환영합니다.!를 출력
    3. a태그로 로그인창으로 돌아가는 링크와 request폴더에 앨범 선택 페이로 갈수 있는 링크 2개를 작성하세용.
    
    4. 로그인 폼페이지에 현재 로그인 세션이 존재하는지를 확인하여 이미 로그인 주인 사용자와 그렇지 않은 사용자가 서로
    다른화면을 볼수있도록 작성
    	로그인 성공시 -- 이미로그인중이다. 
    	로그인 x --> 폼
    */
    
    
    
    if(session.getAttribute("user_Id") == null){
    	response.sendRedirect("session_login.jsp");
    }
    	
    String id = (String)session.getAttribute("user_Id");
    String nick = (String)session.getAttribute("user_nick");
        
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p><%=nick%>(<%=id%>)님 환영합니다!<br>
		<a href = "session_login.jsp">로그인 화면으로 돌아가기</a><br>
		<a href = "..\JSPObjRequest\req_album.jsp">앨범 리스트보기</a>
		<a href = "session_logout.jsp">로그아웃 하기</a>
	</p>
</body>
</html>