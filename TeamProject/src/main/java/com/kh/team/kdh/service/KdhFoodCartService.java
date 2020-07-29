package com.kh.team.kdh.service;

import java.util.List;

import com.kh.team.domain.KdhBasicCartDto;
import com.kh.team.domain.KdhFoodCartDto;
import com.kh.team.kdh.persistence.KdhFoodCartDao;

public interface KdhFoodCartService {
	
	// 장바구니 전체 조회
	public List<KdhFoodCartDto> AllCart(String user_id) throws Exception;

	// 장바구니 조회
	public KdhFoodCartDto selectCart(String user_id, int food_num) throws Exception;
		
	// 장바구니 삭제
	public void deleteCart(int food_cart_num) throws Exception; 
	
	// 장바구니 수정
	public void updateCart(int food_cart_num, int food_cart_count, int buy_food_price) throws Exception;
	
	// 장바구니 등록
	public void insertCart(KdhFoodCartDto cartDto) throws Exception;
	
	// 장바구니 중복체크
	public int overlapCart(String user_id, int food_num) throws Exception;
	
	// food_cart_num으로 KdhFoodCartDao 구하기
	public int selectFoodnumByCartnum(int food_cart_num) throws Exception;
	
	// 장바구니 합계액 구하기
	public int FoodTotalMoney(String user_id) throws Exception;
	
	// 아이디로 장바구니내역 가져오기
	public List<KdhBasicCartDto> selectCartListByUserId(String user_id) throws Exception;
	
	// 해당 상품 카트 내역 삭제
	public void deleteFoodCart(int food_num) throws Exception;
}
