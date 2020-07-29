package com.kh.team.domain;

import java.sql.Timestamp;

public class SghTheaterVo {
	private String theater_code;
	private String theater_name;
	private String area_code;
	private int theater_num;
	private String theater_address;
	private String area_name;
	private String theater_state;
	private Timestamp theater_del_date;

	public SghTheaterVo() {
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

	public String getTheater_address() {
		return theater_address;
	}

	public void setTheater_address(String theater_address) {
		this.theater_address = theater_address;
	}

	public String getArea_name() {
		return area_name;
	}

	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}

	public String getTheater_state() {
		return theater_state;
	}

	public void setTheater_state(String theater_state) {
		this.theater_state = theater_state;
	}

	public Timestamp getTheater_del_date() {
		return theater_del_date;
	}

	public void setTheater_del_date(Timestamp theater_del_date) {
		this.theater_del_date = theater_del_date;
	}

	@Override
	public String toString() {
		return "SghTheaterVo [theater_code=" + theater_code + ", theater_name=" + theater_name + ", area_code="
				+ area_code + ", theater_num=" + theater_num + ", theater_address=" + theater_address + ", area_name="
				+ area_name + ", theater_state=" + theater_state + ", theater_del_date=" + theater_del_date + "]";
	}
}
