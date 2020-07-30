package com.kh.team.sgh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.domain.SghBookSeatVo;
import com.kh.team.domain.SghBookingVo;
import com.kh.team.domain.SghMovieMoneyVo;
import com.kh.team.domain.SghMovieTimeAjaxVo;
import com.kh.team.domain.SghPaymentVo;
import com.kh.team.domain.SghPointDto;
import com.kh.team.sgh.constants.SghTeamConstants;
import com.kh.team.sgh.persistence.SghBookingDao;
import com.kh.team.sgh.persistence.SghPointDao;

@Service
public class SghBookingServiceImpl implements SghBookingService {

	@Inject
	private SghBookingDao sghBookingDao;
	@Inject
	private SghPointDao sghPointDao;
	
	@Override
	public List<SghBookingVo> getChoiceMovieList(SghMovieTimeAjaxVo sghMovieTimeAjaxVo) throws Exception {
		return sghBookingDao.getChoiceMovieList(sghMovieTimeAjaxVo);
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
	public void updateScheduleSeat(SghPaymentVo sghPaymentVo, String[] schedule_seat_arr, int use_point) throws Exception {
		SghPointDto sghPointDto = new SghPointDto();
		String user_id = sghPaymentVo.getUser_id();
		int movie_price = sghPaymentVo.getMovie_price();
		sghPointDto.setUser_id(user_id);
		int point = movie_price / SghTeamConstants.POINT_PERCENT;
		sghPointDto.setPoint(point);
		String point_code = SghTeamConstants.MOVIE_POINT;
		sghPointDto.setPoint_code(point_code);
		for(String schedule_seat_code : schedule_seat_arr) {
			// 예약 시키기
			sghBookingDao.updateScheduleSeat(schedule_seat_code);
			sghPaymentVo.setSchedule_seat_code(schedule_seat_code);
			// 내역 추가
			sghBookingDao.insertMovieBuy(sghPaymentVo);
			// 변하지 않는 내역 추가
			sghBookingDao.insertMovieBuyList(sghPaymentVo);
			// 포인트 지급하기
			sghBookingDao.insertPointList(sghPointDto);
			sghBookingDao.updateUserPoint(sghPointDto);
		}
		// 포인트 사용하기
		sghPointDao.updatePoint(user_id, use_point);
		// 포인트 내역 추가하기
		sghPointDao.insertUsedPoint(user_id, use_point);
	}
}
