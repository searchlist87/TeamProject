package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.GshMovieDto;
import com.kh.team.domain.GshPagingDto;

public interface GshMovieService {
	
	// 영화 정보 가져오기
	public List<GshMovieDto> select_movieAll(GshPagingDto gshPagingDto) throws Exception;
		
	// 영화 상세 정보 보기
	public GshMovieDto selectMovieCode(String movie_code) throws Exception;
	
	// 영화 서브 이미지(스틸컷) 가져오기
	public List<String> selectMovieSubImage(String movie_code) throws Exception;
	
	// 영화 이름으로 영화 찾기
	public void findMovieName() throws Exception;
	
	// 영화 장르로 영화 찾기
	public void findMovieGenre() throws Exception;
	
	// 영화 목록 페이징
	public int getMovieCount(GshPagingDto gshPagingDto) throws Exception;

}
