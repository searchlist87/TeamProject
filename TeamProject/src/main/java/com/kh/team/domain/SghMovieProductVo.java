package com.kh.team.domain;

import java.sql.Timestamp;

public class SghMovieProductVo {
	private String movie_time_code;
	private String movie_name;
	private String movie_code;
	private String theater_code;
	private String theater_name;
	private String screen_code;
	private String screen_name;
	private Timestamp movie_start_time;
	private Timestamp movie_end_time;
	private int screen_total_seat;
	private int screen_seat_row;
	private int screen_seat_col;
	private int movie_seat_num;
	public SghMovieProductVo() {
		super();
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
	public String getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
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
	public String getScreen_code() {
		return screen_code;
	}
	public void setScreen_code(String screen_code) {
		this.screen_code = screen_code;
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
	public int getScreen_total_seat() {
		return screen_total_seat;
	}
	public void setScreen_total_seat(int screen_total_seat) {
		this.screen_total_seat = screen_total_seat;
	}
	public int getScreen_seat_row() {
		return screen_seat_row;
	}
	public void setScreen_seat_row(int screen_seat_row) {
		this.screen_seat_row = screen_seat_row;
	}
	public int getScreen_seat_col() {
		return screen_seat_col;
	}
	public void setScreen_seat_col(int screen_seat_col) {
		this.screen_seat_col = screen_seat_col;
	}
	public int getMovie_seat_num() {
		return movie_seat_num;
	}
	public void setMovie_seat_num(int movie_seat_num) {
		this.movie_seat_num = movie_seat_num;
	}
	@Override
	public String toString() {
		return "SghMovieProductVo [movie_time_code=" + movie_time_code + ", movie_name=" + movie_name + ", movie_code="
				+ movie_code + ", theater_code=" + theater_code + ", theater_name=" + theater_name + ", screen_code="
				+ screen_code + ", screen_name=" + screen_name + ", movie_start_time=" + movie_start_time
				+ ", movie_end_time=" + movie_end_time + ", screen_total_seat=" + screen_total_seat
				+ ", screen_seat_row=" + screen_seat_row + ", screen_seat_col=" + screen_seat_col + ", movie_seat_num="
				+ movie_seat_num + "]";
	}
}
