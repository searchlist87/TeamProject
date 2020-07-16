package com.kh.team.sgh.service;

import java.util.List;

import com.kh.team.sgh.domain.SghMovieScreenVo;

public interface SghMovieScreenService {
	// 영화관 목록 가져오기
	public List<SghMovieScreenVo> getScreenList(String theater_code) throws Exception;
	// 상영관 추가
	public void insertScreen(SghMovieScreenVo sghMovieScreenVo) throws Exception;
}
