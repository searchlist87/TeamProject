package com.kh.team.domain;

import java.sql.Timestamp;

public class kdhFoodBuyListDto {
	private String food_buy_check;
	private String food_buy_code;
	private int food_buy_count;
	private Timestamp food_buy_date;
	private int food_buy_list_num;
	private int food_buy_total_price;
	private int food_num;
	private String user_id;
	public kdhFoodBuyListDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public kdhFoodBuyListDto(String food_buy_check, String food_buy_code, int food_buy_count, Timestamp food_buy_date,
			int food_buy_list_num, int food_buy_total_price, int food_num, String user_id) {
		super();
		this.food_buy_check = food_buy_check;
		this.food_buy_code = food_buy_code;
		this.food_buy_count = food_buy_count;
		this.food_buy_date = food_buy_date;
		this.food_buy_list_num = food_buy_list_num;
		this.food_buy_total_price = food_buy_total_price;
		this.food_num = food_num;
		this.user_id = user_id;
	}
	public String getFood_buy_check() {
		return food_buy_check;
	}
	public void setFood_buy_check(String food_buy_check) {
		this.food_buy_check = food_buy_check;
	}
	public String getFood_buy_code() {
		return food_buy_code;
	}
	public void setFood_buy_code(String food_buy_code) {
		this.food_buy_code = food_buy_code;
	}
	public int getFood_buy_count() {
		return food_buy_count;
	}
	public void setFood_buy_count(int food_buy_count) {
		this.food_buy_count = food_buy_count;
	}
	public Timestamp getFood_buy_date() {
		return food_buy_date;
	}
	public void setFood_buy_date(Timestamp food_buy_date) {
		this.food_buy_date = food_buy_date;
	}
	public int getFood_buy_list_num() {
		return food_buy_list_num;
	}
	public void setFood_buy_list_num(int food_buy_list_num) {
		this.food_buy_list_num = food_buy_list_num;
	}
	public int getFood_buy_total_price() {
		return food_buy_total_price;
	}
	public void setFood_buy_total_price(int food_buy_total_price) {
		this.food_buy_total_price = food_buy_total_price;
	}
	public int getFood_num() {
		return food_num;
	}
	public void setFood_num(int food_num) {
		this.food_num = food_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "kdhFoodBuyListDto [food_buy_check=" + food_buy_check + ", food_buy_code=" + food_buy_code
				+ ", food_buy_count=" + food_buy_count + ", food_buy_date=" + food_buy_date + ", food_buy_list_num="
				+ food_buy_list_num + ", food_buy_total_price=" + food_buy_total_price + ", food_num=" + food_num
				+ ", user_id=" + user_id + "]";
	}
	
	
}
