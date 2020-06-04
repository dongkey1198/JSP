package kr.co.jsp.board.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.jsp.scores.model.Scores;
import sun.security.jca.GetInstance;

public class BoardDAO implements IBoardDAO {
	
	//싱글톤 패턴
	private BoardDAO() {
		try {
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
		} catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}
	}
	
	private static BoardDAO dao = new BoardDAO();
	
	public static BoardDAO getInstance() {
		if(dao == null) {
			dao = new  BoardDAO();
		}
		
		return dao;
		
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	
	//connection 객체를  제공하는 메서드
	private Connection getConnection() throws Exception {
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String uid = "jsp";
		String upw = "jsp";
		
		return DriverManager.getConnection(url,uid,upw);
	}
	
	
	

	@Override
	public boolean insert(Board article) {
		// TODO Auto-generated method stub
		
		boolean flag = false;
		
		String sql = "INSERT INTO board"
				+"(board_id, writer, title, content)"
				+"VALUES(bid_sq.NEXTVAL,?,?,?)";
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getTitle());
			pstmt.setString(3, article.getContent());
			
			int rn = pstmt.executeUpdate();
			
			if(rn == 1) flag = true;
			else flag = false;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return flag;
	}

	@Override
	public List<Board> selectAll() {
		
		List<Board> articles = new ArrayList<>();
		
		String sql = "SELECT * FROM board ORDER BY board_id DESC";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Board board = new Board(
						rs.getInt("board_id"),
						rs.getString("writer"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getDate("create_at")
						);
				articles.add(board);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return articles;
	}

	@Override
	public Board selectOne(int board_Id) {
		
		Board article = new Board();
		
		String sql = "SELECT * FROM board WHERE board_id LIKE ?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_Id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				article = new Board(
						rs.getInt("board_id"),
						rs.getString("writer"),
						rs.getString("title"),
						rs.getString("content"),
						rs.getDate("create_at")
						);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return article;
	}

	@Override
	public boolean update(Board article) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(int board_Id) {
		// TODO Auto-generated method stub
		return false;
	}

}
