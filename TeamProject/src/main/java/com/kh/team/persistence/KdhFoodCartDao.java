package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.KdhFoodCartDto;

public interface KdhFoodCartDao {
	
	// 장바구니 전체 조회
	public List<KdhFoodCartDto> AllCart(String user_id) throws Exception;
	
	// 장바구니 조회
	public KdhFoodCartDto selectCart(String user_id, int food_num) throws Exception;
	
	// 장바구니 등록
	public void insertCart(KdhFoodCartDto cartDto) throws Exception;
	
	// 장바구니 삭제
	public void deleteCart(int food_cart_num) throws Exception; 
	
	// 장바구니 수정
	public void updateCart(int food_cart_num, int food_cart_count, int food_num) throws Exception;
	
	// 장바구니 중복체크
	public int overlapCart(String user_id, int food_num) throws Exception;
	
	// food_cart_num으로 KdhFoodCartDao 구하기
	public int selectFoodnumByCartnum(int food_cart_num) throws Exception;
}
