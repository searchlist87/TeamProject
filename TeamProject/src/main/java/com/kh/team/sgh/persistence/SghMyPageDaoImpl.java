package com.kh.team.sgh.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.SghBuyListVo;
import com.kh.team.domain.SghMyMovieBuyVo;
import com.kh.team.domain.SghPagingDto;

@Repository
public class SghMyPageDaoImpl implements SghMyPageDao {

	private final String NAMESPACE = "mappers.sgh-mypage-mapper.";
	@Inject
	private SqlSession sqlSession;
	
	
	@Override
	public List<SghMyMovieBuyVo> getMyMovieBuyList(String user_id) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getMyMovieBuyList", user_id);
	}


	@Override
	public List<SghBuyListVo> getBuyList(int start_row, int end_row, String user_id) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("start_row", start_row);
		paramMap.put("end_row", end_row);
		paramMap.put("user_id", user_id);
		return sqlSession.selectList(NAMESPACE + "getBuyList", paramMap);
	}


	@Override
	public List<SghBuyListVo> getOutBuyList(int start_row, int end_row, String user_id) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("start_row", start_row);
		paramMap.put("end_row", end_row);
		paramMap.put("user_id", user_id);
		return sqlSession.selectList(NAMESPACE + "getOutBuyList", paramMap);
	}


	@Override
	public int getBuyTotal(String user_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getBuyTotal", user_id);
	}


	@Override
	public int getOutBuyTotal(String user_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getOutBuyTotal", user_id);
	}

}
