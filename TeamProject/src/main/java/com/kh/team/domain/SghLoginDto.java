package com.kh.team.domain;

public class SghLoginDto {
	private String user_id;
	private String user_pw;
	private String user_class;
	public SghLoginDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SghLoginDto(String user_id, String user_pw, String user_class) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_class = user_class;
	}

	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	
	public String getUser_class() {
		return user_class;
	}

	public void setUser_class(String user_class) {
		this.user_class = user_class;
	}

	@Override
	public String toString() {
		return "SghLoginDto [user_id=" + user_id + ", user_pw=" + user_pw + ", user_class=" + user_class + "]";
	}

}
