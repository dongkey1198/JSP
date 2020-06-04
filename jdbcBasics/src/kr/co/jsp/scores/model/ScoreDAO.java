package kr.co.jsp.scores.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/*
 * DAO는 서버의 DB 연동 요청이 발생할 때마다
 * DATABASE CRUD(create, read, update, delete)작업을 전담하는 클래스이다.
 */

public class ScoreDAO {
	
	
	//싱글톤 디자인 패턴. (객체의 생성을 단 하나로 제한하기 위한 코드 디자인 패턴)
	//1. 클래스 외부에서 객체를 생성할 수 없도록 생성자에 private 접근제한을 붙인다.
	
	private ScoreDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//2. 객체를 생성할 수 이쓴ㄴ 영역은 해당 클래스 내부 뿐이므로
	//스스 로의 객체를 단 1개만 생성.
	private static ScoreDAO dao = new ScoreDAO();
	
	//3. 외부에서 객체를 요구할 시 공개된 메서드를 통해
	//2번에서 미리 만들어 놓은 단 하나의 객체의 주소값을 리턴.
	
	public static ScoreDAO getInstance() {
		if(dao == null)
			dao = new ScoreDAO();
		return dao;
	}
	/////////////////////////////////////////////////////////////////
	
	//DB관련 작업 메서드 
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	//Connection 객체를 제공하는 메서드
	private static Connection getConnection() throws Exception{
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String uid = "jsp";
		String upw = "jsp";
		String driverName = "oracle.jdbc.driver.OracleDriver";
		Class.forName(driverName);
		return DriverManager.getConnection(url, uid, upw);
	}
	
	//점수 데이터를 저장하는 메서드
	public boolean insert(Scores scores) {
		
		boolean flag = false;
		
		
		
		//시퀀스이름.NEXTVAL -> 시퀀스의 다음 숫자를 적용
		//시퀀스이름.CURRVAL -> 시퀀스의 현재 숫자를 적용
		
		String sql = "INSERT INTO scores VALUES(id_seq.NEXTVAL,?,?,?,?,?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, scores.getName());
			pstmt.setInt(2, scores.getKor());
			pstmt.setInt(3, scores.getEng());
			pstmt.setInt(4, scores.getMath());
			pstmt.setInt(5, scores.getTotal());
			pstmt.setDouble(6, scores.getAverage());
			
			int rn = pstmt.executeUpdate();
			
			if(rn == 1) flag = true;
			else flag = false;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
			
		return flag;
		
	}
	
	
	
	//전체 점수 목록을 불러오는 메서드
	public List<Scores> list() {
		
		List<Scores> scoreList = new ArrayList<>();
		
		String sql ="SELECT * FROM scores ORDER BY id ASC";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Scores scores = new Scores(
						rs.getInt("id"),
						rs.getString("name"),
						rs.getInt("kor"),
						rs.getInt("eng"),
						rs.getInt("math"),
						rs.getInt("total"),
						rs.getDouble("average")
						);
				scoreList.add(scores);
			}
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		
		return scoreList;
		
	}
	
	
	//학생 정보를 삭제하는 메소드
	public boolean delete(int id) {
		boolean flag = false;
		
		String sql = "DELETE FROM scores WHERE id = ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			
			int rn = pstmt.executeUpdate();
			
			if(rn == 1) flag = true;
			else flag = false;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	finally {
			try {
				
				if(pstmt != null) pstmt.close();
				if(conn != null) pstmt.close();
				
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		
		return flag;
	}
	
	//이름검색 메소드
	public List<Scores> search(String keyword){
		
		  List<Scores> scoreList = new ArrayList<>();
	      String sql = "SELECT * FROM scores WHERE name LIKE ?";
	      
	      try {
	         conn = getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, keyword);
	         
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            Scores score = new Scores(
	                  rs.getInt("id"),
	                  rs.getString("name"),
	                  rs.getInt("kor"),
	                  rs.getInt("eng"),
	                  rs.getInt("math"),
	                  rs.getInt("total"),
	                  rs.getDouble("average")
	                  );
	            scoreList.add(score);
	         }
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            if(rs != null) rs.close();
	            if(pstmt != null) pstmt.close();
	            if(conn != null) conn.close();
	         } catch (Exception e2) {
	            e2.printStackTrace();
	         }
	      }
	      return scoreList;   

		
	}
}
