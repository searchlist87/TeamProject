package com.kh.team.domain;

import java.sql.Timestamp;

public class KdhBasicCartDto {
	private int buy_food_price;
	private int food_cart_count;
	private Timestamp food_cart_date;
	private int food_cart_num;
	private int food_num;
	private String user_id;
	public KdhBasicCartDto() {
		super();
	}
	public KdhBasicCartDto(int buy_food_price, int food_cart_count, Timestamp food_cart_date, int food_cart_num,
			int food_num, String user_id) {
		super();
		this.buy_food_price = buy_food_price;
		this.food_cart_count = food_cart_count;
		this.food_cart_date = food_cart_date;
		this.food_cart_num = food_cart_num;
		this.food_num = food_num;
		this.user_id = user_id;
	}
	public int getBuy_food_price() {
		return buy_food_price;
	}
	public void setBuy_food_price(int buy_food_price) {
		this.buy_food_price = buy_food_price;
	}
	public int getFood_cart_count() {
		return food_cart_count;
	}
	public void setFood_cart_count(int food_cart_count) {
		this.food_cart_count = food_cart_count;
	}
	public Timestamp getFood_cart_date() {
		return food_cart_date;
	}
	public void setFood_cart_date(Timestamp food_cart_date) {
		this.food_cart_date = food_cart_date;
	}
	public int getFood_cart_num() {
		return food_cart_num;
	}
	public void setFood_cart_num(int food_cart_num) {
		this.food_cart_num = food_cart_num;
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
		return "KdhBasicCartDto [buy_food_price=" + buy_food_price + ", food_cart_count=" + food_cart_count
				+ ", food_cart_date=" + food_cart_date + ", food_cart_num=" + food_cart_num + ", food_num=" + food_num
				+ ", user_id=" + user_id + "]";
	}
	
	
}
