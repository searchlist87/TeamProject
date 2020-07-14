package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.GshBestListVo;

public interface GshBestListService {
	
	public List<GshBestListVo> select_movie_list() throws Exception;

}
