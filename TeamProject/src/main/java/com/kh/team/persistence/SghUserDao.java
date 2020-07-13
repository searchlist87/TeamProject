package com.kh.team.persistence;

import com.kh.team.domain.SghLoginDto;
import com.kh.team.domain.SghUserVo;

public interface SghUserDao {
	// 회원가입
	public void userInsert(SghUserVo sghUserVo) throws Exception;
	// 로그인
	public SghUserVo userLoginSelect(SghLoginDto sghLoginDto) throws Exception;
	// 아이디 중복 확인
	public int userIdDupCheckSelect(String user_id) throws Exception;
}
