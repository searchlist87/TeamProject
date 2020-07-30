package com.kh.team.domain;

import java.sql.Timestamp;

public class JmhFAQVo {
	private int faq_code;
	private String faq_title;
	private String faq_content;
	private Timestamp faq_date;
	public int getFaq_code() {
		return faq_code;
	}
	public void setFaq_code(int faq_code) {
		this.faq_code = faq_code;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public Timestamp getFaq_date() {
		return faq_date;
	}
	public void setFaq_date(Timestamp faq_date) {
		this.faq_date = faq_date;
	}
	@Override
	public String toString() {
		return "JmhFAQVo [faq_code=" + faq_code + ", faq_title=" + faq_title + ", faq_content=" + faq_content
				+ ", faq_date=" + faq_date + "]";
	}
}