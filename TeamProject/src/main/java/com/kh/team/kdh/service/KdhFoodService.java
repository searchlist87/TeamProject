package com.kh.team.kdh.service;

import java.util.List;

import com.kh.team.domain.KdhAdminFoodBuyListDto;
import com.kh.team.domain.KdhBasicCartDto;
import com.kh.team.domain.KdhBuyFoodInfo;
import com.kh.team.domain.KdhFoodVo;
import com.kh.team.domain.KdhMypageBuyFoodListDto;
import com.kh.team.domain.KdhPagingDto;
import com.kh.team.domain.KdhUserVo;
import com.kh.team.domain.kdhFoodBuyDto;
import com.kh.team.domain.kdhFoodBuyListDto;

public interface KdhFoodService {
	
	// 상품 전체 조회
	public List<KdhFoodVo> selectListFood() throws Exception;
	
	// 해당 상품 조회
	public KdhFoodVo selectFoodbyNum(int food_num) throws Exception;
		
	// food number 100(스낵)만 선택
	public List<KdhFoodVo> selectListFoodCode100(KdhPagingDto pagingDto) throws Exception;
	
	// food number 200(음료)만 선택
	public List<KdhFoodVo> selectListFoodCode200(KdhPagingDto pagingDto) throws Exception;
	
	// food number 300(패키지)만 선택
	public List<KdhFoodVo> selectListFoodCode300(KdhPagingDto pagingDto) throws Exception;
	
	// 최근 상품 3개 구하기
	public List<KdhFoodVo> selectListLatestFood3() throws Exception;
	
	// 상품 페이징
	public List<KdhFoodVo> listPage(KdhPagingDto pagingDto) throws Exception;
	
	// 상품 총 개수 구하기
	public int selectFoodCount() throws Exception;
	
	// food number 100(스낵) 상품 개수 구하기
	public int selectCountFoodCode100() throws Exception;
	
	// food number 200(음료) 상품 개수 구하기
	public int selectCountFoodCode200() throws Exception;
	
	// food number 300(패키지) 상품 개수 구하기
	public int selectCountFoodCode300() throws Exception;
	
	// 해당 구매 상품 조회
	public KdhBuyFoodInfo selectBuyFoodbyNum(int food_num) throws Exception;
	
	// 구매 내역 테이블 데이터 입력 
	public void insertFoodBuy(kdhFoodBuyDto foodBuyDto) throws Exception;
	
	// 구매 내역 리스트 테이블 테이터 입력
	public void insertFoodBuyList(kdhFoodBuyListDto foodBuyListDto) throws Exception;
	
	// 유저 정보 가져오기
	public KdhUserVo selectUserInfo(String user_id) throws Exception;
	
	// 상품 정보 업데이트
	public void updateFoodbyNum(KdhFoodVo foodVo) throws Exception;
	
	// 상품 삭제하기
	public void deleteFoodByNum(int food_num) throws Exception;
	
	// 해당 상품 구매 내역 삭제
	public void deleteFoodBuy(int food_num) throws Exception;
	
	// 상품 등록하기
	public void insertFood(KdhFoodVo foodVo) throws Exception;

	// 상품 구매 내역 가져오기
	public List<KdhAdminFoodBuyListDto> selectBuyFoodList() throws Exception;
	
	// 상품 갯수 업데이트
	public void updateFoodCount( int food_count,int food_buy_count,int buy_food_num) throws Exception;
	
	// 상품 구매 내역 가져오기(마이페이지)
	public List<KdhMypageBuyFoodListDto> selectMyPageBuyFoodList(String user_id) throws Exception;
	
	// 상품 구매 리스트 갯수 구하기
	public int selectFoodBuyListCount(KdhPagingDto pagingDto) throws Exception;
	
	// 상품 구매 리스트 페이징
	public List<KdhAdminFoodBuyListDto> foodBuyListPage(KdhPagingDto pagingDto) throws Exception;
	
	// 상품 마이페이지 구매 리스트 페이징
	public List<KdhAdminFoodBuyListDto> foodBuyListMyPage(KdhPagingDto pagingDto) throws Exception;
	
	// 마이페이지 구매 리스트 유저별로 갯수 구하기
	public int selectMyPageFoodBuyListCount(String user_id) throws Exception;
	
	// 관리자 페이지 - 푸드 상품관리_상품조회(스토어) 페이징
	public List<KdhFoodVo> foodPage(KdhPagingDto pagingDto) throws Exception;
	
	// 관리자 - 푸드 상품관리 페이지 상품 갯수 구하기
	public int selectFoodPageCount(KdhPagingDto pagingDto) throws Exception;
}
