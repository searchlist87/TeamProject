package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.GshMovieDto;

public interface GshMovieService {
	
	// 영화 정보 가져오기
	public List<GshMovieDto> select_movie_list() throws Exception;
	
	// 영화 상세 정보 보기
	public GshMovieDto selectMovieCode(String movie_code) throws Exception;

}
