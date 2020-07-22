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

	// 영화 정보 가져오기
	public List<GshMovieDto> select_movieAll() throws Exception {
		return gshMovieDao.select_movieAll();
	}

	// 영화 코드로 리뷰 보기
	@Override
	public GshMovieDto selectMovieCode(String movie_code) throws Exception {
		return gshMovieDao.selectMovieCode(movie_code);
	}

	@Override
	public List<String> selectMovieSubImage(String movie_code) throws Exception {
		return gshMovieDao.selectMovieSubImage(movie_code);
	}

}
