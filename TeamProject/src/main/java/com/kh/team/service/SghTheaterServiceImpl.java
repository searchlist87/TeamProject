package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.SghTheaterVo;
import com.kh.team.persistence.SghTheaterDao;

@Service
public class SghTheaterServiceImpl implements SghTheaterService {

	@Inject
	private SghTheaterDao sghTheaterDao;
	
	@Override
	public List<SghTheaterVo> getTheaterList() throws Exception {
		return sghTheaterDao.getTheaterList();
	}

	@Override
	public void movieTheaterAdd(SghTheaterVo sghTheaterVo) throws Exception {
		sghTheaterDao.insertMovieTheater(sghTheaterVo);
	}

}
