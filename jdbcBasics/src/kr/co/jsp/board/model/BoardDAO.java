package kr.co.jsp.board.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.co.jsp.scores.model.Scores;
import sun.security.jca.GetInstance;

public class BoardDAO implements IBoardDAO {
	
	DataSource ds;
	
	//싱글톤 패턴
	private BoardDAO() {
		//jsp에서 커넥션풀을 구하는 방법.(설정 파일이 InitialContext() 객체에 저장됨)
		try {
			InitialContext ct = new InitialContext();
			ds = (DataSource) ct.lookup("java:comp/env/jdbc/myOracle");
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
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
	
	
	/*
	 * //connection 객체를 제공하는 메서드 private Connection getConnection() throws Exception
	 * {
	 * 
	 * String url = "jdbc:oracle:thin:@localhost:1521:xe"; String uid = "jsp";
	 * String upw = "jsp";
	 * 
	 * return DriverManager.getConnection(url,uid,upw); }
	 */
	
	
	

	@Override
	public boolean insert(Board article) {
		// TODO Auto-generated method stub
		
		boolean flag = false;
		
		String sql = "INSERT INTO board"
				+"(board_id, writer, title, content)"
				+"VALUES(bid_sq.NEXTVAL,?,?,?)";
		
		
		try {
			conn = ds.getConnection();
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
			conn = ds.getConnection();
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
		
		Board article = null;
		
		String sql = "SELECT * FROM board WHERE board_id LIKE ?";
		
		try {
			conn = ds.getConnection();
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
		
		boolean flag = false;
		
		String sql = "UPDATE board SET writer = ?, "
					+ "title = ?, "
					+ "content = ? "
					+ "WHERE board_id = ? ";
		
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getTitle());
			pstmt.setString(3, article.getContent());
			pstmt.setInt(4, article.getBoard_Id());
			
			int rn = pstmt.executeUpdate();
			
			if(rn == 1) flag = true;
			else flag = false;
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	finally {	
			
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
	public boolean delete(int board_Id) {
		boolean flag  = false;
		
		String sql = "DELETE FROM board WHERE board_id = ?";
		
		try {
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_Id);
			
			int rn = pstmt.executeUpdate();
			
			if(rn == 1) flag = true;
			else flag = false;
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) pstmt.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		
		return flag;
	}

}
