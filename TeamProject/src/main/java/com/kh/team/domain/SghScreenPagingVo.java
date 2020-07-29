package com.kh.team.domain;

public class SghScreenPagingVo {
	private int start_row;
	private int end_row;
	private String theater_code;
	public SghScreenPagingVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getStart_row() {
		return start_row;
	}
	public void setStart_row(int start_row) {
		this.start_row = start_row;
	}
	public int getEnd_row() {
		return end_row;
	}
	public void setEnd_row(int end_row) {
		this.end_row = end_row;
	}
	public String getTheater_code() {
		return theater_code;
	}
	public void setTheater_code(String theater_code) {
		this.theater_code = theater_code;
	}
	@Override
	public String toString() {
		return "SghScreenPagingVo [start_row=" + start_row + ", end_row=" + end_row + ", theater_code=" + theater_code
				+ "]";
	}
}
