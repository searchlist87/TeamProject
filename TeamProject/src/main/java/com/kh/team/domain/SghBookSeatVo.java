package com.kh.team.domain;

public class SghBookSeatVo {
	private String schedule_seat_code;
	private String movie_time_code;
	private String movie_seat_num;
	private String movie_seat_code;
	private int screen_seat_row;
	private int screen_seat_col;
	private String seat_check;
	private String seat_code;
	public SghBookSeatVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SghBookSeatVo(String schedule_seat_code, String movie_time_code, String movie_seat_num,
			String movie_seat_code, int screen_seat_row, int screen_seat_col, String seat_check, String seat_code) {
		super();
		this.schedule_seat_code = schedule_seat_code;
		this.movie_time_code = movie_time_code;
		this.movie_seat_num = movie_seat_num;
		this.movie_seat_code = movie_seat_code;
		this.screen_seat_row = screen_seat_row;
		this.screen_seat_col = screen_seat_col;
		this.seat_check = seat_check;
		this.seat_code = seat_code;
	}
	public String getSchedule_seat_code() {
		return schedule_seat_code;
	}
	public void setSchedule_seat_code(String schedule_seat_code) {
		this.schedule_seat_code = schedule_seat_code;
	}
	public String getMovie_time_code() {
		return movie_time_code;
	}
	public void setMovie_time_code(String movie_time_code) {
		this.movie_time_code = movie_time_code;
	}
	public String getMovie_seat_num() {
		return movie_seat_num;
	}
	public void setMovie_seat_num(String movie_seat_num) {
		this.movie_seat_num = movie_seat_num;
	}
	public String getMovie_seat_code() {
		return movie_seat_code;
	}
	public void setMovie_seat_code(String movie_seat_code) {
		this.movie_seat_code = movie_seat_code;
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
	public String getSeat_check() {
		return seat_check;
	}
	public void setSeat_check(String seat_check) {
		this.seat_check = seat_check;
	}
	public String getSeat_code() {
		return seat_code;
	}
	public void setSeat_code(String seat_code) {
		this.seat_code = seat_code;
	}
	@Override
	public String toString() {
		return "SghBookSeatVo [schedule_seat_code=" + schedule_seat_code + ", movie_time_code=" + movie_time_code
				+ ", movie_seat_num=" + movie_seat_num + ", movie_seat_code=" + movie_seat_code + ", screen_seat_row="
				+ screen_seat_row + ", screen_seat_col=" + screen_seat_col + ", seat_check=" + seat_check
				+ ", seat_code=" + seat_code + "]";
	}
	
}
