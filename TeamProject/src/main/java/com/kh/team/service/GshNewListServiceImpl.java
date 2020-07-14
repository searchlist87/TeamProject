package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.GshMovieListVo;
import com.kh.team.persistence.GshNewListDao;

@Service
public class GshNewListServiceImpl implements GshNewListService {
	
	@Inject
	private GshNewListDao gshNewListDao;

	@Override
	public List<GshMovieListVo> select_movie_list() throws Exception {
		return gshNewListDao.select_movie_list();
	}

}
