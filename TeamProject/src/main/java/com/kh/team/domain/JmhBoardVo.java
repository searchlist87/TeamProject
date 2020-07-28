package com.kh.team.domain;

import java.sql.Timestamp;

public class JmhBoardVo {
	private int board_code;
	private String board_category_code = "BCC02";
	private String user_id;
	private String board_title;
	private String board_content;
	private Timestamp board_date;
	private int count;
	
	public int getBoard_code() {
		return board_code;
	}
	public void setBoard_code(int board_code) {
		this.board_code = board_code;
	}
	public String getBoard_category_code() {
		return board_category_code;
	}
	public void setBoard_category_code(String board_category_code) {
		this.board_category_code = board_category_code;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Timestamp getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Timestamp board_date) {
		this.board_date = board_date;
	}
	
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "JmhBoardVo [board_code=" + board_code + ", board_category_code=" + board_category_code + ", user_id="
				+ user_id + ", board_title=" + board_title + ", board_content=" + board_content + ", board_date="
				+ board_date + ", count=" + count + "]";
	}
	
	
}