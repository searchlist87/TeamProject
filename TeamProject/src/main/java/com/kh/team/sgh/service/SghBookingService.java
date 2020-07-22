package com.kh.team.sgh.service;

import java.util.List;

import com.kh.team.domain.SghBookingVo;

public interface SghBookingService {
	
	// 상영 회차에 등록된 영화 시간을 골라서 오늘 하는 영화 중 해당 영화 가져오기
	public List<SghBookingVo> getChoiceMovieList(String start_date, String movie_code) throws Exception;
}
