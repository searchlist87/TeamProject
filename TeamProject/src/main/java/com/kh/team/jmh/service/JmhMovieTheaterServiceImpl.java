package com.kh.team.jmh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.JmhAreaVo;
import com.kh.team.domain.JmhMovieTheaterDto;
import com.kh.team.domain.JmhMovieTheaterVo;
import com.kh.team.domain.JmhTheaterScheduleVo;
import com.kh.team.jmh.persistence.JmhMovieTheaterDao;

@Service
public class JmhMovieTheaterServiceImpl implements JmhMovieTheaterService {

	@Inject
	private JmhMovieTheaterDao jmhMovieTheaterDao;
	
	@Override
	public List<JmhMovieTheaterVo> getTheaterName(String area_code) throws Exception {
		return jmhMovieTheaterDao.getTheaterName(area_code);
	}

	// 지역정보 가져오기
	@Override
	public List<JmhAreaVo> getArea() throws Exception {
		return jmhMovieTheaterDao.getArea();
	}

	// 영화관 정보 가져오기
	@Override
	public JmhMovieTheaterVo getTheaterInformation(String theater_code) throws Exception {
		return jmhMovieTheaterDao.getTheaterInformation(theater_code);
	}

	// 영화관코드 하나 가져오기
	@Override
	public String getTheaterCode() throws Exception {
		return jmhMovieTheaterDao.getTheaterCode();
	}

	// 영화관 별 상영관 가져오기
	@Override
	public int getScreenCount(String theater_code) throws Exception {
		System.out.println("searvice_theater_code :" + theater_code);
		return jmhMovieTheaterDao.getScreenCount(theater_code);
	}

	// 영화관 총 좌석수
	@Override
	public int getTotalSeat(String theater_code) throws Exception {
		return jmhMovieTheaterDao.getTotalSeat(theater_code);
	}

	// 영화 상영작정보 가져오기
	@Override
	public List<JmhTheaterScheduleVo> getTheaterSchedule(String theater_code, String movie_date) throws Exception {
		return jmhMovieTheaterDao.getTheaterSchedule(theater_code, movie_date);
	}

	// 영화 상영작 제목 가져오기
	@Override
	public List<JmhMovieTheaterDto> getTheaterScheduleMovieName(String theater_code, String movie_date) throws Exception {
		return jmhMovieTheaterDao.getTheaterScheduleMovieName(theater_code, movie_date);
	}
}