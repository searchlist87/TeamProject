package com.kh.team.kdh.persistence;

import java.util.List;

import com.kh.team.domain.KdhMypagePointDto;
import com.kh.team.domain.KdhPointCodeVo;
import com.kh.team.domain.KdhPointVo;
import com.kh.team.domain.KdhUserVo;

public interface KdhPointDao {
	
	// 포인트코드 테이블에 퍼센트값 구하기
	public KdhPointCodeVo selectFoodPercent() throws Exception;
	
	// 아이디로 포인트 조회
	public List<KdhPointVo> selectPointById(String user_id) throws Exception;
	
	// 물건을 살때 포인트 테이블에 데이터 넣기
	public void insertPointInData(String user_id, int food_buy_price, int point_percent) throws Exception;
	
	// 물건 살때 금액만큼 10% 적립 업데이트
	public void insertPointInDataUpdate(int point_num, String user_id) throws Exception;
	
	// 총 포인트 합계 구하기
	public int selectTotalPoint(String user_id) throws Exception;
	
	// 유저 데이트 포인트 업데이트
	public void updateTotalUserPoint(int food_buy_price, int point_percent, String user_id) throws Exception;
	
	// 포인트 쓴만큼 차감
	public void updateUserPoint(int used_Point, String user_id) throws Exception;
	
	// 유저 포인트 찾기
	public int selectPointByUserId(String user_id) throws Exception;
	
	// 마이페이지 포인트 내역 데이터 넣기
	public void insertUsedPointInfo(String user_id, int used_point) throws Exception;
	
	// 마이페이지 포인트 내역 보기
	public List<KdhMypagePointDto> selectUsedPointInfo(String user_id) throws Exception;
}
