package com.kh.team.domain;

import java.sql.Date;

public class SghScheduleListDto {
	
	// 상영 일정 조회하러 갈 때 필요한 movie 정보 담는 곳
	
	private String movie_code;
	private String movie_name;
	private Date movie_open_date;
	public SghScheduleListDto() {
		super();
	}
	public SghScheduleListDto(String movie_code, String movie_name, Date movie_open_date) {
		super();
		this.movie_code = movie_code;
		this.movie_name = movie_name;
		this.movie_open_date = movie_open_date;
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
	public Date getMovie_open_date() {
		return movie_open_date;
	}
	public void setMovie_open_date(Date movie_open_date) {
		this.movie_open_date = movie_open_date;
	}
	@Override
	public String toString() {
		return "SghScheduleListDto [movie_code=" + movie_code + ", movie_name=" + movie_name + ", movie_open_date="
				+ movie_open_date + "]";
	}
}
