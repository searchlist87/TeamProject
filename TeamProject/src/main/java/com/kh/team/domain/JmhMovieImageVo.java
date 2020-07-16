package com.kh.team.domain;

public class JmhMovieImageVo {
	private String movie_code;
	private String movie_sub_image;
	
	public String getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
	}
	public String getMovie_sub_image() {
		return movie_sub_image;
	}
	public void setMovie_sub_image(String movie_sub_image) {
		this.movie_sub_image = movie_sub_image;
	}
	@Override
	public String toString() {
		return "JmhMovieImageVo [movie_code=" + movie_code + ", movie_sub_image=" + movie_sub_image + "]";
	}
	
}