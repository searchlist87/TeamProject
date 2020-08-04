package com.kh.team.sgh.persistence;

import java.util.List;

import com.kh.team.domain.SghBuyListVo;
import com.kh.team.domain.SghMyMovieBuyVo;
import com.kh.team.domain.SghPagingDto;

public interface SghMyPageDao {

	// 내 정보의 영화 구매내역 보기
	public List<SghMyMovieBuyVo> getMyMovieBuyList(int start_row, int end_row, String user_id) throws Exception;
	// 영화 구매 내역 총 숫자
	public int getBuyMovieTotal(String user_id) throws Exception;
	// 영화 시작 시간이 지나지 않은 예매 정보
	public List<SghBuyListVo> getBuyList(int start_row, int end_row, String user_id) throws Exception;
	// 영화 시작 시간이 지난 예매 정보
	public List<SghBuyListVo> getOutBuyList(int start_row, int end_row, String user_id) throws Exception;
	// 영화 시작 시간이 지나지 않은 예매 총 숫자
	public int getBuyTotal(String user_id) throws Exception;
	// 영화 시작 시간이 지난 예매 총 숫자
	public int getOutBuyTotal(String user_id) throws Exception;
}
