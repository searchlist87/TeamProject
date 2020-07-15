package com.kh.team.domain;

public class SghTheaterVo {
	private String theater_code;
	private String theater_name;
	private String area_code;
	private int theater_num;
	private String theater_address;
	private String area_name;

	
	public SghTheaterVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SghTheaterVo(String theater_code, String theater_name, String area_code, int theater_num,
			String theater_address, String area_name) {
		super();
		this.theater_code = theater_code;
		this.theater_name = theater_name;
		this.area_code = area_code;
		this.theater_num = theater_num;
		this.theater_address = theater_address;
		this.area_name = area_name;
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

	public int getTheater_num() {
		return theater_num;
	}

	public void setTheater_num(int theater_num) {
		this.theater_num = theater_num;
	}

	public String getTheater_address() {
		return theater_address;
	}

	public void setTheater_address(String theater_address) {
		this.theater_address = theater_address;
	}

	@Override
	public String toString() {
		return "SghTheaterVo [theater_code=" + theater_code + ", theater_name=" + theater_name + ", area_code="
				+ area_code + ", theater_num=" + theater_num + ", theater_address=" + theater_address + ", area_name="
				+ area_name + "]";
	}
}
