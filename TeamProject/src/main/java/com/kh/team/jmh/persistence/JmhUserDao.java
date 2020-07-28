package com.kh.team.jmh.persistence;

import java.util.List;

import com.kh.team.domain.JmhUserVo;

public interface JmhUserDao {
	
	//회원 정보 가져오기
	public List<JmhUserVo> getUserInfo() throws Exception;

}
