package com.kh.team.sgh.persistence;

import java.util.List;

import com.kh.team.domain.SghMovieProductVo;
import com.kh.team.domain.SghPagingDto;
import com.kh.team.domain.SghPaymentVo;
import com.kh.team.domain.SghSeatCheckVo;

public interface SghMovieProductDao {
	
	// 기간이 지나지 않은 영화 상품 목록 가져오기
	public List<SghMovieProductVo> getMovieProductList(SghPagingDto sghPagingDto) throws Exception;
	// 기간이 지난영화 상품 목록 가져오기
	public List<SghMovieProductVo> getOutProductList(SghPagingDto sghPagingDto) throws Exception;
	// 기간이 지나지 않은 영화 총 숫자
	public int getMovieProductTotal() throws Exception;
	// 기간이 지난 영화 총 숫자
	public int getOutProductTotal() throws Exception;
	// 영화 상품 한개의 정보 가져오기
	public SghMovieProductVo getMovieProductInfo(String movie_time_code) throws Exception;
	// 영화 좌석 예약되지 않은것 가져오기
	public List<SghSeatCheckVo> getSeatCheck(String movie_time_code) throws Exception;
}
