package com.kh.team.domain;

public class SghSeatCheckVo {
	private String schedule_seat_code;
	private String movie_seat_num;
	private String seat_code;
	private String seat_check;
	private String screen_code;
	private String movie_time_code;
	public SghSeatCheckVo() {
		super();
	}
	public SghSeatCheckVo(String schedule_seat_code, String movie_seat_num, String seat_code, String seat_check,
			String screen_code, String movie_time_code) {
		super();
		this.schedule_seat_code = schedule_seat_code;
		this.movie_seat_num = movie_seat_num;
		this.seat_code = seat_code;
		this.seat_check = seat_check;
		this.screen_code = screen_code;
		this.movie_time_code = movie_time_code;
	}
	public String getSchedule_seat_code() {
		return schedule_seat_code;
	}
	public void setSchedule_seat_code(String schedule_seat_code) {
		this.schedule_seat_code = schedule_seat_code;
	}
	public String getMovie_seat_num() {
		return movie_seat_num;
	}
	public void setMovie_seat_num(String movie_seat_num) {
		this.movie_seat_num = movie_seat_num;
	}
	public String getSeat_code() {
		return seat_code;
	}
	public void setSeat_code(String seat_code) {
		this.seat_code = seat_code;
	}
	public String getSeat_check() {
		return seat_check;
	}
	public void setSeat_check(String seat_check) {
		this.seat_check = seat_check;
	}
	public String getScreen_code() {
		return screen_code;
	}
	public void setScreen_code(String screen_code) {
		this.screen_code = screen_code;
	}
	public String getMovie_time_code() {
		return movie_time_code;
	}
	public void setMovie_time_code(String movie_time_code) {
		this.movie_time_code = movie_time_code;
	}
	@Override
	public String toString() {
		return "SghSeatCheckVo [schedule_seat_code=" + schedule_seat_code + ", movie_seat_num=" + movie_seat_num
				+ ", seat_code=" + seat_code + ", seat_check=" + seat_check + ", screen_code=" + screen_code
				+ ", movie_time_code=" + movie_time_code + "]";
	}
}
