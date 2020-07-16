package com.kh.team.sgh.domain;

public class SghEmailDto {
	private String from = "rtg25689214@gmail.com";
	private String to;
	private String subject;
	private String contents;
	private String user_id;
	// 이메일 인증 코드
	private int randomNum;
	public SghEmailDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SghEmailDto(String from, String to, String subject, String contents, String user_id, int randomNum) {
		super();
		this.from = from;
		this.to = to;
		this.subject = subject;
		this.contents = contents;
		this.user_id = user_id;
		this.randomNum = randomNum;
	}
	public String getFrom() {
		return from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public int getRandomNum() {
		return randomNum;
	}
	public void setRandomNum(int randomNum) {
		this.randomNum = randomNum;
	}
	@Override
	public String toString() {
		return "SghEmailDto [from=" + from + ", to=" + to + ", subject=" + subject + ", contents=" + contents
				+ ", user_id=" + user_id + ", randomNum=" + randomNum + "]";
	}
	
}
