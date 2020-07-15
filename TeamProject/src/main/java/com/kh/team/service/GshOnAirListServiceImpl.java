package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.GshMovieListVo;
import com.kh.team.persistence.GshOnAirListDao;

@Service
public class GshOnAirListServiceImpl implements GshOnAirListService {
	
	@Inject
	private GshOnAirListDao gshOnAirListDao;

	@Override
	public List<GshMovieListVo> select_movie_list() throws Exception {
		return gshOnAirListDao.select_movie_list();
	}

}
