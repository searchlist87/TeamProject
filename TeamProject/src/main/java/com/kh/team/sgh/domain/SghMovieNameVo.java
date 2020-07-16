package com.kh.team.sgh.domain;

public class SghMovieNameVo {

	private String movie_name;
	private String movie_code;

	
	public SghMovieNameVo() {
		super();
	}
	public SghMovieNameVo(String movie_name, String movie_code) {
		super();
		this.movie_name = movie_name;
		this.movie_code = movie_code;
	}
	public SghMovieNameVo(String movie_name) {
		super();
		this.movie_name = movie_name;
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

	@Override
	public String toString() {
		return "SghMovieNameVo [movie_name=" + movie_name + ", movie_code=" + movie_code + "]";
	}
	
}
