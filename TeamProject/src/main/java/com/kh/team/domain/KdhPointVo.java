package com.kh.team.domain;

import java.sql.Timestamp;

public class KdhPointVo {
	private int point;
	private String point_code;
	private Timestamp point_date;
	private int point_num;
	private int point_percent;
	private String point_name;
	private String user_id;
	public KdhPointVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public KdhPointVo(int point, String point_code, Timestamp point_date, int point_num, int point_percent,
			String point_name, String user_id) {
		super();
		this.point = point;
		this.point_code = point_code;
		this.point_date = point_date;
		this.point_num = point_num;
		this.point_percent = point_percent;
		this.point_name = point_name;
		this.user_id = user_id;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getPoint_code() {
		return point_code;
	}
	public void setPoint_code(String point_code) {
		this.point_code = point_code;
	}
	public Timestamp getPoint_date() {
		return point_date;
	}
	public void setPoint_date(Timestamp point_date) {
		this.point_date = point_date;
	}
	public int getPoint_num() {
		return point_num;
	}
	public void setPoint_num(int point_num) {
		this.point_num = point_num;
	}
	public int getPoint_percent() {
		return point_percent;
	}
	public void setPoint_percent(int point_percent) {
		this.point_percent = point_percent;
	}
	public String getPoint_name() {
		return point_name;
	}
	public void setPoint_name(String point_name) {
		this.point_name = point_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "KdhPointVo [point=" + point + ", point_code=" + point_code + ", point_date=" + point_date
				+ ", point_num=" + point_num + ", point_percent=" + point_percent + ", point_name=" + point_name
				+ ", user_id=" + user_id + "]";
	}
	
	
}
