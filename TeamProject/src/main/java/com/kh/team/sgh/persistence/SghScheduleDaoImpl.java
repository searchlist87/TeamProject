package com.kh.team.sgh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.SghScheduleVo;

@Repository
public class SghScheduleDaoImpl implements SghScheduleDao {

	private final String NAMESPACE = "mappers.sgh-schedule-mapper.";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<SghScheduleVo> getScheduleList() throws Exception {
		return sqlSession.selectList(NAMESPACE + "scheduleList");
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

}
