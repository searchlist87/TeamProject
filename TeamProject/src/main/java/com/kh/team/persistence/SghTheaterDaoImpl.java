package com.kh.team.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.SghTheaterVo;

@Repository
public class SghTheaterDaoImpl implements SghTheaterDao {

	private final String NAMESPACE = "mappers.sgh-theater-mapper.";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<SghTheaterVo> getTheaterList() throws Exception {
		return sqlSession.selectList(NAMESPACE + "getTheaterList");
	}

}
