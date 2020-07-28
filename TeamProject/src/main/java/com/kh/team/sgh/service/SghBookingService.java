package com.kh.team.sgh.service;

import java.util.List;

import com.kh.team.domain.SghBookSeatVo;
import com.kh.team.domain.SghBookingVo;
import com.kh.team.domain.SghMovieMoneyVo;
import com.kh.team.domain.SghMovieTimeAjaxVo;
import com.kh.team.domain.SghPaymentVo;

public interface SghBookingService {
	
	// 상영 회차에 등록된 영화 시간을 골라서 오늘 하는 영화 중 해당 영화 가져오기
	public List<SghBookingVo> getChoiceMovieList(SghMovieTimeAjaxVo sghMovieTimeAjaxVo) throws Exception;
	// 해당 회차에 대한 등록된 상품 시트 가져오기
	public List<SghBookSeatVo> getTimeSeat(String movie_time_code) throws Exception;
	// 영화 회차의 가격 가져오기
	public SghMovieMoneyVo getMovieMoney(String movie_time_code) throws Exception;
	// 구매할 때 좌석 일정 예약시키기
	public void updateScheduleSeat(SghPaymentVo sghPaymentVo,  String[] schedule_seat_arr) throws Exception;
	
}
