package com.kh.team.domain;

import java.util.Arrays;

public class SghChoiceSeatDto {
	private String[] schedule_code_arr;
	private String[] schedule_text_arr;
	private int personnel;
	public SghChoiceSeatDto() {
		super();
	}
	public SghChoiceSeatDto(String[] schedule_code_arr, String[] schedule_text_arr, int personnel) {
		super();
		this.schedule_code_arr = schedule_code_arr;
		this.schedule_text_arr = schedule_text_arr;
		this.personnel = personnel;
	}
	public String[] getSchedule_code_arr() {
		return schedule_code_arr;
	}
	public void setSchedule_code_arr(String[] schedule_code_arr) {
		this.schedule_code_arr = schedule_code_arr;
	}
	public String[] getSchedule_text_arr() {
		return schedule_text_arr;
	}
	public void setSchedule_text_arr(String[] schedule_text_arr) {
		this.schedule_text_arr = schedule_text_arr;
	}
	public int getPersonnel() {
		return personnel;
	}
	public void setPersonnel(int personnel) {
		this.personnel = personnel;
	}
	@Override
	public String toString() {
		return "SghPaymentDto [schedule_code_arr=" + Arrays.toString(schedule_code_arr) + ", schedule_text_arr="
				+ Arrays.toString(schedule_text_arr) + ", personnel=" + personnel + "]";
	}
}
