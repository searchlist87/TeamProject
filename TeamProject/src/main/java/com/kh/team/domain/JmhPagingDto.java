package com.kh.team.domain;

import java.sql.Date;

public class JmhPagingDto {
	private int page = 1;
	private int perPage = 6; // 한 페이지당 보여질 글의 갯수
	private int startRow = 1;
	private int endRow = 10;
	private String searchType;
	private String keyword;
	private int totalCount; // 전체 게시글 수
	private int totalPage; // 전체 페이지 수
	private int startPage; // 페이지 블럭에서 시작 페이지
	private int endPage; // 페이지 블럭에서 끝 페이지
	private final int PAGE_BLOCK = 10; // 페이지 블럭 수
	private Date event_date;
	private Date event_end_date;
	

	public Date getEvent_end_date() {
		return event_end_date;
	}

	public void setEvent_end_date(Date event_end_date) {
		this.event_end_date = event_end_date;
	}

	public Date getEvent_date() {
		return event_date;
	}

	public void setEvent_date(Date event_date) {
		this.event_date = event_date;
	}

	public void setPageInfo() {
		// perPage : 10, 15
		// 1, 1, 10 1, 1, 15
		// 2, 11, 20 2, 16, 30
		// 3, 21, 30 3, 31, 45
		this.endRow = page * perPage;
		this.startRow = this.endRow - this.perPage + 1;
		
		// 시작 페이지
		// 현재 페이지가 15 : 11 ~ 20
		this.endPage = (int) (Math.ceil((double)page / PAGE_BLOCK) * PAGE_BLOCK);
		this.startPage = this.endPage - PAGE_BLOCK + 1;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;

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

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		// perPage : 10
		// 500 -> 50
		// 501 -> 51
		// 499 -> 50
		this.totalPage = (int) Math.ceil((double)totalCount / perPage);
		
		// 페이징 블럭에서 끝 페이지 정리 - 
		if(endPage > totalPage) {
			endPage = totalPage;
		}
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "JmhPagingDto [page=" + page + ", perPage=" + perPage + ", startRow=" + startRow + ", endRow=" + endRow
				+ ", searchType=" + searchType + ", keyword=" + keyword + ", totalCount=" + totalCount + ", totalPage="
				+ totalPage + ", startPage=" + startPage + ", endPage=" + endPage + ", PAGE_BLOCK=" + PAGE_BLOCK
				+ ", event_date=" + event_date + ", event_end_date=" + event_end_date + "]";
	}


}
