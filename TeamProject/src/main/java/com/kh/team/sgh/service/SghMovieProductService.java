package com.kh.team.sgh.service;

import java.util.List;

import com.kh.team.domain.SghMovieProductVo;
import com.kh.team.domain.SghSeatCheckVo;

public interface SghMovieProductService {
	// 영화 상품 목록 가져오기
	public List<SghMovieProductVo> getMovieProductList() throws Exception;
	// 영화 상품 한개의 정보 가져오기
	public SghMovieProductVo getMovieProductInfo(String movie_time_code) throws Exception;
	// 영화 좌석 예약되지 않은것 가져오기
	public List<SghSeatCheckVo> getSeatCheck(String movie_time_code) throws Exception;
}