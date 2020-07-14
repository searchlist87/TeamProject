package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.GshMovieListVo;
import com.kh.team.persistence.GshBestListDao;

@Service
public class GshBestListServiceImpl implements GshBestListService {

	@Inject
	private GshBestListDao gshBestListDao;
	
	@Override
	public List<GshMovieListVo> select_movie_list() throws Exception {
		return gshBestListDao.select_movie_list();
	}

}
