package com.kh.team.domain;

public class SghPaymentVo {
	private String theater_name;
	private String movie_name;
	private String movie_code;
	private String screen_code;
	private String screen_name;
	private String movie_time_code;
	private String start_date;
	private String start_time;
	private String end_time;
	private int movie_price;
	private String schedule_seat_code;
	private String user_id;

	public SghPaymentVo() {
		super();
	}

	public SghPaymentVo(String theater_name, String movie_name, String movie_code, String screen_code,
			String screen_name, String movie_time_code, String start_date, String start_time, String end_time,
			int movie_price, String schedule_seat_code, String user_id) {
		super();
		this.theater_name = theater_name;
		this.movie_name = movie_name;
		this.movie_code = movie_code;
		this.screen_code = screen_code;
		this.screen_name = screen_name;
		this.movie_time_code = movie_time_code;
		this.start_date = start_date;
		this.start_time = start_time;
		this.end_time = end_time;
		this.movie_price = movie_price;
		this.schedule_seat_code = schedule_seat_code;
		this.user_id = user_id;
	}

	public String getTheater_name() {
		return theater_name;
	}

	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
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

	public String getMovie_time_code() {
		return movie_time_code;
	}

	public void setMovie_time_code(String movie_time_code) {
		this.movie_time_code = movie_time_code;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getStart_time() {
		return start_time;
	}

	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public String getEnd_time() {
		return end_time;
	}

	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}

	public int getMovie_price() {
		return movie_price;
	}

	public void setMovie_price(int movie_price) {
		this.movie_price = movie_price;
	}

	public String getSchedule_seat_code() {
		return schedule_seat_code;
	}

	public void setSchedule_seat_code(String schedule_seat_code) {
		this.schedule_seat_code = schedule_seat_code;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	@Override
	public String toString() {
		return "SghPaymentVo [theater_name=" + theater_name + ", movie_name=" + movie_name + ", movie_code="
				+ movie_code + ", screen_code=" + screen_code + ", screen_name=" + screen_name + ", movie_time_code="
				+ movie_time_code + ", start_date=" + start_date + ", start_time=" + start_time + ", end_time="
				+ end_time + ", movie_price=" + movie_price + ", schedule_seat_code=" + schedule_seat_code
				+ ", user_id=" + user_id + "]";
	}

}
