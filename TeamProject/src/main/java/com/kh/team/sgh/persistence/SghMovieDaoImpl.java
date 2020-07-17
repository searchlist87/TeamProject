package com.kh.team.sgh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.SghScheduleListDto;

@Repository
public class SghMovieDaoImpl implements SghMovieDao {

	private final String NAMESPACE = "mappers.sgh-movie-mapper.";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<SghScheduleListDto> getScheduleMovieList() throws Exception {
		return sqlSession.selectList(NAMESPACE + "getScheduleMovieList");
	}

}
