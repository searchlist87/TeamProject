package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.GshMovieDto;

public interface GshMovieViewService {

	public List<GshMovieDto> select_movie_list() throws Exception;
	
}
