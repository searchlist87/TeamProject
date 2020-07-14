package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.GshMovieListVo;

// 상영중인 영화
public interface GshOnAirListDao {
	
	public List<GshMovieListVo> select_movie_list() throws Exception;

}
