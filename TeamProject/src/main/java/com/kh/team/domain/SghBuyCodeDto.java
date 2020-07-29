package com.kh.team.domain;

public class SghBuyCodeDto {
	private String movie_code = "all";
	private String theater_code = "all";
	private String area_code = "all";
	private int mm_minus = 0;
	public SghBuyCodeDto() {
		super();
		// TODO Auto-generated constructor stub
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
	public String getArea_code() {
		return area_code;
	}
	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}
	public int getMm_minus() {
		return mm_minus;
	}
	public void setMm_minus(int mm_minus) {
		this.mm_minus = mm_minus;
	}
	@Override
	public String toString() {
		return "SghBuyCodeDto [movie_code=" + movie_code + ", theater_code=" + theater_code + ", area_code=" + area_code
				+ ", mm_minus=" + mm_minus + "]";
	}
	
}
