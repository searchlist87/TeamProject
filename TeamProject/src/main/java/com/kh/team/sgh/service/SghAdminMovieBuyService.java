package com.kh.team.sgh.service;

import java.util.List;

import com.kh.team.domain.SghAdminMovieBuyVo;

public interface SghAdminMovieBuyService {
	// 어드민 모든 영화 내역 가져오기
	public List<SghAdminMovieBuyVo> getAdminMovieBuyList(int start_row, int end_row) throws Exception;
	// 어드민 키워드에 따라 영화 내역 가져오기
	public List<SghAdminMovieBuyVo> getKeywordMovieBuyList(String keyword, String category) throws Exception;
	// 영화 내역 총 숫자 가져오기
	public int getTotalCount() throws Exception;
}
