package com.kh.team.sgh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.SghBookSeatVo;
import com.kh.team.domain.SghBookingVo;
import com.kh.team.domain.SghMovieMoneyVo;
import com.kh.team.domain.SghMovieTimeAjaxVo;
import com.kh.team.domain.SghPaymentVo;
import com.kh.team.domain.SghPointDto;

@Repository
public class SghBookingDaoImpl implements SghBookingDao {

	private final String NAMESPACE = "mappers.sgh-booking-mapper.";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<SghBookingVo> getChoiceMovieList(SghMovieTimeAjaxVo sghMovieTimeAjaxVo) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getChoiceMovieList", sghMovieTimeAjaxVo);
	}

	@Override
	public List<SghBookSeatVo> getTimeSeat(String movie_time_code) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getTimeSeat", movie_time_code);
	}

	@Override
	public SghMovieMoneyVo getMovieMoney(String movie_time_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getMovieMoney", movie_time_code);
	}

	@Override
	public void updateScheduleSeat(String schedule_seat_code) throws Exception {
		sqlSession.update(NAMESPACE + "updateScheduleSeat", schedule_seat_code);
	}

	@Override
	public void insertMovieBuyList(SghPaymentVo sghPaymentVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertMovieBuyList", sghPaymentVo);
	}

	@Override
	public void insertPointList(SghPointDto sghPointDto) throws Exception {
		sqlSession.insert(NAMESPACE + "insertPointList", sghPointDto);
	}

	@Override
	public void updateUserPoint(SghPointDto sghPointDto) throws Exception {
		sqlSession.update(NAMESPACE + "updateUserPoint", sghPointDto);
	}


}
