package com.kh.team.domain;

public class GshPagingDto {
		private int page = 1;
		private int perPage = 12;
		private int startRow = 1;
		private int endRow = 10;
		private String gsh_searchType;
		private String gsh_keyword;
		private int totalCount;
		private int totalPage;
		private int startPage;
		private int endPage;
		private final int PAGE_BLOCK = 10;

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
			if(endPage > totalPage) {
				endPage = totalPage;
			}
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


		public String getGsh_searchType() {
			return gsh_searchType;
		}

		public void setGsh_searchType(String gsh_searchType) {
			this.gsh_searchType = gsh_searchType;
		}

		public String getGsh_keyword() {
			return gsh_keyword;
		}

		public void setGsh_keyword(String gsh_keyword) {
			this.gsh_keyword = gsh_keyword;
		}

		public int getPAGE_BLOCK() {
			return PAGE_BLOCK;
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
			return "GshPagingDto [page=" + page + ", perPage=" + perPage + ", startRow=" + startRow + ", endRow="
					+ endRow + ", gsh_searchType=" + gsh_searchType + ", gsh_keyword=" + gsh_keyword + ", totalCount="
					+ totalCount + ", totalPage=" + totalPage + ", startPage=" + startPage + ", endPage=" + endPage
					+ ", PAGE_BLOCK=" + PAGE_BLOCK + "]";
		}


}
