package com.kh.team.persistence;

import java.util.List;
import java.util.Map;

import com.kh.team.domain.KdhFoodVo;
import com.kh.team.domain.KdhPagingDto;

public interface KdhFoodDao {

	// 상품 전체 조회
	public List<KdhFoodVo> listFood() throws Exception;
	
	// 해당 상품 조회
	public KdhFoodVo selectFoodbyNum(int food_num) throws Exception;
		
	// 상품 등록
	public void insertFood(KdhFoodVo foodVo) throws Exception;
	
	// 상품 수정
	public void updateFood(KdhFoodVo foodVo) throws Exception;
	
	// 상품 삭제
	
	// food number 100(스낵)만 선택
	public List<KdhFoodVo> listFoodCode100() throws Exception;
	
	// food number 200(음료)만 선택
	public List<KdhFoodVo> listFoodCode200() throws Exception;
	
	// food number 300(패키지)만 선택
	public List<KdhFoodVo> listFoodCode300() throws Exception;
	
	// 최근 상품 3개 구하기
	public List<KdhFoodVo> listLatestFood() throws Exception;
	
	// (페이징)상품 9개씩 나오기
	public List<KdhFoodVo> listPage(KdhPagingDto pagingDto) throws Exception;

	// 상품 총 개수 구하기
	public int foodCount() throws Exception;
}
