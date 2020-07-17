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

	// 영화 목록 보기
	@Override
	public List<GshMovieDto> select_movie_list() throws Exception {
		return gshMovieDao.select_movie_list();
	}

	// 영화 코드로 리뷰 보기
	@Override
	public GshMovieDto selectMovieCode(String movie_code) throws Exception {
		return gshMovieDao.selectMovieCode(movie_code);
	}

}
