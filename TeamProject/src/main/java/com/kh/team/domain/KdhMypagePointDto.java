package com.kh.team.domain;

import java.sql.Timestamp;

public class KdhMypagePointDto {
	private String point_used_code;
	private int point_used_num;
	private int used_point;
	private Timestamp used_point_date;
	private String user_id;
	private String point_used_name;
	public KdhMypagePointDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public KdhMypagePointDto(String point_used_code, int point_used_num, int used_point, Timestamp used_point_date,
			String user_id, String point_used_name) {
		super();
		this.point_used_code = point_used_code;
		this.point_used_num = point_used_num;
		this.used_point = used_point;
		this.used_point_date = used_point_date;
		this.user_id = user_id;
		this.point_used_name = point_used_name;
	}
	public String getPoint_used_code() {
		return point_used_code;
	}
	public void setPoint_used_code(String point_used_code) {
		this.point_used_code = point_used_code;
	}
	public int getPoint_used_num() {
		return point_used_num;
	}
	public void setPoint_used_num(int point_used_num) {
		this.point_used_num = point_used_num;
	}
	public int getUsed_point() {
		return used_point;
	}
	public void setUsed_point(int used_point) {
		this.used_point = used_point;
	}
	public Timestamp getUsed_point_date() {
		return used_point_date;
	}
	public void setUsed_point_date(Timestamp used_point_date) {
		this.used_point_date = used_point_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPoint_used_name() {
		return point_used_name;
	}
	public void setPoint_used_name(String point_used_name) {
		this.point_used_name = point_used_name;
	}
	@Override
	public String toString() {
		return "KdhMypagePointDto [point_used_code=" + point_used_code + ", point_used_num=" + point_used_num
				+ ", used_point=" + used_point + ", used_point_date=" + used_point_date + ", user_id=" + user_id
				+ ", point_used_name=" + point_used_name + "]";
	}
	
}
