package com.kh.team.sgh.domain;

public class SghPagingDto {
	private int per_page = 10;
	private int page = 1;
	private int start_row = 1;
	private int end_row = 10;
	private int start_page;
	private int end_page;
	private int total_count;
	private int total_page;
	private String area_code = "all";
	
	public SghPagingDto() {
		super();
	}
	
	public void setPageInfo() {
		this.end_row = page * per_page;
		this.start_row = end_row - (per_page - 1);
		this.end_page = ((page - 1) / 10) * 10 + 10;
		this.start_page = end_page - 9;
		
		if(end_page > total_page) {
			this.end_page = total_page;
		}
	}
	
	public int getPer_page() {
		return per_page;
	}
	public void setPer_page(int per_page) {
		this.per_page = per_page;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
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
	
	public int getTotal_count() {
		return total_count;
	}

	public void setTotal_count(int total_count) {
		this.total_count = total_count;
		this.total_page = (int)Math.ceil((double)total_count / per_page);
	}

	public int getTotal_page() {
		return total_page;
	}

	public void setTotal_page(int total_page) {
		this.total_page = total_page;
	}

	public int getStart_page() {
		return start_page;
	}

	public void setStart_page(int start_page) {
		this.start_page = start_page;
	}

	public int getEnd_page() {
		return end_page;
	}

	public void setEnd_page(int end_page) {
		this.end_page = end_page;
	}
	

	public String getArea_code() {
		return area_code;
	}

	public void setArea_code(String area_code) {
		this.area_code = area_code;
	}

	@Override
	public String toString() {
		return "SghPagingDto [per_page=" + per_page + ", page=" + page + ", start_row=" + start_row + ", end_row="
				+ end_row + ", start_page=" + start_page + ", end_page=" + end_page + ", total_count=" + total_count
				+ ", total_page=" + total_page + ", area_code=" + area_code + "]";
	}

}
