package com.kh.team.domain;

public class SghTheaterVo {
	private String theater_code;
	private String theater_name;
	private String theater_area;
	
	public SghTheaterVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SghTheaterVo(String theater_code, String theater_name, String theater_area) {
		super();
		this.theater_code = theater_code;
		this.theater_name = theater_name;
		this.theater_area = theater_area;
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

	public String getTheater_area() {
		return theater_area;
	}

	public void setTheater_area(String theater_area) {
		this.theater_area = theater_area;
	}

	@Override
	public String toString() {
		return "SghTheaterVo [theater_code=" + theater_code + ", theater_name=" + theater_name + ", theater_area="
				+ theater_area + "]";
	}
	
}
