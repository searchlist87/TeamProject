package com.kh.team.sgh.domain;

public class SghScreenRegistDto {

	private String theater_name;
	private String theater_code;
	public SghScreenRegistDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SghScreenRegistDto(String theater_name, String theater_code) {
		super();
		this.theater_name = theater_name;
		this.theater_code = theater_code;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public String getTheater_code() {
		return theater_code;
	}
	public void setTheater_code(String theater_code) {
		this.theater_code = theater_code;
	}
	@Override
	public String toString() {
		return "SghScreenRegistDto [theater_name=" + theater_name + ", theater_code=" + theater_code + "]";
	}
	
}
