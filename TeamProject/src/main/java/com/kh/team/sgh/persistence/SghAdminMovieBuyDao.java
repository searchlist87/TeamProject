package com.kh.team.sgh.persistence;

import java.util.List;

import com.kh.team.domain.SghAdminMovieBuyVo;
import com.kh.team.domain.SghBuyCodeDto;
import com.kh.team.domain.SghBuyMovieVo;
import com.kh.team.domain.SghBuyTheaterVo;
import com.kh.team.domain.SghPagingDto;

public interface SghAdminMovieBuyDao {
	
	// 어드민 모든 영화 내역 가져오기
	public List<SghAdminMovieBuyVo> getAdminMovieBuyList(SghPagingDto sghPagingDto) throws Exception;
	// 영화 내역 총 숫자 가져오기
	public int getTotalCount(SghPagingDto sghPagingDto) throws Exception;
	// 영화관 목록 가져오기
	public List<SghBuyTheaterVo> getBuyTheaterList(String area_code) throws Exception;
	// 영화 목록 가져오기
	public List<SghBuyMovieVo> getBuyMovieList(String theater_code) throws Exception;
	// 영화 매출 가져오기
	public int getBuyTotal(SghBuyCodeDto sghBuyCodeDto) throws Exception;
}
