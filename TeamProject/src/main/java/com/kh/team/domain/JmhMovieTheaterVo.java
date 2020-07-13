package com.kh.team.domain;

public class JmhMovieTheaterVo {
	private String theater_code;
	private String theater_name;
	private String theater_adress;
	private String area_name;
	private String area_code;

	
	public String getTheater_name() {
		return theater_name;
	}

	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}

	public String getTheater_adress() {
		return theater_adress;
	}

	public void setTheater_adress(String theater_adress) {
		this.theater_adress = theater_adress;
	}

	public String getArea_name() {
		return area_name;
	}

	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}

	public JmhMovieTheaterVo() {
		super();
	}

	public String getTheater_code() {
		return theater_code;
	}

	public void setTheater_code(String theater_code) {
		this.theater_code = theater_code;
	}
	
	public String getArea_code() {
		return area_code;
	}

	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}

	@Override
	public String toString() {
		return "JmhMovietheaterName [theater_code=" + theater_code + ", theater_name=" + theater_name
				+ ", theater_adress=" + theater_adress + ", area_name=" + area_name + "]";
	}
}
