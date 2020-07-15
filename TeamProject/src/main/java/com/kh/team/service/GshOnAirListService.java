package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.GshMovieListVo;

public interface GshOnAirListService {
	
	public List<GshMovieListVo> select_movie_list() throws Exception;

}
