package com.kh.team.domain;

public class KdhPagingDto {
	private int page = 1; // 현재 페이지 수
	private int perPage = 9; // 몇개씩 나올건지
	private int startRow = 1; // 시작ㄱ ㅔ시글 수
	private int endRow = 9; // 끝 게시글 수
	private int totalCount; // 총 게시글 수
	private int startPage = 1; // 시작 페이지 수
	private int endPage; // 끝 페이지 수
	private int totalPage; // 총 페이지 수 
	private int DisplayPageNum = 10; // 보여질 페이지 수
	private String keyword;
	private String searchType;
	
	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
		
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		this.totalPage = (int) Math.ceil((double) totalCount/perPage);
		
		if(endPage > totalPage) {
			endPage = totalPage;
		}
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

	public int getDisplayPageNum() {
		return DisplayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		DisplayPageNum = displayPageNum;
	}

	public void setPageInfo(int totalCount) {
		this.endRow = page * perPage;
		this.startRow = this.endRow - this.perPage + 1;
//		1 5  2 9
		this.endPage = (int)(Math.ceil((double) page/perPage) * perPage);
		this.startPage = (this.endPage - perPage) + 1;
		
		this.totalCount = totalCount;
		this.totalPage = (int) Math.ceil((double) totalCount/perPage);
		
		if(endPage > totalPage) {
			endPage = totalPage;
		}
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

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	@Override
	public String toString() {
		return "KdhPagingDto [page=" + page + ", perPage=" + perPage + ", startRow=" + startRow + ", endRow=" + endRow
				+ ", totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", totalPage="
				+ totalPage + ", DisplayPageNum=" + DisplayPageNum + ", keyword=" + keyword + ", searchType="
				+ searchType + "]";
	}

	
}
