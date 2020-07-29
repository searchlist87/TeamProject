package com.kh.team.domain;

public class SghBuyMovieVo {
	private String movie_code;
	private String movie_name;
	public SghBuyMovieVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	@Override
	public String toString() {
		return "SghBuyMovieVo [movie_code=" + movie_code + ", movie_name=" + movie_name + "]";
	}
	
}
