package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.JmhMovieTheaterVo;
import com.kh.team.persistence.JmhMovieTheaterDao;

@Service
public class JmhMovieTheaterServiceImpl implements JmhMovieTheaterService {

	@Inject
	private JmhMovieTheaterDao jmhMovieTheaterDao;
	
	@Override
	public List<JmhMovieTheaterVo> getTheaterInfo() throws Exception {
		return jmhMovieTheaterDao.getTheaterInfo();
	}
}