package com.kh.team.domain;

import java.sql.Timestamp;

public class kdhFoodBuyDto {

	private int food_buy_count;
	private Timestamp food_buy_date;
	private int food_buy_num;
	private int food_buy_total_price;
	private int food_num;
	private String user_id;
	public kdhFoodBuyDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public kdhFoodBuyDto(int food_buy_count, Timestamp food_buy_date, int food_buy_num, int food_buy_total_price,
			int food_num, String user_id) {
		super();
		this.food_buy_count = food_buy_count;
		this.food_buy_date = food_buy_date;
		this.food_buy_num = food_buy_num;
		this.food_buy_total_price = food_buy_total_price;
		this.food_num = food_num;
		this.user_id = user_id;
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
	public int getFood_buy_num() {
		return food_buy_num;
	}
	public void setFood_buy_num(int food_buy_num) {
		this.food_buy_num = food_buy_num;
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
		return "kdhFoodBuyDto [food_buy_count=" + food_buy_count + ", food_buy_date=" + food_buy_date
				+ ", food_buy_num=" + food_buy_num + ", food_buy_total_price=" + food_buy_total_price + ", food_num="
				+ food_num + ", user_id=" + user_id + "]";
	}
	
	
}
