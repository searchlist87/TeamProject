package com.kh.team.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.SghLoginDto;
import com.kh.team.domain.SghUserVo;

@Repository
public class SghUserDaoImpl implements SghUserDao {

	private final String NAMESPACE = "mappers.sgh-user-mapper.";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void userInsert(SghUserVo sghUserVo) throws Exception {
		sqlSession.insert(NAMESPACE + "userInsert", sghUserVo);
	}

	@Override
	public SghLoginDto userLoginSelect(SghLoginDto sghLoginDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "userLoginSelect", sghLoginDto);
	}

	@Override
	public int userIdDupCheckSelect(String user_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "userIdDupCheckSelect", user_id);
	}

}
