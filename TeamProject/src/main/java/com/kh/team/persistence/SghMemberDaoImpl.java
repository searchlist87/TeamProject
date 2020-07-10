package com.kh.team.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.kh.team.domain.SghUserVo;

public class SghMemberDaoImpl implements SghMemberDao {

	private final String NAMESPACE = "";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public SghUserVo memberInsert() throws Exception {
		return null;
	}

}
