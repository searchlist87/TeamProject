package com.kh.team.domain;

import java.sql.Timestamp;

public class SghMovieTimeListVo {
	private String movie_time_code;
	private Timestamp movie_start_time;
	private Timestamp movie_end_time;
	private String movie_schedule_code;
	private String movie_code;
	private String movie_name;
	private String screen_name;
	private String theater_name;
	private int movie_money;
	public SghMovieTimeListVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SghMovieTimeListVo(String movie_time_code, Timestamp movie_start_time, Timestamp movie_end_time,
			String movie_schedule_code, String movie_code, String movie_name, String screen_name, String theater_name,
			int movie_money) {
		super();
		this.movie_time_code = movie_time_code;
		this.movie_start_time = movie_start_time;
		this.movie_end_time = movie_end_time;
		this.movie_schedule_code = movie_schedule_code;
		this.movie_code = movie_code;
		this.movie_name = movie_name;
		this.screen_name = screen_name;
		this.theater_name = theater_name;
		this.movie_money = movie_money;
	}
	public String getMovie_time_code() {
		return movie_time_code;
	}
	public void setMovie_time_code(String movie_time_code) {
		this.movie_time_code = movie_time_code;
	}
	public Timestamp getMovie_start_time() {
		return movie_start_time;
	}
	public void setMovie_start_time(Timestamp movie_start_time) {
		this.movie_start_time = movie_start_time;
	}
	public Timestamp getMovie_end_time() {
		return movie_end_time;
	}
	public void setMovie_end_time(Timestamp movie_end_time) {
		this.movie_end_time = movie_end_time;
	}
	public String getMovie_schedule_code() {
		return movie_schedule_code;
	}
	public void setMovie_schedule_code(String movie_schedule_code) {
		this.movie_schedule_code = movie_schedule_code;
	}
	public String getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
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
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public int getMovie_money() {
		return movie_money;
	}
	public void setMovie_money(int movie_money) {
		this.movie_money = movie_money;
	}
	@Override
	public String toString() {
		return "SghMovieTimeListVo [movie_time_code=" + movie_time_code + ", movie_start_time=" + movie_start_time
				+ ", movie_end_time=" + movie_end_time + ", movie_schedule_code=" + movie_schedule_code
				+ ", movie_code=" + movie_code + ", movie_name=" + movie_name + ", screen_name=" + screen_name
				+ ", theater_name=" + theater_name + ", movie_money=" + movie_money + "]";
	}
	
}
