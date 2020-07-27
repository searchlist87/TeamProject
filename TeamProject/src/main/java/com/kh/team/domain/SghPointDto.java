package com.kh.team.domain;

public class SghPointDto {
	private String user_id;
	private int point;
	private String point_code;
	public SghPointDto() {
		super();
	}
	public SghPointDto(String user_id, int point, String point_code) {
		super();
		this.user_id = user_id;
		this.point = point;
		this.point_code = point_code;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
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
	@Override
	public String toString() {
		return "SghPointDto [user_id=" + user_id + ", point=" + point + ", point_code=" + point_code + "]";
	}
}
