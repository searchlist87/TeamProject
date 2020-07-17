package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.GshMovieDto;
import com.kh.team.domain.GshMovieListVo;

public interface GshMovieDao {
	
	// 영화 정보 가져오기
	public List<GshMovieDto> select_movie_list() throws Exception;
	
	public GshMovieDto selectMovieCode(String movie_code) throws Exception;
	
	// 영화 상세정보 가져오기
	public GshMovieListVo select_movie_code(String movie_code) throws Exception;

}
