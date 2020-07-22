package com.kh.team.sgh.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.SghMovieScreenAjaxDto;
import com.kh.team.domain.SghMovieTimeAjaxDto;
import com.kh.team.domain.SghMovieTimeListVo;
import com.kh.team.domain.SghMovieTimeModifyVo;
import com.kh.team.domain.SghMovieTimeVo;

@Repository
public class SghMovieTimeDaoImpl implements SghMovieTimeDao {

	private final String NAMESPACE = "mappers.sgh-movie-time-mapper.";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<SghMovieTimeListVo> getMovieTimeList() throws Exception {
		return sqlSession.selectList(NAMESPACE + "getMovieTimeList");
	}

	@Override
	public SghMovieTimeAjaxDto getAjaxScheduleOne(String movie_schedule_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getAjaxScheduleOne", movie_schedule_code);
	}

	@Override
	public List<SghMovieScreenAjaxDto> getAjaxScreenList(String theater_code) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getAjaxScreenList", theater_code);
	}

	@Override
	public void insertMovieTime(SghMovieTimeVo sghMovieTimeVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertMovieTime", sghMovieTimeVo);
	}

	@Override
	public SghMovieTimeModifyVo selectMovieTimeOne(String movie_time_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectMovieTimeOne", movie_time_code);
	}

	@Override
	public void modifyMovieTime(SghMovieTimeVo sghMovieTimeVo) throws Exception {
		sqlSession.update(NAMESPACE + "modifyMovieTime", sghMovieTimeVo);
	}

	@Override
	public List<String> getSeatCode(String screen_code) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getSeatCode", screen_code);
	}

	@Override
	public void insertScheduleSeat(String movie_seat_num, String movie_time_code) throws Exception {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("movie_seat_num", movie_seat_num);
		paramMap.put("movie_time_code", movie_time_code);
		sqlSession.insert(NAMESPACE + "insertScheduleSeat", paramMap);
	}

	@Override
	public String getMovieTimeNewDate() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getMovieTimeNewDate");
	}

}
