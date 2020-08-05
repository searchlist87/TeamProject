package com.kh.team.domain;

public class SghFindPwVo {
	private String user_id;
	private String user_name;
	private String user_email;
	public SghFindPwVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	@Override
	public String toString() {
		return "SghFindPwVo [user_id=" + user_id + ", user_name=" + user_name + ", user_email=" + user_email + "]";
	}
}
