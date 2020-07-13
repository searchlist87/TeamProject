package com.kh.team.domain;

public class KdhPagingDto {
	private int page = 1;
	private int perPage = 9;
	private int startRow = 1;
	private int endRow = 10;

	public void setPageInfo() {
		this.endRow = page * perPage;
		this.startRow = this.endRow - this.perPage + 1;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
//		1 1 9
//		2 10 18
//		3 19 27
		this.page = page;
		this.endRow = page * perPage;
		this.startRow = this.endRow - this.perPage + 1;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	@Override
	public String toString() {
		return "KdhPagingDto [page=" + page + ", perPage=" + perPage + ", startRow=" + startRow + ", endRow=" + endRow
				+ "]";
	}

	
}
