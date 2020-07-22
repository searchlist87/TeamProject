package com.kh.team.domain;

public class SghScreenSeatVo {
	private String screen_total_seat;
	private String screen_seat_row;
	private String screen_seat_col;
	
	public SghScreenSeatVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SghScreenSeatVo(String screen_total_seat, String screen_seat_row, String screen_seat_col) {
		super();
		this.screen_total_seat = screen_total_seat;
		this.screen_seat_row = screen_seat_row;
		this.screen_seat_col = screen_seat_col;
	}

	public String getScreen_total_seat() {
		return screen_total_seat;
	}

	public void setScreen_total_seat(String screen_total_seat) {
		this.screen_total_seat = screen_total_seat;
	}

	public String getScreen_seat_row() {
		return screen_seat_row;
	}

	public void setScreen_seat_row(String screen_seat_row) {
		this.screen_seat_row = screen_seat_row;
	}

	public String getScreen_seat_col() {
		return screen_seat_col;
	}

	public void setScreen_seat_col(String screen_seat_col) {
		this.screen_seat_col = screen_seat_col;
	}

	@Override
	public String toString() {
		return "SghScreenSeatVo [screen_total_seat=" + screen_total_seat + ", screen_seat_row=" + screen_seat_row
				+ ", screen_seat_col=" + screen_seat_col + "]";
	}
}
