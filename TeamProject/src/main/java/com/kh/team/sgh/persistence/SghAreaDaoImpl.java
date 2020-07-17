package com.kh.team.sgh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.SghAreaVo;

@Repository
public class SghAreaDaoImpl implements SghAreaDao {

	private final String NAMESAPCE = "mappers.sgh-area-mapper.";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<SghAreaVo> getAreaList() throws Exception {
		return sqlSession.selectList(NAMESAPCE + "getAreaList");
	}
	
	
}
