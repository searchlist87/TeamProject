package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.GshMovieDto;

public interface GshMovieViewDao {
	
	// 영화 정보 가져오기
	public List<GshMovieDto> select_movie_list() throws Exception;

}
