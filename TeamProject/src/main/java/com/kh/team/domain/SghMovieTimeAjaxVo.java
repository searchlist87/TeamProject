package com.kh.team.domain;

public class SghMovieTimeAjaxVo {
	private String start_date;
	private String movie_code;
	private String theater_code;
	public SghMovieTimeAjaxVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SghMovieTimeAjaxVo(String start_date, String movie_code, String theater_code) {
		super();
		this.start_date = start_date;
		this.movie_code = movie_code;
		this.theater_code = theater_code;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getMovie_code() {
		return movie_code;
	}
	public void setMovie_code(String movie_code) {
		this.movie_code = movie_code;
	}
	public String getTheater_code() {
		return theater_code;
	}
	public void setTheater_code(String theater_code) {
		this.theater_code = theater_code;
	}
	@Override
	public String toString() {
		return "SghMovieTimeAjaxVo [start_date=" + start_date + ", movie_code=" + movie_code + ", theater_code="
				+ theater_code + "]";
	}
}
