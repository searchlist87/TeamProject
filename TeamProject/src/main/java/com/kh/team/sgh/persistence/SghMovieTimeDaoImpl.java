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
import com.kh.team.domain.SghPagingDto;
import com.kh.team.domain.SghScheduleVo;

@Repository
public class SghMovieTimeDaoImpl implements SghMovieTimeDao {

	private final String NAMESPACE = "mappers.sgh-movie-time-mapper.";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<SghMovieTimeListVo> getMovieTimeList(SghPagingDto sghPagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getMovieTimeList", sghPagingDto);
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

	@Override
	public int getMovieTimeCount(SghPagingDto sghPagingDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getMovieTimeCount", sghPagingDto);
	}

	@Override
	public List<SghMovieTimeListVo> deleteMovieTimeList(SghPagingDto sghPagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "deleteMovieTimeList", sghPagingDto);
	}

	@Override
	public int deleteMovieTimeCount(SghPagingDto sghPagingDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "deleteMovieTimeCount", sghPagingDto);
	}

	@Override
	public List<SghMovieTimeListVo> endOutMovieTimeList(SghPagingDto sghPagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "endOutMovieTimeList", sghPagingDto);
	}

	@Override
	public int endOutMovieTimeCount(SghPagingDto sghPagingDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "endOutMovieTimeCount", sghPagingDto);
	}

	@Override
	public void deleteMovieTime(String movie_time_code) throws Exception {
		sqlSession.update(NAMESPACE + "deleteMovieTime", movie_time_code);
	}

	@Override
	public void restoreMovieTime(String movie_time_code) throws Exception {
		sqlSession.update(NAMESPACE + "restoreMovieTime", movie_time_code);
	}

	@Override
	public List<SghScheduleVo> getMovieList() throws Exception {
		return sqlSession.selectList(NAMESPACE + "getMovieList");
	}

}
