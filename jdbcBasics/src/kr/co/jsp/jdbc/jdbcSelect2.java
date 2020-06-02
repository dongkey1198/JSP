package kr.co.jsp.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class jdbcSelect2 {

	public static void main(String[] args) {
		
		/*
		 회원의 아이를 입력받아 해당 아이디의 회원 정보를 모두 출력하는 
		 JDBC 프로그래밍 코드를 작성하세요
		 */
		Scanner sc = new Scanner(System.in);
		 
		System.out.print("조회하실 ID: ");
		String userId = sc.next();
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String uid ="jsp";
		String upw = "jsp";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM members WHERE id = ? ";
		
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection(url,uid,upw);
		
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();

			if(rs.next()) {
				System.out.println("검색하신 ID: " + userId);
			    String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String email = rs.getString("email");
				
				System.out.printf("#아이디: %s\n#비밀번호: %s\n#이름: %s\n#이메일: %s\n", id, pw, name, email);
				System.out.println("====================");
				
			} else {
				System.out.println(userId+"에 대한 회원정보가 없습니다.!!!");
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		} finally {
			try {
				rs.close(); pstmt.close();conn.close();sc.close();
				
			} catch (Exception e2) {
				
				e2.printStackTrace();
			}
		}
	}

}
