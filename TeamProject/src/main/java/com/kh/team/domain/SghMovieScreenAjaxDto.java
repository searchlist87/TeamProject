package com.kh.team.domain;

public class SghMovieScreenAjaxDto {
	private String screen_code;
	private String theater_code;
	private String screen_name;
	private int screen_total_seat;
	private int screen_seat_row;
	private int screen_seat_col;
	public SghMovieScreenAjaxDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SghMovieScreenAjaxDto(String screen_code, String theater_code, String screen_name, int screen_total_seat,
			int screen_seat_row, int screen_seat_col) {
		super();
		this.screen_code = screen_code;
		this.theater_code = theater_code;
		this.screen_name = screen_name;
		this.screen_total_seat = screen_total_seat;
		this.screen_seat_row = screen_seat_row;
		this.screen_seat_col = screen_seat_col;
	}
	public String getScreen_code() {
		return screen_code;
	}
	public void setScreen_code(String screen_code) {
		this.screen_code = screen_code;
	}
	public String getTheater_code() {
		return theater_code;
	}
	public void setTheater_code(String theater_code) {
		this.theater_code = theater_code;
	}
	public String getScreen_name() {
		return screen_name;
	}
	public void setScreen_name(String screen_name) {
		this.screen_name = screen_name;
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
	@Override
	public String toString() {
		return "SghMovieScreenAjaxDto [screen_code=" + screen_code + ", theater_code=" + theater_code + ", screen_name="
				+ screen_name + ", screen_total_seat=" + screen_total_seat + ", screen_seat_row=" + screen_seat_row
				+ ", screen_seat_col=" + screen_seat_col + "]";
	}
	
}
