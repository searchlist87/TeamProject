package com.kh.team.domain;

public class SghAdminMovieBuyVo {
	private String movie_buy_num;
	private String movie_name;
	private String movie_price;
	private String movie_buy_date;
	private String user_id;
	private String movie_buy_check;
	private String theater_name;
	private String area_name;
	public SghAdminMovieBuyVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SghAdminMovieBuyVo(String movie_buy_num, String movie_name, String movie_price, String movie_buy_date,
			String user_id, String movie_buy_check, String theater_name, String area_name) {
		super();
		this.movie_buy_num = movie_buy_num;
		this.movie_name = movie_name;
		this.movie_price = movie_price;
		this.movie_buy_date = movie_buy_date;
		this.user_id = user_id;
		this.movie_buy_check = movie_buy_check;
		this.theater_name = theater_name;
		this.area_name = area_name;
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
	public String getMovie_price() {
		return movie_price;
	}
	public void setMovie_price(String movie_price) {
		this.movie_price = movie_price;
	}
	public String getMovie_buy_date() {
		return movie_buy_date;
	}
	public void setMovie_buy_date(String movie_buy_date) {
		this.movie_buy_date = movie_buy_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getMovie_buy_check() {
		return movie_buy_check;
	}
	public void setMovie_buy_check(String movie_buy_check) {
		this.movie_buy_check = movie_buy_check;
	}
	public String getTheater_name() {
		return theater_name;
	}
	public void setTheater_name(String theater_name) {
		this.theater_name = theater_name;
	}
	public String getArea_name() {
		return area_name;
	}
	public void setArea_name(String area_name) {
		this.area_name = area_name;
	}
	@Override
	public String toString() {
		return "SghAdminMovieBuyVo [movie_buy_num=" + movie_buy_num + ", movie_name=" + movie_name + ", movie_price="
				+ movie_price + ", movie_buy_date=" + movie_buy_date + ", user_id=" + user_id + ", movie_buy_check="
				+ movie_buy_check + ", theater_name=" + theater_name + ", area_name=" + area_name + "]";
	}
}
