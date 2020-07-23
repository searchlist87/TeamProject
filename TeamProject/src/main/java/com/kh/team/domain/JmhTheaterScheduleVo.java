package com.kh.team.domain;

import java.sql.Timestamp;

public class JmhTheaterScheduleVo {
	private String movie_time_code;
	private String movie_schedule_code;
	private String screen_code;
	private String start_date;
	private String start_time;
	private Timestamp movie_end_time;
	private String movie_code;
	private String movie_name;
	private String movie_grade;
	private String screen_name;
	private int screen_total_seat;
	private int rmn_sts;
	public int getRmn_sts() {
		return rmn_sts;
	}
	public void setRmn_sts(int rmn_sts) {
		this.rmn_sts = rmn_sts;
	}
	public String getMovie_time_code() {
		return movie_time_code;
	}
	public void setMovie_time_code(String movie_time_code) {
		this.movie_time_code = movie_time_code;
	}
	public String getMovie_schedule_code() {
		return movie_schedule_code;
	}
	public void setMovie_schedule_code(String movie_schedule_code) {
		this.movie_schedule_code = movie_schedule_code;
	}
	public String getScreen_code() {
		return screen_code;
	}
	public void setScreen_code(String screen_code) {
		this.screen_code = screen_code;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public Timestamp getMovie_end_time() {
		return movie_end_time;
	}
	public void setMovie_end_time(Timestamp movie_end_time) {
		this.movie_end_time = movie_end_time;
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
	public String getMovie_grade() {
		return movie_grade;
	}
	public void setMovie_grade(String movie_grade) {
		this.movie_grade = movie_grade;
	}
	public String getScreen_name() {
		return screen_name;
	}
	public void setScreen_name(String screen_name) {
		this.screen_name = screen_name;
	}
	public int getScreen_total_seat() {
		return screen_total_seat;
	}
	public void setScreen_total_seat(int screen_total_seat) {
		this.screen_total_seat = screen_total_seat;
	}
	@Override
	public String toString() {
		return "JmhTheaterScheduleVo [movie_time_code=" + movie_time_code + ", movie_schedule_code="
				+ movie_schedule_code + ", screen_code=" + screen_code + ", start_date=" + start_date + ", start_time="
				+ start_time + ", movie_end_time=" + movie_end_time + ", movie_code=" + movie_code + ", movie_name="
				+ movie_name + ", movie_grade=" + movie_grade + ", screen_name=" + screen_name + ", screen_total_seat="
				+ screen_total_seat + ", rmn_sts=" + rmn_sts + "]";
	}
	
}
