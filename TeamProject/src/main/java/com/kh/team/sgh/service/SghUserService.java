package com.kh.team.sgh.service;

import java.util.List;

import com.kh.team.domain.SghFindDto;
import com.kh.team.domain.SghFindPwVo;
import com.kh.team.domain.SghLoginDto;
import com.kh.team.domain.SghUserVo;

public interface SghUserService {
	// 회원가입
	public void userJoin(SghUserVo sghUserVo) throws Exception;
	// 로그인
	public SghLoginDto userLogin(SghLoginDto sghLoginDto) throws Exception;
	// 아이디 중복 체크
	public int userIdDupCheck(String user_id) throws Exception;
	// 아이디 찾기
	public List<SghFindDto> userFindId(SghFindDto sghFindDto) throws Exception;
	// 비밀번호 변경
	public void userChengePw(String user_id, String user_pw) throws Exception;
	// 비밀번호 찾기
	public SghFindDto userPwSelect(SghFindPwVo sghFindPwVo) throws Exception;
}
