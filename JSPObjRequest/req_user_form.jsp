<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
   <%--
   
   *사용자의 입력값을 서버로 전송하는 방법.
   1. 사용자의 입력 데이터를 서버로 전송하려면 HTML의 form태그를 사용합니다.
   2. from 태그의 action 속성에 데이터를 전달받을 페이지의 URL 주소를 작성합니다.
   3. input 태그의 name 속성으로 요청 파라미터 변수명을 지정할 수 있습니다.
   
    --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>회원가입 양식</h2>
	<hr>
	
	<form action="req_user_info.jsp">
	# 이름: <input type = "text" name="name"/> <br>
	# 아이디: <input type ="text" name="id"/> <br>	
	# 비빌번호:<input type ="password" name="pw"/> <br>
	
	# 성별<br>
	<input type ="radio" name="gender" value="male" />남  &nbsp &nbsp &nbsp &nbsp     
	<input type ="radio" name="gender" value="female" />여 <br>
	
	# 취미 <br>
	<input type ="checkbox" name="hobby" value="독서"/> 독서&nbsp;
	<input type ="checkbox" name="hobby" value="수면"/> 수면&nbsp;
	<input type ="checkbox" name="hobby" value="축구"/> 축구&nbsp;
	<input type ="checkbox" name="hobby" value="게임"/> 게임<br>
	
	#지역:
	<select name="region"> <!-- 선택 양식을 제공 -->
		<option>서울</option>
		<option>대전</option>
		<option>대구</option>
		<option>부산</option>
	</select><br>

	#자기 소개<br>
	<!-- textarea: 텍스트 작성 공간 영역 제공. cols는 너비,row는 높이-->
	<textarea name="introduce" 	cols="40"rows="10">입력하세요...</textarea><br>
	
	<input type="submit" value="회원가입"/>
	<input type="reset" value="초기화"/>
	
	
	</form>

</body>
</html>