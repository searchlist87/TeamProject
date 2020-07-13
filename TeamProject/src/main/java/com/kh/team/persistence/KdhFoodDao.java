package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.KdhFoodVo;

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
	
}
