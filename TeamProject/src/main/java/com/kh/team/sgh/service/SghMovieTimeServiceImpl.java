package com.kh.team.sgh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.domain.SghMovieScreenAjaxDto;
import com.kh.team.domain.SghMovieTimeAjaxDto;
import com.kh.team.domain.SghMovieTimeListVo;
import com.kh.team.domain.SghMovieTimeModifyVo;
import com.kh.team.domain.SghMovieTimeVo;
import com.kh.team.domain.SghPagingDto;
import com.kh.team.sgh.persistence.SghMovieDao;
import com.kh.team.sgh.persistence.SghMovieTimeDao;

@Service
public class SghMovieTimeServiceImpl implements SghMovieTimeService {

	@Inject
	private SghMovieTimeDao sghMovieTimeDao;
	
	@Override
	public List<SghMovieTimeListVo> getMovieTimeList(SghPagingDto sghPagingDto) throws Exception {
		return sghMovieTimeDao.getMovieTimeList(sghPagingDto);
	}

	@Override
	public SghMovieTimeAjaxDto getAjaxScheduleOne(String movie_schedule_code) throws Exception {
		return sghMovieTimeDao.getAjaxScheduleOne(movie_schedule_code);
	}

	@Override
	public List<SghMovieScreenAjaxDto> getAjaxScreenList(String theater_code) throws Exception {
		return sghMovieTimeDao.getAjaxScreenList(theater_code);
	}

	@Transactional
	@Override
	public void insertMovieTime(SghMovieTimeVo sghMovieTimeVo) throws Exception{
		String screen_code = sghMovieTimeVo.getScreen_code();
		List<String> code = sghMovieTimeDao.getSeatCode(screen_code);
		sghMovieTimeDao.insertMovieTime(sghMovieTimeVo);
		String movie_time_code = sghMovieTimeDao.getMovieTimeNewDate();
		for(String movie_seat_num : code) {
			sghMovieTimeDao.insertScheduleSeat(movie_seat_num, movie_time_code);
		}
	}

	@Override
	public SghMovieTimeModifyVo selectMovieTimeOne(String movie_time_code) throws Exception {
		return sghMovieTimeDao.selectMovieTimeOne(movie_time_code);
	}

	@Override
	public void modifyMovieTime(SghMovieTimeVo sghMovieTimeVo) throws Exception {
		sghMovieTimeDao.modifyMovieTime(sghMovieTimeVo);
	}

	@Override
	public int getMovieTimeCount() throws Exception {
		return sghMovieTimeDao.getMovieTimeCount();
	}

	@Override
	public List<SghMovieTimeListVo> deleteMovieTimeList(SghPagingDto sghPagingDto) throws Exception {
		return sghMovieTimeDao.deleteMovieTimeList(sghPagingDto);
	}

	@Override
	public int deleteMovieTimeCount() throws Exception {
		return sghMovieTimeDao.deleteMovieTimeCount();
	}

	@Override
	public List<SghMovieTimeListVo> endOutMovieTimeList(SghPagingDto sghPagingDto) throws Exception {
		return sghMovieTimeDao.endOutMovieTimeList(sghPagingDto);
	}

	@Override
	public int endOutMovieTimeCount() throws Exception {
		return sghMovieTimeDao.endOutMovieTimeCount();
	}

	@Override
	public void deleteMovieTime(String movie_time_code) throws Exception {
		sghMovieTimeDao.deleteMovieTime(movie_time_code);
	}

	@Override
	public void restoreMovieTime(String movie_time_code) throws Exception {
		sghMovieTimeDao.restoreMovieTime(movie_time_code);
	}
}
