package com.kh.team.jmh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.JmhUserVo;
import com.kh.team.jmh.persistence.JmhUserDao;

@Service
public class JmhUserServiceImpl implements JmhUserService {

	@Inject
	private JmhUserDao jmhUserDao;
	
	//회원 정보 가져오기
	@Override
	public List<JmhUserVo> getUserInfo() throws Exception {
		return jmhUserDao.getUserInfo();
	}

}
