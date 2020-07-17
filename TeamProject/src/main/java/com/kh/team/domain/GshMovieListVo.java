package com.kh.team.domain;

import java.sql.Timestamp;

// 영화 - 베스트, 신작, 상영작
public class GshMovieListVo {
	
	// 영화 코드
	private String movie_code;
	// 영화 이름
	private String movie_name;
	// 영화 장르
	private String movie_genre;
	// 영화 감독
	private String movie_director;
	// 영화 배우
	private String movie_actor;
	// 영화 개봉날짜
	private Timestamp movie_open_date;
	// 영화 상영 시간
	private int movie_total_time;
	// 영화 메인 이미지
	private String movie_main_image;
	// 영화 등록일
	private Timestamp movie_regist_date;
	// 영화 등급
	private String movie_grade;
	// 영화 예고편
	private String movie_preview;
	// 영화 순서
	private int movie_num;
	
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
	public String getMovie_genre() {
		return movie_genre;
	}
	public void setMovie_genre(String movie_genre) {
		this.movie_genre = movie_genre;
	}
	public String getMovie_director() {
		return movie_director;
	}
	public void setMovie_director(String movie_director) {
		this.movie_director = movie_director;
	}
	public String getMovie_actor() {
		return movie_actor;
	}
	public void setMovie_actor(String movie_actor) {
		this.movie_actor = movie_actor;
	}
	public Timestamp getMovie_open_date() {
		return movie_open_date;
	}
	public void setMovie_open_date(Timestamp movie_open_date) {
		this.movie_open_date = movie_open_date;
	}
	public int getMovie_total_time() {
		return movie_total_time;
	}
	public void setMovie_total_time(int movie_total_time) {
		this.movie_total_time = movie_total_time;
	}
	public String getMovie_main_image() {
		return movie_main_image;
	}
	public void setMovie_main_image(String movie_main_image) {
		this.movie_main_image = movie_main_image;
	}
	public Timestamp getMovie_regist_date() {
		return movie_regist_date;
	}
	public void setMovie_regist_date(Timestamp movie_regist_date) {
		this.movie_regist_date = movie_regist_date;
	}
	public String getMovie_grade() {
		return movie_grade;
	}
	public void setMovie_grade(String movie_grade) {
		this.movie_grade = movie_grade;
	}
	public String getMovie_preview() {
		return movie_preview;
	}
	public void setMovie_preview(String movie_preview) {
		this.movie_preview = movie_preview;
	}
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	@Override
	public String toString() {
		return "GshMovieListVo [movie_code=" + movie_code + ", movie_name=" + movie_name + ", movie_genre="
				+ movie_genre + ", movie_director=" + movie_director + ", movie_actor=" + movie_actor
				+ ", movie_open_date=" + movie_open_date + ", movie_total_time=" + movie_total_time
				+ ", movie_main_image=" + movie_main_image + ", movie_regist_date=" + movie_regist_date
				+ ", movie_grade=" + movie_grade + ", movie_preview=" + movie_preview + ", movie_num=" + movie_num
				+ "]";
	}
	
}
