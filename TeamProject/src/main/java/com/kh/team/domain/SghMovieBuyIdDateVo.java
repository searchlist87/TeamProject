package com.kh.team.domain;

import java.sql.Timestamp;

public class SghMovieBuyIdDateVo {
	private String user_id;
	private Timestamp movie_buy_date;
	public SghMovieBuyIdDateVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Timestamp getMovie_buy_date() {
		return movie_buy_date;
	}
	public void setMovie_buy_date(Timestamp movie_buy_date) {
		this.movie_buy_date = movie_buy_date;
	}
	@Override
	public String toString() {
		return "SghMovieBuyIdDateVo [user_id=" + user_id + ", movie_buy_date=" + movie_buy_date + "]";
	}
}
