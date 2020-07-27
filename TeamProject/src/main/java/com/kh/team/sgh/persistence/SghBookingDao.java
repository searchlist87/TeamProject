package com.kh.team.sgh.persistence;

import java.util.List;

import com.kh.team.domain.SghBookSeatVo;
import com.kh.team.domain.SghBookingVo;
import com.kh.team.domain.SghMovieMoneyVo;
import com.kh.team.domain.SghPaymentVo;
import com.kh.team.domain.SghPointDto;

public interface SghBookingDao {

	// 상영 회차에 등록된 영화 시간을 골라서 오늘 하는 영화 중 해당 영화 가져오기
	public List<SghBookingVo> getChoiceMovieList(String start_date, String movie_code) throws Exception;
	// 해당 회차에 대한 등록된 상품 시트 가져오기
	public List<SghBookSeatVo> getTimeSeat(String movie_time_code) throws Exception;
	// 영화 회차의 가격 가져오기
	public SghMovieMoneyVo getMovieMoney(String movie_time_code) throws Exception;
	// 구매할 때 좌석 일정 예약시키기
	public void updateScheduleSeat(String schedule_seat_code) throws Exception;
	// 구매할 때 구매 내역에 추가
	public void insertMovieBuy(SghPaymentVo sghPaymentVo) throws Exception;
	// 구매할 때 변하지 않는 구매 내역 리스트에 데이터 추가
	public void insertMovieBuyList(SghPaymentVo sghPaymentVo) throws Exception;
	// 포인트 내역 추가하기
	public void insertPointList(SghPointDto sghPointDto) throws Exception;
	// 유저 포인트 업데이트
	public void updateUserPoint(SghPointDto sghPointDto) throws Exception;
}
