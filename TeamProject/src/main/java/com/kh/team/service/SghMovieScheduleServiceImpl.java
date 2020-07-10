package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.SghMovieNameVo;
import com.kh.team.persistence.SghMovieScheduleDao;

@Service
public class SghMovieScheduleServiceImpl implements SghMovieScheduleService {

	@Inject
	private SghMovieScheduleDao sghMovieScheduleDao;
	
	@Override
	public List<SghMovieNameVo> getMovieName(String theater_code) throws Exception {
		return sghMovieScheduleDao.getMovieName(theater_code);
	}

}
