package com.kh.team.domain;

public class SghMovieSeatVo {
	private int movie_seat_num;
	private String seat_code;
	private String screen_code;
	public SghMovieSeatVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SghMovieSeatVo(int movie_seat_num, String seat_code, String screen_code) {
		super();
		this.movie_seat_num = movie_seat_num;
		this.seat_code = seat_code;
		this.screen_code = screen_code;
	}
	public int getMovie_seat_num() {
		return movie_seat_num;
	}
	public void setMovie_seat_num(int movie_seat_num) {
		this.movie_seat_num = movie_seat_num;
	}
	public String getSeat_code() {
		return seat_code;
	}
	public void setSeat_code(String seat_code) {
		this.seat_code = seat_code;
	}
	public String getScreen_code() {
		return screen_code;
	}
	public void setScreen_code(String screen_code) {
		this.screen_code = screen_code;
	}
	@Override
	public String toString() {
		return "SghMovieSeatVo [movie_seat_num=" + movie_seat_num + ", seat_code=" + seat_code + ", screen_code="
				+ screen_code + "]";
	}
	
}
