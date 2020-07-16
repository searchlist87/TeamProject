package com.kh.team.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.SghMovieScreenVo;

@Repository
public class SghMovieScreenDaoImpl implements SghMovieScreenDao {

	private final String NAMESPACE = "mappers.sgh-screen-mapper.";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<SghMovieScreenVo> getScreenList(String theater_code) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getScreenList", theater_code);
	}

}
