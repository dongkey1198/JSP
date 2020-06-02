package kr.co.jsp.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

public class MembersManager {
	
	private static Scanner sc = new Scanner(System.in);
	private static Connection conn;
	private static PreparedStatement pstmt;
	private static ResultSet rs;
	
	public static void main(String[] args) {
		
		while(true) {
			System.out.println("\n ###회원 관리 프로그램###");
			System.out.println("1. 회원 정보 등록하기");
			System.out.println("2. 회원 정보 조회하기");
			System.out.println("3. 개별 회원 정보 조회하기");
			System.out.println("4. 회원 정보 수정하기");
			System.out.println("5. 회원 정보 삭제하기");
			System.out.println("6. 프로그램 종료");
			
			System.out.print("매뉴 선택:");
			int menu = sc.nextInt();
			
			switch(menu) {
			case 1:
				insert();
				break;
			case 2:
				selectAll();
				break;
			case 3:
				selectOne();
				break;
			case 4:
				update();
				break;
			case 5:
				delete();
				break;
			case 6:
				System.out.println("프로그램을 종료합니다.");
				sc.close();
				System.exit(0);
			default:
				System.out.println("메뉴를 잘못 입력하였습니다.");
			
			}// end Swith
		}
		
	}// end main

	private static Connection getConnection() throws Exception{
		
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String uid = "jsp";
		String upw = "jsp";
		String driverName = "oracle.jdbc.driver.OracleDriver";
		Class.forName(driverName);
		return DriverManager.getConnection(url, uid, upw);
	}
	
	//1. 회원 정보를 Insert하는 메서드
	private static void insert() {
		
		System.out.println("==회원정보 입력==");
		System.out.print("ID: ");
		String id = sc.next();
		System.out.print("PW: ");
		String pw = sc.next();
		System.out.print("NAME: ");
		String name = sc.next();
		System.out.print("EMAIL: ");
		String email = sc.next();
		
		String sql = "INSERT INTO members VALUES (?,?,?,?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,id);
			pstmt.setString(2, pw);
	        pstmt.setString(3, name);
	        pstmt.setString(4, email);
	        
	        int rn = pstmt.executeUpdate();
	         
	        if(rn == 1) System.out.println("회원 정보 입력 성공!");
	        else System.out.println("회원 정보 입력 실패!");


		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				 pstmt.close(); conn.close(); 
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	//2. 전체 회원정보를 select하는 메서드
	private static void selectAll() {
		String sql = "SELECT * FROM members";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String email = rs.getString("email");
				
				System.out.printf("#아이디: %s\n#비밀번호: %s\n#이름: %s\n#이메일: %s\n", id, pw, name, email);
				System.out.println("====================");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close(); pstmt.close(); conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}
	
	//3. 개별회원정보 select하는 메서드
	private static void selectOne() {
		String sql = "SELECT * FROM members WHERE id = ? ";
		System.out.print("검색하실 ID를 입력하세요: ");
		String userId = sc.next();
		
		try {
			conn = getConnection();
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
				rs.close(); pstmt.close(); conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	//4. 개인회원 정보를 수정하는 메서드
	private static void update() {
	/*
	 * 회원 정보를 수정할 ID를 먼저 입력 받으세요
	 * 수정할 정보는 이름과 이메일입니다. 수정할 이름과 이메일을 입력받아서
	 * 해당 ID의 이름과 이메을 수정해 주세요
	 * SQL= UPDATE members SET name =?, email = ? WHERE id =?	
	 */
		String sql = "UPDATE members SET name = ?, email = ? WHERE id = ?";
		
		System.out.print("수정할 ID를 입력하세요: ");
		String userId = sc.next();
		System.out.print(userId + "의 변경할 NAME을 입력하세요: ");
		String name = sc.next();
		System.out.print(userId + "의 변견할 EMAIL을 입력하세요: ");
		String email = sc.next();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, userId);
			
			int rn = pstmt.executeUpdate();
			
			if(rn == 1 ) {
				System.out.println("회원정보가 수정되었습니다.");
			} else {
				System.out.println("회원정보 수정에 실패하였습니다.");
			}
			
			
			
		} catch (Exception e) {
	
			e.printStackTrace();
		} finally {
			try {
				
				pstmt.close();conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}
	
	//5.회원정보 삭제
	private static void delete() {
		//아이디를 입력받아서 해당 아이디의 모든 회원정보를 삭제
		String sql = "DELETE FROM members WHERE id = ?";
		
		System.out.print("삭제할 ID를 입력하세요: ");
		String userId = sc.next();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			int rn = pstmt.executeUpdate();
			
			if(rn == 1) {
				System.out.println("입력하신 아이디가 삭제되었습니다.");
			} else {
				System.out.println("");
			}
		
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				 pstmt.close();conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		
	}
	
}
