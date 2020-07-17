package com.kh.team.domain;

import java.sql.Date;

public class JmhEventVo {
	private int event_code;
	private String event_title;
	private String event_content;
	private Date event_start_date;
	private Date event_end_date;
	private String event_thumb_image;
	private String event_content_image;
	public int getEvent_code() {
		return event_code;
	}
	public void setEvent_code(int event_code) {
		this.event_code = event_code;
	}
	public String getEvent_title() {
		return event_title;
	}
	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}
	public String getEvent_content() {
		return event_content;
	}
	public void setEvent_content(String event_content) {
		this.event_content = event_content;
	}
	public Date getEvent_start_date() {
		return event_start_date;
	}
	public void setEvent_start_date(Date event_start_date) {
		this.event_start_date = event_start_date;
	}
	public Date getEvent_end_date() {
		return event_end_date;
	}
	public void setEvent_end_date(Date event_end_date) {
		this.event_end_date = event_end_date;
	}
	public String getEvent_thumb_image() {
		return event_thumb_image;
	}
	public void setEvent_thumb_image(String event_thumb_image) {
		this.event_thumb_image = event_thumb_image;
	}
	public String getEvent_content_image() {
		return event_content_image;
	}
	public void setEvent_content_image(String event_content_image) {
		this.event_content_image = event_content_image;
	}
	@Override
	public String toString() {
		return "JmhEventVo [event_code=" + event_code + ", event_title=" + event_title + ", event_content="
				+ event_content + ", event_start_date=" + event_start_date + ", event_end_date=" + event_end_date
				+ ", event_thumb_image=" + event_thumb_image + ", event_content_image=" + event_content_image + "]";
	}
	
	
}
