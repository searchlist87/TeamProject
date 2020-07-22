package com.kh.team.domain;

import java.sql.Date;
import java.sql.Timestamp;

public class SghMovieTimeModifyVo {
	private String movie_schedule_code;
	private String movie_code;
	private String movie_name;
	private String theater_code;
	private String theater_name;
	private Date movie_start_date;
	private Date movie_end_date;
	private String screen_code;
	private Timestamp movie_start_time;
	private Timestamp movie_end_time;
	private String movie_time_code;
	private int screen_total_seat;
	private int screen_seat_col;
	private int screen_seat_row;	
	private int movie_money;	
	
	public SghMovieTimeModifyVo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SghMovieTimeModifyVo(String movie_schedule_code, String movie_code, String movie_name, String theater_code,
			String theater_name, Date movie_start_date, Date movie_end_date, String screen_code,
			Timestamp movie_start_time, Timestamp movie_end_time, String movie_time_code, int screen_total_seat,
			int screen_seat_col, int screen_seat_row, int movie_money) {
		super();
		this.movie_schedule_code = movie_schedule_code;
		this.movie_code = movie_code;
		this.movie_name = movie_name;
		this.theater_code = theater_code;
		this.theater_name = theater_name;
		this.movie_start_date = movie_start_date;
		this.movie_end_date = movie_end_date;
		this.screen_code = screen_code;
		this.movie_start_time = movie_start_time;
		this.movie_end_time = movie_end_time;
		this.movie_time_code = movie_time_code;
		this.screen_total_seat = screen_total_seat;
		this.screen_seat_col = screen_seat_col;
		this.screen_seat_row = screen_seat_row;
		this.movie_money = movie_money;
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

	public String getMovie_time_code() {
		return movie_time_code;
	}

	public void setMovie_time_code(String movie_time_code) {
		this.movie_time_code = movie_time_code;
	}

	public int getScreen_total_seat() {
		return screen_total_seat;
	}

	public void setScreen_total_seat(int screen_total_seat) {
		this.screen_total_seat = screen_total_seat;
	}

	public int getScreen_seat_col() {
		return screen_seat_col;
	}

	public void setScreen_seat_col(int screen_seat_col) {
		this.screen_seat_col = screen_seat_col;
	}

	public int getScreen_seat_row() {
		return screen_seat_row;
	}

	public void setScreen_seat_row(int screen_seat_row) {
		this.screen_seat_row = screen_seat_row;
	}

	public int getMovie_money() {
		return movie_money;
	}

	public void setMovie_money(int movie_money) {
		this.movie_money = movie_money;
	}

	@Override
	public String toString() {
		return "SghMovieTimeModifyVo [movie_schedule_code=" + movie_schedule_code + ", movie_code=" + movie_code
				+ ", movie_name=" + movie_name + ", theater_code=" + theater_code + ", theater_name=" + theater_name
				+ ", movie_start_date=" + movie_start_date + ", movie_end_date=" + movie_end_date + ", screen_code="
				+ screen_code + ", movie_start_time=" + movie_start_time + ", movie_end_time=" + movie_end_time
				+ ", movie_time_code=" + movie_time_code + ", screen_total_seat=" + screen_total_seat
				+ ", screen_seat_col=" + screen_seat_col + ", screen_seat_row=" + screen_seat_row + ", movie_money="
				+ movie_money + "]";
	}

}
