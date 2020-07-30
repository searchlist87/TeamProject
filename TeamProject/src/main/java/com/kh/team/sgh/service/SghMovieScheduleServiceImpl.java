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

	@Override
	public int getMovieScheduleCount() throws Exception {
		return sghMovieScheduleDao.getMovieScheduleCount();
	}

	@Override
	public List<SghScheduleVo> deleteScheduleList(SghPagingDto sghPagingDto) throws Exception {
		return sghMovieScheduleDao.deleteScheduleList(sghPagingDto);
	}

	@Override
	public int getDeleteScheduleCount() throws Exception {
		return sghMovieScheduleDao.getDeleteScheduleCount();
	}

	@Override
	public void stateDeleteSchedule(String movie_schedule_code) throws Exception {
		sghMovieScheduleDao.stateDeleteSchedule(movie_schedule_code);
	}

	@Override
	public void stateRestoreSchedule(String movie_schedule_code) throws Exception {
		sghMovieScheduleDao.stateRestoreSchedule(movie_schedule_code);
	}

	@Override
	public List<SghScheduleVo> endDateOutScheduleList(SghPagingDto sghPagingDto) throws Exception {
		return sghMovieScheduleDao.endDateOutScheduleList(sghPagingDto);
	}

	@Override
	public int getEndDateOutScheduleCount() throws Exception {
		return sghMovieScheduleDao.getEndDateOutScheduleCount();
	}

}
