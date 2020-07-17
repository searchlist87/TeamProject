package com.kh.team.jmh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.JmhMovieTheaterVo;
@Repository
public class JmhMovieTheaterDaoImpl implements JmhMovieTheaterDao {

	private static final String NAMESPACE = "mappers.jmh-movie-theater-mapper.";
	
	@Inject
	private SqlSession sqlSession;
	@Override
	public List<JmhMovieTheaterVo> getTheaterInfo() throws Exception {
		return sqlSession.selectList(NAMESPACE + "getTheaterInfo");
	}

}
