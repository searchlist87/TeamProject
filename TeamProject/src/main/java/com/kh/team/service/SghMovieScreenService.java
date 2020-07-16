package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.SghMovieScreenVo;

public interface SghMovieScreenService {
	// 영화관 목록 가져오기
	public List<SghMovieScreenVo> getScreenList(String theater_code) throws Exception;
}
