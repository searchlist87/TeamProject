package com.kh.team.jmh.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.JmhAreaVo;
import com.kh.team.domain.JmhMovieTheaterDto;
import com.kh.team.domain.JmhMovieTheaterVo;
import com.kh.team.domain.JmhTheaterScheduleVo;
@Repository
public class JmhMovieTheaterDaoImpl implements JmhMovieTheaterDao {

	private static final String NAMESPACE = "mappers.jmh-movie-theater-mapper.";
	
	@Inject
	private SqlSession sqlSession;
	
	// 영화관 이름 가져오기
	@Override
	public List<JmhMovieTheaterVo> getTheaterName(String area_code) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getTheaterInfo", area_code);
	}
	
	//지역 정보 가져오기
	@Override
	public List<JmhAreaVo> getArea() throws Exception {
		return sqlSession.selectList(NAMESPACE + "getArea");
	}

	// 영화관 정보 가져오기
	@Override
	public JmhMovieTheaterVo getTheaterInformation(String theater_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectTheaterInfo", theater_code);
	}
	
	// 영화관 코드 하나 가져오기
	@Override
	public String getTheaterCode() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getTheaterCode");
	}

	// 영화관 별 상영관 수
	@Override
	public int getScreenCount(String theater_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getScreenCount", theater_code);
	}

	// 영화관 총 좌석수
	@Override
	public int getTotalSeat(String theater_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getTotalSeat", theater_code);
	}

	// 영화 상영작정보 가져오기
	@Override
	public List<JmhTheaterScheduleVo> getTheaterSchedule(String theater_code, String movie_date) {
		Map<String , String> paramMap = new HashMap<String, String>();
		paramMap.put("theater_code", theater_code);
		paramMap.put("movie_date", movie_date);
		return sqlSession.selectList(NAMESPACE + "getTheaterSchedule", paramMap);
	}

	// 영화 상영작 제목 가져오기
	@Override
	public List<JmhMovieTheaterDto> getTheaterScheduleMovieName(String theater_code, String movie_date) throws Exception {
		Map<String , String> paramMap = new HashMap<String, String>();
		paramMap.put("theater_code", theater_code);
		paramMap.put("movie_date", movie_date);
		return sqlSession.selectList(NAMESPACE + "getTheaterMovieName", paramMap);
	}
}
