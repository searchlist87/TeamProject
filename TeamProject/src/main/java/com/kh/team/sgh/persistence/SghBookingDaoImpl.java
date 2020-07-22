package com.kh.team.sgh.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.SghBookingVo;

@Repository
public class SghBookingDaoImpl implements SghBookingDao {

	private final String NAMESAPCE = "mappers.sgh-booking-mapper.";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<SghBookingVo> getChoiceMovieList(String start_date, String movie_code) throws Exception {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("start_date", start_date);
		paramMap.put("movie_code", movie_code);
		return sqlSession.selectList(NAMESAPCE + "getChoiceMovieList", paramMap);
	}

}
