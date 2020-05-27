<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	//예매가 확정된 좌석 정보를 저장할 리스트
    	List<String> list = new ArrayList<>();
    	if(application.getAttribute("complete_list") != null){
    		list = (List<String>)application.getAttribute("complete_list");
    	}
    	//사용자가 예매를 희망하는 좌석 정보가 들어잇는 배열.
    	String[] seat = request.getParameterValues("seat");
    	
    	//예약 확정 전에 임시로 좌석 정보를 저장할 리스트
    	List<String> temp = new ArrayList<>();
    	
    	int count = 0;
    
    	
    	for(String s: seat){
    		if(list.contains(s)){
    			break;
    		}else{
    			count++;
    			temp.add(s);
    		}
    	}
    	
    	if(count == seat.length){
    		list.addAll(temp);
    	}
    	application.setAttribute("complete_list", list);
    	
    	
    	/* for(int i = 0 ; i== seat.length; i++){
    		if(list.contains(seat[i])){
    			flag = false;
    			break;
    		}else{
    			temp.add(seat[i]);
    			count++;
    		}
    	}
    	
    	if(count == seat.length){
    		list.addAll(temp);
    		application.setAttribute("complete_list", list);
    	} */
    		
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div align ="center">
		<p>
		<% for(String s: seat){
				out.print("<b>["+s+"]</b>");
			}%>
			<br>(이)가 예매 신청되었습니다.<br>
		
		</p>
		<p>
			예매신청 결과: <%=(count == seat.length) ? "성공" : "실패" %>
			<%if (count != seat.length){%>
					예매하고자하는 자리가 선점되었습니다.<br>
			<% }%>
			<a href = "concert_reserve.jsp">돌아가기</a>
		</p>
		
		</div>
</body>
</html>