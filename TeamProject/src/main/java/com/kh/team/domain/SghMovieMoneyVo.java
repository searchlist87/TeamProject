package com.kh.team.domain;

public class SghMovieMoneyVo {
	private String movie_time_code;
	private int movie_money;
	public SghMovieMoneyVo() {
		super();
	}
	public SghMovieMoneyVo(String movie_time_code, int movie_money) {
		super();
		this.movie_time_code = movie_time_code;
		this.movie_money = movie_money;
	}
	public String getMovie_time_code() {
		return movie_time_code;
	}
	public void setMovie_time_code(String movie_time_code) {
		this.movie_time_code = movie_time_code;
	}
	public int getMovie_money() {
		return movie_money;
	}
	public void setMovie_money(int movie_money) {
		this.movie_money = movie_money;
	}
	@Override
	public String toString() {
		return "SghMovieMoneyVo [movie_time_code=" + movie_time_code + ", movie_money=" + movie_money + "]";
	}
}
