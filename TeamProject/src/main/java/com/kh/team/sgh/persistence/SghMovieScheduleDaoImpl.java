package com.kh.team.sgh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.SghMovieNameVo;
import com.kh.team.domain.SghPagingDto;
import com.kh.team.domain.SghScheduleVo;

@Repository
public class SghMovieScheduleDaoImpl implements SghMovieScheduleDao {

	private final String NAMESPACE = "mappers.sgh-schedule-mapper.";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<SghMovieNameVo> getMovieName(String theater_code) throws Exception {
		List<SghMovieNameVo> list = sqlSession.selectList(NAMESPACE + "getMovieName", theater_code);
		return list;
	}
	
	@Override
	public List<SghScheduleVo> getScheduleList(SghPagingDto sghPagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getScheduleList", sghPagingDto);
	}

	@Override
	public void insertMovieSchedule(SghScheduleVo sghScheduleVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertMovieSchedule", sghScheduleVo);
	}

	@Override
	public SghScheduleVo getMovieScheduleOne(String movie_schedule_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getMovieScheduleOne", movie_schedule_code);
	}

	@Override
	public void updateSchedule(SghScheduleVo sghScheduleVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateSchedule", sghScheduleVo);
	}

	@Override
	public int getMovieScheduleCount() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getMovieScheduleCount");
	}

	@Override
	public List<SghScheduleVo> deleteScheduleList(SghPagingDto sghPagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "deleteScheduleList", sghPagingDto);
	}

	@Override
	public int getDeleteScheduleCount() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getDeleteScheduleCount");
	}

	@Override
	public void stateDeleteSchedule(String movie_schedule_code) throws Exception {
		sqlSession.update(NAMESPACE + "stateDeleteSchedule", movie_schedule_code);
	}

	@Override
	public void stateRestoreSchedule(String movie_schedule_code) throws Exception {
		sqlSession.update(NAMESPACE + "stateRestoreSchedule", movie_schedule_code);
	}

	@Override
	public List<SghScheduleVo> endDateOutScheduleList(SghPagingDto sghPagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "endDateOutScheduleList", sghPagingDto);
	}

	@Override
	public int getEndDateOutScheduleCount() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getEndDateOutScheduleCount");
	}

}
