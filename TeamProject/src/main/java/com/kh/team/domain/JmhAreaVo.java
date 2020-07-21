package com.kh.team.domain;

public class JmhAreaVo {
	private String area_code;
	private String area_name;
	private int area_num;
	public String getArea_code() {
		return area_code;
	}
	public String getArea_name() {
		return area_name;
	}
	public int getArea_num() {
		return area_num;
	}
	@Override
	public String toString() {
		return "JmhAreaVo [area_code=" + area_code + ", area_name=" + area_name + ", area_num=" + area_num + "]";
	}
	
}