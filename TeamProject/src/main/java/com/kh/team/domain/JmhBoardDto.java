package com.kh.team.domain;

public class JmhBoardDto {
	
	private int board_code;
	private String user_id;
	private String reply_content;
	public int getBoard_code() {
		return board_code;
	}
	public void setBoard_code(int board_code) {
		this.board_code = board_code;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	@Override
	public String toString() {
		return "JmhBoardDto [board_code=" + board_code + ", user_id=" + user_id + ", reply_content=" + reply_content
				+ "]";
	}
}
