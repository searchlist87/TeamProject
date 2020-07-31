package com.kh.team.domain;

import java.sql.Timestamp;

public class SghBuyListVo {
	private String movie_buy_num;
	private String movie_name;
	private Timestamp movie_buy_date;
	private String theater_name;
	private String screen_name;
	private Timestamp movie_start_time;
	private Timestamp movie_end_time;
	private String seat_code;
	public SghBuyListVo() {
		super();
	}
	public String getMovie_buy_num() {
		return movie_buy_num;
	}
	public void setMovie_buy_num(String movie_buy_num) {
		this.movie_buy_num = movie_buy_num;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public Timestamp getMovie_buy_date() {
		return movie_buy_date;
	}
	public void setMovie_buy_date(Timestamp movie_buy_date) {
		this.movie_buy_date = movie_buy_date;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public String getScreen_name() {
		return screen_name;
	}
	public void setScreen_name(String screen_name) {
		this.screen_name = screen_name;
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
	public String getSeat_code() {
		return seat_code;
	}
	public void setSeat_code(String seat_code) {
		this.seat_code = seat_code;
	}
	@Override
	public String toString() {
		return "BuyListVo [movie_buy_num=" + movie_buy_num + ", movie_name=" + movie_name + ", movie_buy_date="
				+ movie_buy_date + ", theater_name=" + theater_name + ", screen_name=" + screen_name
				+ ", movie_start_time=" + movie_start_time + ", movie_end_time=" + movie_end_time + ", seat_code="
				+ seat_code + "]";
	}
}
