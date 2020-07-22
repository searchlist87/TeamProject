package com.kh.team.domain;

import java.sql.Date;

public class SghMovieTimeAjaxDto {
	private String movie_name;
	private String movie_code;
	private String theater_name;
	private String theater_code;
	private Date movie_start_date;
	private Date movie_end_date;
	private String movie_schedule_code;
	public SghMovieTimeAjaxDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
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
	public Date getMovie_start_date() {
		return movie_start_date;
	}
	public void setMovie_start_date(Date movie_start_date) {
		this.movie_start_date = movie_start_date;
	}
	public Date getMovie_end_date() {
		return movie_end_date;
	}
	public void setMovie_end_date(Date movie_end_date) {
		this.movie_end_date = movie_end_date;
	}
	public String getMovie_schedule_code() {
		return movie_schedule_code;
	}
	public void setMovie_schedule_code(String movie_schedule_code) {
		this.movie_schedule_code = movie_schedule_code;
	}
	@Override
	public String toString() {
		return "SghMovieTimeAjaxDto [movie_name=" + movie_name + ", movie_code=" + movie_code + ", theater_name="
				+ theater_name + ", theater_code=" + theater_code + ", movie_start_date=" + movie_start_date
				+ ", movie_end_date=" + movie_end_date + ", movie_schedule_code=" + movie_schedule_code + "]";
	}
	
}
