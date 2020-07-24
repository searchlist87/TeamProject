package com.kh.team.persistence;

import java.util.List;
import java.util.Map;

import com.kh.team.domain.KdhBuyFoodInfo;
import com.kh.team.domain.KdhFoodVo;
import com.kh.team.domain.KdhPagingDto;
import com.kh.team.domain.KdhUserVo;
import com.kh.team.domain.SghUserVo;
import com.kh.team.domain.kdhFoodBuyDto;
import com.kh.team.domain.kdhFoodBuyListDto;

public interface KdhFoodDao {

	// 상품 전체 조회
	public List<KdhFoodVo> listFood() throws Exception;
	
	// 해당 상품 조회
	public KdhFoodVo selectFoodbyNum(int food_num) throws Exception;
	
	// 상품 삭제
	
	// food number 100(스낵)만 선택
	public List<KdhFoodVo> listFoodCode100(KdhPagingDto pagingDto) throws Exception;
	
	// food number 200(음료)만 선택
	public List<KdhFoodVo> listFoodCode200(KdhPagingDto pagingDto) throws Exception;
	
	// food number 300(패키지)만 선택
	public List<KdhFoodVo> listFoodCode300(KdhPagingDto pagingDto) throws Exception;
	
	// 최근 상품 3개 구하기
	public List<KdhFoodVo> listLatestFood() throws Exception;
	
	// (페이징)상품 9개씩 나오기
	public List<KdhFoodVo> listPage(KdhPagingDto pagingDto) throws Exception;

	// 상품 총 개수 구하기
	public int foodCount() throws Exception;
	
	// food number 100(스낵) 상품 개수 구하기
	public int CountFoodCode100() throws Exception;
	
	// food number 200(음료) 상품 개수 구하기
	public int CountFoodCode200() throws Exception;
	
	// food number 300(패키지) 상품 개수 구하기
	public int CountFoodCode300() throws Exception;
	
	// 해당 구매 상품 조회
	public KdhBuyFoodInfo selectBuyFoodbyNum(int food_num) throws Exception;
	
	// 구매 내역 테이블 데이터 입력 
	public void insertFoodBuy(kdhFoodBuyDto foodBuyDto) throws Exception;
	
	// 구매 내역 리스트 테이블 테이터 입력
	public void insertFoodBuyList(kdhFoodBuyListDto foodBuyListDto) throws Exception;
	
	// 유저 정보 가져오기
	public KdhUserVo selectUserInfo(String user_id) throws Exception;
	
//	// buy.jsp에 쓸 산 금액만 가져오기 
//	public int selectBuyPrice(String user_id) throws Exception;
}
