package com.kh.team.jmh.service;

import java.util.List;

import com.kh.team.domain.JmhUserVo;

public interface JmhUserService {
	
	//회원 정보 가져오기
	public List<JmhUserVo> getUserInfo() throws Exception;
}
