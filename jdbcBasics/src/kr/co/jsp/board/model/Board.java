package kr.co.jsp.board.model;

import java.sql.Date;

public class Board {
	
	private int board_Id;
	private String writer;
	private String title;
	private String content;
	private Date createAt;
	
	
	public Board() {
		// TODO Auto-generated constructor stub
	}


	public Board(int board_Id, String writer, String title, String content, Date createAt) {
		super();
		this.board_Id = board_Id;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.createAt = createAt;
	}


	public int getBoard_Id() {
		return board_Id;
	}


	public void setBoard_Id(int board_Id) {
		this.board_Id = board_Id;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public Date getCreateAt() {
		return createAt;
	}


	public void setCreateAt(Date createAt) {
		this.createAt = createAt;
	}
	
}
