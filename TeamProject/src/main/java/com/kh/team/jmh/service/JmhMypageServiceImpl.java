package com.kh.team.jmh.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.JmhMyPageVo;
import com.kh.team.jmh.persistence.JmhMyPageDao;

@Service
public class JmhMypageServiceImpl implements JmhMypageService {
	
	@Inject
	private JmhMyPageDao jmhMypageDao;

	// ----- 회원 정보 관리 -------
	// 내 정보 가져오기
	@Override
	public JmhMyPageVo getUserInfo(String user_id) throws Exception {
		return jmhMypageDao.getUserInfo(user_id);
	}

	// 내 정보 수정하기
	@Override
	public void modifyUserInfo(JmhMyPageVo jmhMyPageVo) throws Exception {
		jmhMypageDao.modifyUserInfo(jmhMyPageVo);
	}

	// 회원 탈퇴하기
	@Override
	public void secessionUser(String user_id) throws Exception {
		jmhMypageDao.secessionUser(user_id);
	}

}
