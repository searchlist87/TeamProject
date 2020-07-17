package com.kh.team.sgh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.SghScheduleListDto;
import com.kh.team.sgh.persistence.SghMovieDao;

@Service
public class SghMovieServiceImpl implements SghMovieService {

	@Inject
	private SghMovieDao sghMovieDao;
	
	@Override
	public List<SghScheduleListDto> getScheduleMovieList() throws Exception {
		return sghMovieDao.getScheduleMovieList();
	}

}
