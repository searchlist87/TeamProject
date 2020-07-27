package com.kh.team.sgh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.SghMyMovieBuyVo;

@Repository
public class SghMyPageDaoImpl implements SghMyPageDao {

	private final String NAMESPACE = "mappers.sgh-mypage-mapper.";
	@Inject
	private SqlSession sqlSession;
	
	
	@Override
	public List<SghMyMovieBuyVo> getMyMovieBuyList(String user_id) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getMyMovieBuyList", user_id);
	}

}
