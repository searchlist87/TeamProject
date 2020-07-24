package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.KdhPointVo;

public interface KdhPointDao {
	
	// 아이디로 포인트 조회
	public KdhPointVo selectPointById(String user_id) throws Exception;
	
	// 물건을 살때 포인트 테이블에 데이터 넣기
	public void insertPointInData(String user_id, int food_buy_price, int point_percent) throws Exception;
	
	// 물건 살때 금액만큼 10% 적립 업데이트
	public void insertPointInDataUpdate(int point_num, String user_id) throws Exception;
	
	// 총 포인트 합계 구하기
	public int selectTotalPoint(String user_id) throws Exception;
	
	// 유저 데이트 포인트 업데이트
	public void updateTotalUserPoint(int user_point, String user_id) throws Exception;
	
	// 포인트 쓴만큼 차감
	public void updateUserPoint(int user_point, String user_id) throws Exception;
	
}
