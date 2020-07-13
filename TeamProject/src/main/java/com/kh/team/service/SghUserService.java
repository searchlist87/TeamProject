package com.kh.team.service;

import com.kh.team.domain.SghLoginDto;
import com.kh.team.domain.SghUserVo;

public interface SghUserService {
	// 회원가입
	public void userJoin(SghUserVo sghUserVo) throws Exception;
	// 로그인
	public int userLogin(SghLoginDto sghLoginDto) throws Exception;
}
