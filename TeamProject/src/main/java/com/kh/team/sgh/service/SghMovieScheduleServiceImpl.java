package com.kh.team.sgh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.SghMovieNameVo;
import com.kh.team.domain.SghPagingDto;
import com.kh.team.domain.SghScheduleVo;
import com.kh.team.sgh.persistence.SghMovieScheduleDao;

@Service
public class SghMovieScheduleServiceImpl implements SghMovieScheduleService {

	@Inject
	private SghMovieScheduleDao sghMovieScheduleDao;
	
	@Override
	public List<SghMovieNameVo> getMovieName(String theater_code) throws Exception {
		return sghMovieScheduleDao.getMovieName(theater_code);
	}
	
	@Override
	public List<SghScheduleVo> getScheduleList(SghPagingDto sghPagingDto) throws Exception {
		return sghMovieScheduleDao.getScheduleList(sghPagingDto);
	}

	@Override
	public void insertMovieSchedule(SghScheduleVo sghScheduleVo) throws Exception {
		sghMovieScheduleDao.insertMovieSchedule(sghScheduleVo);
	}

	@Override
	public SghScheduleVo getMovieScheduleOne(String movie_schedule_code) throws Exception {
		return sghMovieScheduleDao.getMovieScheduleOne(movie_schedule_code);
	}

	@Override
	public void updateSchedule(SghScheduleVo sghScheduleVo) throws Exception {
		sghMovieScheduleDao.updateSchedule(sghScheduleVo);
	}

}
