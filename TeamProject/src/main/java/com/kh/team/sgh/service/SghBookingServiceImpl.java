package com.kh.team.sgh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.domain.SghBookSeatVo;
import com.kh.team.domain.SghBookingVo;
import com.kh.team.domain.SghMovieMoneyVo;
import com.kh.team.domain.SghPaymentVo;
import com.kh.team.domain.SghPointDto;
import com.kh.team.sgh.constants.SghTeamConstants;
import com.kh.team.sgh.persistence.SghBookingDao;

@Service
public class SghBookingServiceImpl implements SghBookingService {

	@Inject
	private SghBookingDao sghBookingDao;
	
	@Override
	public List<SghBookingVo> getChoiceMovieList(String start_date, String movie_code) throws Exception {
		return sghBookingDao.getChoiceMovieList(start_date, movie_code);
	}

	@Override
	public List<SghBookSeatVo> getTimeSeat(String movie_time_code) throws Exception {
		return sghBookingDao.getTimeSeat(movie_time_code);
	}

	@Override
	public SghMovieMoneyVo getMovieMoney(String movie_time_code) throws Exception {
		return sghBookingDao.getMovieMoney(movie_time_code);
	}
	
	// 영화 예약 시키기(구매내역, 구매내역리스트에도 추가)
	@Transactional
	@Override
	public void updateScheduleSeat(SghPaymentVo sghPaymentVo, String[] schedule_seat_arr) throws Exception {
		for(String schedule_seat_code : schedule_seat_arr) {
			// 예약 시키기
			sghBookingDao.updateScheduleSeat(schedule_seat_code);
			sghPaymentVo.setSchedule_seat_code(schedule_seat_code);
			// 내역 추가
			sghBookingDao.insertMovieBuy(sghPaymentVo);
			// 변하지 않는 내역 추가
			sghBookingDao.insertMovieBuyList(sghPaymentVo);
		}
		
		String user_id = sghPaymentVo.getUser_id();
		int movie_price = sghPaymentVo.getMovie_price();
		
		int point = movie_price / SghTeamConstants.POINT_PERCENT;
		String point_code = SghTeamConstants.MOVIE_POINT;
		
		SghPointDto sghPointDto = new SghPointDto();
		
		sghPointDto.setUser_id(user_id);
		sghPointDto.setPoint(point);
		sghPointDto.setPoint_code(point_code);
		
		// 포인트 지급하기
		sghBookingDao.insertPointList(sghPointDto);
		sghBookingDao.updateUserPoint(sghPointDto);
	}

}
