package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.GshBestListVo;

public interface GshBestListDao {
	
	public List<GshBestListVo> select_movie_list() throws Exception;

}
