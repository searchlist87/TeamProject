package com.kh.team.domain;

public class SghAreaVo {
	private String area_code;
	private String area_name;
	private String area_state;
	private String area_del_date;
	public SghAreaVo() {
		super();
	}
	public SghAreaVo(String area_code, String area_name, String area_state, String area_del_date) {
		super();
		this.area_code = area_code;
		this.area_name = area_name;
		this.area_state = area_state;
		this.area_del_date = area_del_date;
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
	public String getArea_state() {
		return area_state;
	}
	public void setArea_state(String area_state) {
		this.area_state = area_state;
	}
	public String getArea_del_date() {
		return area_del_date;
	}
	public void setArea_del_date(String area_del_date) {
		this.area_del_date = area_del_date;
	}
	@Override
	public String toString() {
		return "SghAreaVo [area_code=" + area_code + ", area_name=" + area_name + ", area_state=" + area_state
				+ ", area_del_date=" + area_del_date + "]";
	}
}
