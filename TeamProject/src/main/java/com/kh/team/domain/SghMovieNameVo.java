package com.kh.team.domain;

public class SghMovieNameVo {

	private String movie_name;

	
	public SghMovieNameVo() {
		super();
		// TODO Auto-generated constructor stub
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


	@Override
	public String toString() {
		return "SghMovieNameVo [movie_name=" + movie_name + "]";
	}
	
}
