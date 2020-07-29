package com.kh.team.domain;

public class SghBuyTheaterVo {
	private String theater_code;
	private String theater_name;
	public SghBuyTheaterVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getTheater_code() {
		return theater_code;
	}
	public void setTheater_code(String theater_code) {
		this.theater_code = theater_code;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	@Override
	public String toString() {
		return "SghBuyTheaterVo [theater_code=" + theater_code + ", theater_name=" + theater_name + "]";
	}
	
}
