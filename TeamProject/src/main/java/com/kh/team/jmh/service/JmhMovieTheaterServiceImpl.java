package com.kh.team.jmh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.JmhAreaVo;
import com.kh.team.domain.JmhMovieTheaterVo;
import com.kh.team.jmh.persistence.JmhMovieTheaterDao;

@Service
public class JmhMovieTheaterServiceImpl implements JmhMovieTheaterService {

	@Inject
	private JmhMovieTheaterDao jmhMovieTheaterDao;
	
	@Override
	public List<JmhMovieTheaterVo> getTheaterInfo() throws Exception {
		return jmhMovieTheaterDao.getTheaterInfo();
	}

	// 지역정보 가져오기
	@Override
	public List<JmhAreaVo> getArea() throws Exception {
		return jmhMovieTheaterDao.getArea();
	}
}