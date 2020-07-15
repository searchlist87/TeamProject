package com.kh.team.domain;

public class KdhFoodInfoDto {
	private int food_num;
	private int food_price;
	private int food_buy_count;
	
	public KdhFoodInfoDto() {
		super();
	}

	public KdhFoodInfoDto(int food_num, int food_price, int food_buy_count) {
		super();
		this.food_num = food_num;
		this.food_price = food_price;
		this.food_buy_count = food_buy_count;
	}

	public int getFood_num() {
		return food_num;
	}

	public void setFood_num(int food_num) {
		this.food_num = food_num;
	}

	public int getFood_price() {
		return food_price;
	}

	public void setFood_price(int food_price) {
		this.food_price = food_price;
	}

	public int getFood_buy_count() {
		return food_buy_count;
	}

	public void setFood_buy_count(int food_buy_count) {
		this.food_buy_count = food_buy_count;
	}

	@Override
	public String toString() {
		return "KdhFoodInfoVo [food_num=" + food_num + ", food_price=" + food_price + ", food_buy_count="
				+ food_buy_count + "]";
	}
	
}
