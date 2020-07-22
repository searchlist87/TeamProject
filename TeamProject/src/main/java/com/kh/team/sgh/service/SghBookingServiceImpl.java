package com.kh.team.sgh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.SghBookingVo;
import com.kh.team.sgh.persistence.SghBookingDao;

@Service
public class SghBookingServiceImpl implements SghBookingService {

	@Inject
	private SghBookingDao sghBookingDao;
	
	@Override
	public List<SghBookingVo> getChoiceMovieList(String start_date, String movie_code) throws Exception {
		return sghBookingDao.getChoiceMovieList(start_date, movie_code);
	}

}
