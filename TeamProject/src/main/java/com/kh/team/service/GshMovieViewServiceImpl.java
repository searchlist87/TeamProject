package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.GshMovieDto;
import com.kh.team.persistence.GshMovieViewDao;

@Service
public class GshMovieViewServiceImpl implements GshMovieViewService {
	
	@Inject
	private GshMovieViewDao gshMovieViewDao;

	@Override
	public List<GshMovieDto> select_movie_list() throws Exception {
		return gshMovieViewDao.select_movie_list();
	}

}
