package com.kh.team.jmh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.JmhMovieBest3Vo;
@Repository
public class JmhMovieBest3DaoImpl implements JmhMovieBest3Dao {
	
	private final String NAMESPACE = "mappers.jmh-best3-mapper.";

	@Inject
	private SqlSession sqlSession;
	
	// 영화 best3 가져오기
	@Override
	public List<JmhMovieBest3Vo> getMovieBest3() throws Exception {
		return sqlSession.selectList(NAMESPACE + "getMovieBest3");
	}
}