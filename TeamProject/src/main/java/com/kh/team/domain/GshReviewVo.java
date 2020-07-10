package com.kh.team.domain;

import java.sql.Timestamp;

public class GshReviewVo {
	
	private int review_num;
	private String movie_code;
	private String user_id;
	private int review_score;
	private String review_content;
	private Timestamp review_date;
	
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public String getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getReview_score() {
		return review_score;
	}
	public void setReview_score(int review_score) {
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
	
	@Override
	public String toString() {
		return "GshReviewVo [review_num=" + review_num + ", movie_code=" + movie_code + ", user_id=" + user_id
				+ ", review_score=" + review_score + ", review_content=" + review_content + ", review_date="
				+ review_date + "]";
	}
	
}
