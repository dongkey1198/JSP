package kr.co.jsp.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class jdbcSelect {

	public static void main(String[] args) {
		
		
		String sql ="SELECT * FROM members";
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String uid ="jsp";
		String upw ="jsp";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // SELECT문에서만 사용하는 객체이다.
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			conn = DriverManager.getConnection(url, uid, upw);
			pstmt = conn.prepareStatement(sql);
			
			// ResultSet의 객체를 pstmt의 executeQuery()를 통해 받아온다.
			rs = pstmt.executeQuery(); // 쿼리를 실행 시키는 객체
			
			/*
			 -SELECT 쿠리문의 실행 결과, 조회할 데이터가 한줄이라도 존재한다면
			 RS 객체의 next() 메서드는 true를 리턴하고 해당 행을 지목합니다.
			 */
			while(rs.next()) {
				/*
				 -SELECT의 실행 결과의 컬럼괎을 읽어오려면
				 rs의 getString()/ getInt()/ getDouble() 등의 메서드를 사용한다.
				 -해당 메서드의 매개값으로 읽어올 테이블의 컬럼명을 지정한다.
				 */
				
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String email = rs.getString("email");
				
				System.out.printf("#아이디: %s\n#비밀번호: %s\n#이름: %s\n#이메일: %s\n", id, pw, name, email);
				System.out.println("====================");
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}finally {
			try {
				
				rs.close(); pstmt.close(); conn.close();
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		

	}

}
