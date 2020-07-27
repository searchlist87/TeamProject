package com.kh.team.domain;

public class KdhPointCodeVo {
	private String point_code;
	private String point_name;
	private int point_percent;
	public KdhPointCodeVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public KdhPointCodeVo(String point_code, String point_name, int point_percent) {
		super();
		this.point_code = point_code;
		this.point_name = point_name;
		this.point_percent = point_percent;
	}
	public String getPoint_code() {
		return point_code;
	}
	public void setPoint_code(String point_code) {
		this.point_code = point_code;
	}
	public String getPoint_name() {
		return point_name;
	}
	public void setPoint_name(String point_name) {
		this.point_name = point_name;
	}
	public int getPoint_percent() {
		return point_percent;
	}
	public void setPoint_percent(int point_percent) {
		this.point_percent = point_percent;
	}
	@Override
	public String toString() {
		return "KdhPointCodeVo [point_code=" + point_code + ", point_name=" + point_name + ", point_percent="
				+ point_percent + "]";
	}
	
	
}
