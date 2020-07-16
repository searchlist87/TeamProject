package com.kh.team.sgh.domain;

public class SghFindDto {
	private String user_name;
	private String user_email;
	private String user_id;
	private String user_join_date;
	
	public SghFindDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public SghFindDto(String user_name, String user_email, String user_id, String user_join_date) {
		super();
		this.user_name = user_name;
		this.user_email = user_email;
		this.user_id = user_id;
		this.user_join_date = user_join_date;
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
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public String getUser_join_date() {
		return user_join_date;
	}

	public void setUser_join_date(String user_join_date) {
		this.user_join_date = user_join_date;
	}

	@Override
	public String toString() {
		return "SghFindDto [user_name=" + user_name + ", user_email=" + user_email + ", user_id=" + user_id
				+ ", user_join_date=" + user_join_date + "]";
	}

}
