package com.kh.team.domain;

import java.sql.Timestamp;

public class SghMovieTimeVo {
	private String movie_time_code;
	private String screen_code;
	private Timestamp movie_start_time;
	private Timestamp movie_end_time;
	private String movie_schedule_code;
	private int movie_money;
	public SghMovieTimeVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SghMovieTimeVo(String movie_time_code, String screen_code, Timestamp movie_start_time,
			Timestamp movie_end_time, String movie_schedule_code, int movie_money) {
		super();
		this.movie_time_code = movie_time_code;
		this.screen_code = screen_code;
		this.movie_start_time = movie_start_time;
		this.movie_end_time = movie_end_time;
		this.movie_schedule_code = movie_schedule_code;
		this.movie_money = movie_money;
	}
	public String getMovie_time_code() {
		return movie_time_code;
	}
	public void setMovie_time_code(String movie_time_code) {
		this.movie_time_code = movie_time_code;
	}
	public String getScreen_code() {
		return screen_code;
	}
	public void setScreen_code(String screen_code) {
		this.screen_code = screen_code;
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
	public int getMovie_money() {
		return movie_money;
	}
	public void setMovie_money(int movie_money) {
		this.movie_money = movie_money;
	}
	@Override
	public String toString() {
		return "SghMovieTimeVo [movie_time_code=" + movie_time_code + ", screen_code=" + screen_code
				+ ", movie_start_time=" + movie_start_time + ", movie_end_time=" + movie_end_time
				+ ", movie_schedule_code=" + movie_schedule_code + ", movie_money=" + movie_money + "]";
	}
}
