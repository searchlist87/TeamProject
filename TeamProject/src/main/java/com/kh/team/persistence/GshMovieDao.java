package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.GshMovieDto;
import com.kh.team.domain.GshMovieListVo;

public interface GshMovieDao {
	
	// 영화 정보 가져오기
	public List<GshMovieDto> select_movieAll() throws Exception;
	
	// 영화 코드로 리뷰 보기
	public GshMovieDto selectMovieCode(String movie_code) throws Exception;
	
	// 영화 상세정보 가져오기
	public GshMovieListVo select_movie_code(String movie_code) throws Exception;
	
	// 영화 서브 이미지(스틸컷) 가져오기
	public List<String> selectMovieSubImage(String movie_code) throws Exception;

}
