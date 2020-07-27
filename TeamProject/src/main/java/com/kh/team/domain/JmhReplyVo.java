package com.kh.team.domain;

import java.sql.Timestamp;

public class JmhReplyVo {
	private int reply_code;
	private int board_code;
	private String reply_content;
	private Timestamp reply_date;
	public int getReply_code() {
		return reply_code;
	}
	public void setReply_code(int reply_code) {
		this.reply_code = reply_code;
	}
	public int getBoard_code() {
		return board_code;
	}
	public void setBoard_code(int board_code) {
		this.board_code = board_code;
	}
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public Timestamp getReply_date() {
		return reply_date;
	}
	public void setReply_date(Timestamp reply_date) {
		this.reply_date = reply_date;
	}
	@Override
	public String toString() {
		return "JmhReplyVo [reply_code=" + reply_code + ", board_code=" + board_code + ", reply_content="
				+ reply_content + ", reply_date=" + reply_date + "]";
	}
}