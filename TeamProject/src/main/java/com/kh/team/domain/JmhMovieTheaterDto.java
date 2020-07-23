package com.kh.team.domain;

public class JmhMovieTheaterDto {
	private String movie_name;
	private String movie_code;
	private String movie_grade;
	
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
	
	public String getMovie_grade() {
		return movie_grade;
	}
	public void setMovie_grade(String movie_grade) {
		this.movie_grade = movie_grade;
	}
	@Override
	public String toString() {
		return "JmhMovieTheaterDto [movie_name=" + movie_name + ", movie_code=" + movie_code + ", movie_grade="
				+ movie_grade + "]";
	}
}