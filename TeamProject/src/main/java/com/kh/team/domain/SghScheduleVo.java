package com.kh.team.domain;

public class SghScheduleVo {
	private String movie_code;
	private String movie_start_date;
	private String movie_end_date;
	private String theater_code;
	private String movie_schedule_code;
	private String movie_schedule_num;
	private String movie_name;
	private String theater_name;
	public SghScheduleVo() {
		super();
	}
	public SghScheduleVo(String movie_code, String movie_start_date, String movie_end_date, String theater_code,
			String movie_schedule_code, String movie_schedule_num, String movie_name, String theater_name) {
		super();
		this.movie_code = movie_code;
		this.movie_start_date = movie_start_date;
		this.movie_end_date = movie_end_date;
		this.theater_code = theater_code;
		this.movie_schedule_code = movie_schedule_code;
		this.movie_schedule_num = movie_schedule_num;
		this.movie_name = movie_name;
		this.theater_name = theater_name;
	}
	public String getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
	}
	public String getMovie_start_date() {
		return movie_start_date;
	}
	public void setMovie_start_date(String movie_start_date) {
		this.movie_start_date = movie_start_date;
	}
	public String getMovie_end_date() {
		return movie_end_date;
	}
	public void setMovie_end_date(String movie_end_date) {
		this.movie_end_date = movie_end_date;
	}
	public String getTheater_code() {
		return theater_code;
	}
	public void setTheater_code(String theater_code) {
		this.theater_code = theater_code;
	}
	public String getMovie_schedule_num() {
		return movie_schedule_num;
	}
	public void setMovie_schedule_num(String movie_schedule_num) {
		this.movie_schedule_num = movie_schedule_num;
	}
	
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	
	public String getMovie_schedule_code() {
		return movie_schedule_code;
	}
	public void setMovie_schedule_code(String movie_schedule_code) {
		this.movie_schedule_code = movie_schedule_code;
	}
	
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	@Override
	public String toString() {
		return "SghScheduleVo [movie_code=" + movie_code + ", movie_start_date=" + movie_start_date
				+ ", movie_end_date=" + movie_end_date + ", theater_code=" + theater_code + ", movie_schedule_code="
				+ movie_schedule_code + ", movie_schedule_num=" + movie_schedule_num + ", movie_name=" + movie_name
				+ ", theater_name=" + theater_name + "]";
	}
}
