package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.GshMovieListVo;

// 최신 영화
public interface GshNewListDao {
	
	public List<GshMovieListVo> select_movie_list() throws Exception;

}
