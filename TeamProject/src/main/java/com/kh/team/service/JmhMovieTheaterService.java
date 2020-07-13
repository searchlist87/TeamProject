package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.JmhMovieTheaterVo;

public interface JmhMovieTheaterService {
	
	// 영화관 이름 가져오기
	public List<JmhMovieTheaterVo> getTheaterInfo() throws Exception;
	
}
