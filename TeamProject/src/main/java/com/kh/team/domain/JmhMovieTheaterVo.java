package com.kh.team.domain;

public class JmhMovieTheaterVo {
	private String theater_code;
	private String theater_name;
	private String theater_address;
	private String area_code;
	private int theater_num;

	
	public String getTheater_name() {
		return theater_name;
	}

	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}

	public String getTheater_address() {
		return theater_address;
	}

	public void setTheater_address(String theater_adress) {
		this.theater_address = theater_adress;
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

	public int getTheater_num() {
		return theater_num;
	}

	public void setTheater_num(int theater_num) {
		this.theater_num = theater_num;
	}

	@Override
	public String toString() {
		return "JmhMovieTheaterVo [theater_code=" + theater_code + ", theater_name=" + theater_name
				+ ", theater_address=" + theater_address + ", area_code=" + area_code + ", theater_num=" + theater_num
				+ "]";
	}

}
