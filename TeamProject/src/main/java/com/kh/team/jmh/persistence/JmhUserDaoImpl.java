package com.kh.team.jmh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.JmhUserVo;

@Repository
public class JmhUserDaoImpl implements JmhUserDao {

	private final String NAMESPACE = "mappers.jmh-user-mapper.";
	
	@Inject
	private SqlSession sqlSession;
	
	
	//회원 정보 가져오기
	@Override
	public List<JmhUserVo> getUserInfo() throws Exception {
		return sqlSession.selectList(NAMESPACE + "getUserInfo");
	}

}
