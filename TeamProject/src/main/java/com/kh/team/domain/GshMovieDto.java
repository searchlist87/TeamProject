package com.kh.team.domain;

import java.sql.Timestamp;

public class GshMovieDto {
	
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
	// 개봉일
	private Timestamp movie_open_date;
	// 총시간
	private String movie_total_time;
	// 영화 이미지
	private String movie_main_image;
	// 등록일
	private Timestamp movie_regist_date;
	// 영화 등급
	private String movie_grade;
	// 영화 예고편
	private String movie_preview;
	// 영화 순서
	private String movie_num;
	// 영화 내용
	private String movie_content;
	// 리뷰 번호
	private String review_num;
	// 작성자 아이디
	private String user_id;
	// 리뷰 점수
	private String review_score;
	// 리뷰 내용
	private String review_content;
	// 리뷰 작성일
	private Timestamp review_date;
	// 스틸컷 이미지 불러오기
	private String movie_sub_image;
	
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
	public String getMovie_total_time() {
		return movie_total_time;
	}
	public void setMovie_total_time(String movie_total_time) {
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
	public String getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(String movie_num) {
		this.movie_num = movie_num;
	}
	public String getMovie_content() {
		return movie_content;
	}
	public void setMovie_content(String movie_content) {
		this.movie_content = movie_content;
	}
	public String getReview_num() {
		return review_num;
	}
	public void setReview_num(String review_num) {
		this.review_num = review_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getReview_score() {
		return review_score;
	}
	public void setReview_score(String review_score) {
		this.review_score = review_score;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Timestamp getReview_date() {
		return review_date;
	}
	public void setReview_date(Timestamp review_date) {
		this.review_date = review_date;
	}
	public String getMovie_sub_image() {
		return movie_sub_image;
	}
	public void setMovie_sub_image(String movie_sub_image) {
		this.movie_sub_image = movie_sub_image;
	}
	@Override
	public String toString() {
		return "GshMovieDto [movie_code=" + movie_code + ", movie_name=" + movie_name + ", movie_genre=" + movie_genre
				+ ", movie_director=" + movie_director + ", movie_actor=" + movie_actor + ", movie_open_date="
				+ movie_open_date + ", movie_total_time=" + movie_total_time + ", movie_main_image=" + movie_main_image
				+ ", movie_regist_date=" + movie_regist_date + ", movie_grade=" + movie_grade + ", movie_preview="
				+ movie_preview + ", movie_num=" + movie_num + ", movie_content=" + movie_content + ", review_num="
				+ review_num + ", user_id=" + user_id + ", review_score=" + review_score + ", review_content="
				+ review_content + ", review_date=" + review_date + ", movie_sub_image=" + movie_sub_image + "]";
	}

}
