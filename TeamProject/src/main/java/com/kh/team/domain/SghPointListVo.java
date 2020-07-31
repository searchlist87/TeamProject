package com.kh.team.domain;

import java.sql.Timestamp;

public class SghPointListVo {
	private String point_used_num;
	private int used_point;
	private Timestamp used_point_date;
	private String point_used_name;
	public SghPointListVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getPoint_used_num() {
		return point_used_num;
	}
	public void setPoint_used_num(String point_used_num) {
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
	public String getPoint_used_name() {
		return point_used_name;
	}
	public void setPoint_used_name(String point_used_name) {
		this.point_used_name = point_used_name;
	}
	@Override
	public String toString() {
		return "SghPointListVo [point_used_num=" + point_used_num + ", used_point=" + used_point + ", used_point_date="
				+ used_point_date + ", point_used_name=" + point_used_name + "]";
	}
}
