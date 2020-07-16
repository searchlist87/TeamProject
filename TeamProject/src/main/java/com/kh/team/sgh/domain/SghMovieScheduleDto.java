package com.kh.team.sgh.domain;

import java.sql.Date;

public class SghMovieScheduleDto {
	private String movie_time_code;
	private String movie_name;
	private String screen_name;
	private int movie_screen_count;
	private Date movie_start_date;
	private Date movie_end_date;
	private String movie_start_time;
	private String screen_total_seat;
	public SghMovieScheduleDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SghMovieScheduleDto(String movie_time_code, String movie_name, String screen_name, int movie_screen_count,
			Date movie_start_date, Date movie_end_date, String movie_start_time, String screen_total_seat) {
		super();
		this.movie_time_code = movie_time_code;
		this.movie_name = movie_name;
		this.screen_name = screen_name;
		this.movie_screen_count = movie_screen_count;
		this.movie_start_date = movie_start_date;
		this.movie_end_date = movie_end_date;
		this.movie_start_time = movie_start_time;
		this.screen_total_seat = screen_total_seat;
	}
	public String getMovie_time_code() {
		return movie_time_code;
	}
	public void setMovie_time_code(String movie_time_code) {
		this.movie_time_code = movie_time_code;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public String getScreen_name() {
		return screen_name;
	}
	public void setScreen_name(String screen_name) {
		this.screen_name = screen_name;
	}
	public int getMovie_screen_count() {
		return movie_screen_count;
	}
	public void setMovie_screen_count(int movie_screen_count) {
		this.movie_screen_count = movie_screen_count;
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
	public String getMovie_start_time() {
		return movie_start_time;
	}
	public void setMovie_start_time(String movie_start_time) {
		this.movie_start_time = movie_start_time;
	}
	public String getScreen_total_seat() {
		return screen_total_seat;
	}
	public void setScreen_total_seat(String screen_total_seat) {
		this.screen_total_seat = screen_total_seat;
	}
	@Override
	public String toString() {
		return "SghMovieScheduleDto [movie_time_code=" + movie_time_code + ", movie_name=" + movie_name
				+ ", screen_name=" + screen_name + ", movie_screen_count=" + movie_screen_count + ", movie_start_date="
				+ movie_start_date + ", movie_end_date=" + movie_end_date + ", movie_start_time=" + movie_start_time
				+ ", screen_total_seat=" + screen_total_seat + "]";
	}
	
	
}
