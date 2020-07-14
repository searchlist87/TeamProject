package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.GshMovieListVo;

public interface GshBestListDao {
	
	public List<GshMovieListVo> select_movie_list() throws Exception;

}
