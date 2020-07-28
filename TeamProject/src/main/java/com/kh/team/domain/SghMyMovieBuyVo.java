package com.kh.team.domain;

import java.sql.Timestamp;

public class SghMyMovieBuyVo {
	private String movie_buy_num;
	private String movie_name;
	private int movie_price;
	private Timestamp movie_buy_date;
	public SghMyMovieBuyVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SghMyMovieBuyVo(String movie_buy_num, String movie_name, int movie_price, Timestamp movie_buy_date) {
		super();
		this.movie_buy_num = movie_buy_num;
		this.movie_name = movie_name;
		this.movie_price = movie_price;
		this.movie_buy_date = movie_buy_date;
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
	public int getMovie_price() {
		return movie_price;
	}
	public void setMovie_price(int movie_price) {
		this.movie_price = movie_price;
	}
	public Timestamp getMovie_buy_date() {
		return movie_buy_date;
	}
	public void setMovie_buy_date(Timestamp movie_buy_date) {
		this.movie_buy_date = movie_buy_date;
	}
	@Override
	public String toString() {
		return "SghMyMovieBuyListVo [movie_buy_num=" + movie_buy_num + ", movie_name=" + movie_name + ", movie_price="
				+ movie_price + ", movie_buy_date=" + movie_buy_date + "]";
	}
}
