package com.kh.team.domain;

public class SghAreaVo {
	private String area_code;
	private String area_name;
	public SghAreaVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SghAreaVo(String area_code, String area_name) {
		super();
		this.area_code = area_code;
		this.area_name = area_name;
	}
	public String getArea_code() {
		return area_code;
	}
	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}
	public String getArea_name() {
		return area_name;
	}
	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}
	@Override
	public String toString() {
		return "SghAreaVo [area_code=" + area_code + ", area_name=" + area_name + "]";
	}
}
