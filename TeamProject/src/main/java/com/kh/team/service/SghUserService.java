package com.kh.team.service;

import com.kh.team.domain.SghLoginDto;
import com.kh.team.domain.SghUserVo;

public interface SghUserService {
	// 회원가입
	public void userJoin(SghUserVo sghUserVo) throws Exception;
	// 로그인
	public SghUserVo userLogin(SghLoginDto sghLoginDto) throws Exception;
	// 아이디 중복 체크
	public int userIdDupCheck(String user_id) throws Exception;
}
