package com.kh.team.sgh.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class SghPointDaoImpl implements SghPointDao {

	private final String NAMESPACE = "mappers.sgh-point-mapper.";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public int getUserPoint(String user_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getUserPoint", user_id);
	}

	@Override
	public void updatePoint(String user_id, int use_point) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("user_id", user_id);
		paramMap.put("use_point", use_point);
		sqlSession.update(NAMESPACE + "updatePoint", paramMap);
	}

	@Override
	public void insertUsedPoint(String user_id, int use_point) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("user_id", user_id);
		paramMap.put("use_point", use_point);
		sqlSession.insert(NAMESPACE + "insertUsedPoint", paramMap);
	}

}
