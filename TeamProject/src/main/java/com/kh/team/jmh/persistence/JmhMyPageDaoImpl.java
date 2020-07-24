package com.kh.team.jmh.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.JmhMyPageVo;

@Repository
public class JmhMyPageDaoImpl implements JmhMyPageDao {
	
	private final String NAMESPACE = "mappers.jmh-mypage-mapper.";
	
	@Inject
	private SqlSession sqlSession;

	// ----- 회원 정보 관리 -------
	// 내 정보 가져오기
	@Override
	public JmhMyPageVo getUserInfo(String user_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getUserInfo", user_id);
	}

	// 내 정보 수정하기
	@Override
	public void modifyUserInfo(JmhMyPageVo jmhMyPageVo) throws Exception {
		sqlSession.update(NAMESPACE + "modifyUserInfo", jmhMyPageVo);

	}

	// 회원 탈퇴하기
	@Override
	public void secessionUser(String user_id) throws Exception {
		sqlSession.update(NAMESPACE + "secessionUser", user_id);
	}

}
