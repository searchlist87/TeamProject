package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.SghMovieScreenVo;
import com.kh.team.persistence.SghMovieScreenDao;

@Service
public class SghMovieScreenServiceImpl implements SghMovieScreenService {

	@Inject
	private SghMovieScreenDao sghMovieScreenDao;
	@Override
	public List<SghMovieScreenVo> getScreenList(String theater_code) throws Exception {
		return sghMovieScreenDao.getScreenList(theater_code);
	}

}
