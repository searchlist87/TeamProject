package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.GshMovieDto;
import com.kh.team.persistence.GshMovieDao;

@Service
public class GshMovieServiceImpl implements GshMovieService {
	
	@Inject
	private GshMovieDao gshMovieDao;

	@Override
	public List<GshMovieDto> select_movie_list() throws Exception {
		return gshMovieDao.select_movie_list();
	}

}
