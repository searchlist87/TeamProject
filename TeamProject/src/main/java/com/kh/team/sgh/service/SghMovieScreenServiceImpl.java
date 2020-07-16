package com.kh.team.sgh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.sgh.domain.SghMovieScreenVo;
import com.kh.team.sgh.persistence.SghMovieScreenDao;

@Service
public class SghMovieScreenServiceImpl implements SghMovieScreenService {

	@Inject
	private SghMovieScreenDao sghMovieScreenDao;
	@Override
	public List<SghMovieScreenVo> getScreenList(String theater_code) throws Exception {
		return sghMovieScreenDao.getScreenList(theater_code);
	}
	
	@Override
	public void insertScreen(SghMovieScreenVo sghMovieScreenVo) throws Exception {
		sghMovieScreenDao.insertScreen(sghMovieScreenVo);
	}

}