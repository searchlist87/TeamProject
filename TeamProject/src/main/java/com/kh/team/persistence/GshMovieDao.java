package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.GshMovieDto;
import com.kh.team.domain.GshMovieListVo;
import com.kh.team.domain.GshPagingDto;

public interface GshMovieDao {
	
	// 영화 정보 가져오기
	public List<GshMovieDto> select_movieAll(GshPagingDto gshPagingDto) throws Exception;
	
	// 영화 코드로 리뷰 보기
	public GshMovieDto selectMovieCode(String movie_code) throws Exception;
	
	// 영화 상세정보 가져오기
	public GshMovieListVo select_movie_code(String movie_code) throws Exception;
	
	// 영화 서브 이미지(스틸컷) 가져오기
	public List<String> selectMovieSubImage(String movie_code) throws Exception;
	
	// 영화 이름으로 영화 찾기
	public void findMovieNmae() throws Exception;
	
	// 영화 장르로 영화 찾기
	public void findMovieGenre() throws Exception;
	
	// 영화 총 개수 구하기
	public int getMovieCount(GshPagingDto gshPagingDto) throws Exception;
	
	
}
