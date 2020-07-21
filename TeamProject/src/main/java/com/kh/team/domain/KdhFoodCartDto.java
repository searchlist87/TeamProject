package com.kh.team.domain;

import java.sql.Timestamp;

public class KdhFoodCartDto {
	private int buy_food_price;
	private int food_cart_count;
	private Timestamp food_cart_date;
	private int food_cart_num;
	private String user_id;
	private int food_num;
	private String food_name;
	private int food_price;
	private String food_image;
	private int food_count;
	public KdhFoodCartDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public KdhFoodCartDto(int buy_food_price, int food_cart_count, Timestamp food_cart_date, int food_cart_num,
			String user_id, int food_num, String food_name, int food_price, String food_image, int food_count) {
		super();
		this.buy_food_price = buy_food_price;
		this.food_cart_count = food_cart_count;
		this.food_cart_date = food_cart_date;
		this.food_cart_num = food_cart_num;
		this.user_id = user_id;
		this.food_num = food_num;
		this.food_name = food_name;
		this.food_price = food_price;
		this.food_image = food_image;
		this.food_count = food_count;
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
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getFood_num() {
		return food_num;
	}
	public void setFood_num(int food_num) {
		this.food_num = food_num;
	}
	public String getFood_name() {
		return food_name;
	}
	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}
	public int getFood_price() {
		return food_price;
	}
	public void setFood_price(int food_price) {
		this.food_price = food_price;
	}
	public String getFood_image() {
		return food_image;
	}
	public void setFood_image(String food_image) {
		this.food_image = food_image;
	}
	public int getFood_count() {
		return food_count;
	}
	public void setFood_count(int food_count) {
		this.food_count = food_count;
	}
	@Override
	public String toString() {
		return "KdhFoodCartDto [buy_food_price=" + buy_food_price + ", food_cart_count=" + food_cart_count
				+ ", food_cart_date=" + food_cart_date + ", food_cart_num=" + food_cart_num + ", user_id=" + user_id
				+ ", food_num=" + food_num + ", food_name=" + food_name + ", food_price=" + food_price + ", food_image="
				+ food_image + ", food_count=" + food_count + "]";
	}
	
	
}
