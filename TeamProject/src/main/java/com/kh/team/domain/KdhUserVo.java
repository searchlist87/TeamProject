package com.kh.team.domain;

import java.sql.Timestamp;

public class KdhUserVo {
	private String user_address;
	private String user_birth;
	private String user_class;
	private String user_email;
	private String user_gender;
	private String user_id;
	private Timestamp user_join_date;
	private String user_name;
	private int user_num;
	private Timestamp user_out_check;
	private String user_phone;
	private int user_point;
	private String user_pw;
	private String user_sms_check;
	private int user_total_money;
	public KdhUserVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public KdhUserVo(String user_address, String user_birth, String user_class, String user_email, String user_gender,
			String user_id, Timestamp user_join_date, String user_name, int user_num, Timestamp user_out_check,
			String user_phone, int user_point, String user_pw, String user_sms_check, int user_total_money) {
		super();
		this.user_address = user_address;
		this.user_birth = user_birth;
		this.user_class = user_class;
		this.user_email = user_email;
		this.user_gender = user_gender;
		this.user_id = user_id;
		this.user_join_date = user_join_date;
		this.user_name = user_name;
		this.user_num = user_num;
		this.user_out_check = user_out_check;
		this.user_phone = user_phone;
		this.user_point = user_point;
		this.user_pw = user_pw;
		this.user_sms_check = user_sms_check;
		this.user_total_money = user_total_money;
	}
	public String getUser_address() {
		return user_address;
	}
	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	public String getUser_class() {
		return user_class;
	}
	public void setUser_class(String user_class) {
		this.user_class = user_class;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Timestamp getUser_join_date() {
		return user_join_date;
	}
	public void setUser_join_date(Timestamp user_join_date) {
		this.user_join_date = user_join_date;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public Timestamp getUser_out_check() {
		return user_out_check;
	}
	public void setUser_out_check(Timestamp user_out_check) {
		this.user_out_check = user_out_check;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public int getUser_point() {
		return user_point;
	}
	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_sms_check() {
		return user_sms_check;
	}
	public void setUser_sms_check(String user_sms_check) {
		this.user_sms_check = user_sms_check;
	}
	public int getUser_total_money() {
		return user_total_money;
	}
	public void setUser_total_money(int user_total_money) {
		this.user_total_money = user_total_money;
	}
	@Override
	public String toString() {
		return "KdhUserVo [user_address=" + user_address + ", user_birth=" + user_birth + ", user_class=" + user_class
				+ ", user_email=" + user_email + ", user_gender=" + user_gender + ", user_id=" + user_id
				+ ", user_join_date=" + user_join_date + ", user_name=" + user_name + ", user_num=" + user_num
				+ ", user_out_check=" + user_out_check + ", user_phone=" + user_phone + ", user_point=" + user_point
				+ ", user_pw=" + user_pw + ", user_sms_check=" + user_sms_check + ", user_total_money="
				+ user_total_money + "]";
	}
	
	
}
