package com.kh.team.domain;

public class JmhMovieBest3Vo {
	private String movie_code;
	private String movie_main_image;
	private String movie_name;
	
	public String getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
	}
	
	public String getMovie_main_image() {
		return movie_main_image;
	}
	public void setMovie_main_image(String movie_main_image) {
		this.movie_main_image = movie_main_image;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	@Override
	public String toString() {
		return "JmhMovieBest3Vo [movie_code=" + movie_code + ", movie_main_image=" + movie_main_image + ", movie_name="
				+ movie_name + "]";
	}
	
}