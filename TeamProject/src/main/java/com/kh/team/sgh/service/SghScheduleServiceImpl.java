package com.kh.team.sgh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.SghScheduleVo;
import com.kh.team.sgh.persistence.SghScheduleDao;

@Service
public class SghScheduleServiceImpl implements SghScheduleService {

	@Inject
	private SghScheduleDao sghScheduleDao;
	
	@Override
	public List<SghScheduleVo> getScheduleList() throws Exception {
		return sghScheduleDao.getScheduleList();
	}

	@Override
	public void insertMovieSchedule(SghScheduleVo sghScheduleVo) throws Exception {
		sghScheduleDao.insertMovieSchedule(sghScheduleVo);
	}

	@Override
	public SghScheduleVo getMovieScheduleOne(String movie_schedule_code) throws Exception {
		return sghScheduleDao.getMovieScheduleOne(movie_schedule_code);
	}

	@Override
	public void updateSchedule(SghScheduleVo sghScheduleVo) throws Exception {
		sghScheduleDao.updateSchedule(sghScheduleVo);
	}

}
