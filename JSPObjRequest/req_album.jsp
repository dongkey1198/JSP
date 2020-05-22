<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="req_album_result.jsp">
	<table border="1" align=center>
	
		<thead align=center >
			<th></th>
			<th width = 40%>앨범 커버</th>
			<th>가수</th>
			<th>앨범 제목</th>
			<th>발매일</th>
		</thead>
		
		<tr align=center>
			<td> <input type = "radio" name="option" value = "wk"/></td>
			<td><img src="A.jpg" height ="100px" width = "100px"></td>
			<td>The Weeknd</td>
			<td>Starboy</td>
			<td>2016.11.25</td>
		</tr>
		
		<tr align=center>
			<td><input type = "radio" name="option" value = "em"/></td>
			<td><img src = "B.jpg" height ="100px" width = "100px"></td>
			<td>Eminem</td>
			<td>Godzilla</td>
			<td>2020.01.31</td>
		</tr>
		
		<tr align=center>
			<td colspan="5">
				<input type = "submit"  value= "확인"/>
			</td>
		</tr>
		
	</table>
</form>
</body>
</html>