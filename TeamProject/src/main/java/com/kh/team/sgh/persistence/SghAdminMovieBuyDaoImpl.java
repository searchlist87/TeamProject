package com.kh.team.sgh.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.SghAdminMovieBuyVo;

@Repository
public class SghAdminMovieBuyDaoImpl implements SghAdminMovieBuyDao {

	private final String NAMESPACE = "mappers.sgh-movie-buy-mapper.";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<SghAdminMovieBuyVo> getAdminMovieBuyList(int start_row, int end_row) throws Exception {
		Map<String, Integer> paramMap = new HashMap<String, Integer>();
		paramMap.put("start_row", start_row);
		paramMap.put("end_row", end_row);
		return sqlSession.selectList(NAMESPACE + "getAdminMovieBuyList", paramMap);
	}

	@Override
	public List<SghAdminMovieBuyVo> getKeywordMovieBuyList(String keyword, String category) throws Exception {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("keyword", keyword);
		paramMap.put("category", category);
		return sqlSession.selectList(NAMESPACE + "getKeywordMovieBuyList", paramMap);
	}

	@Override
	public int getTotalCount() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getTotalCount");
	}
}
