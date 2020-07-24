package com.kh.team.jmh.service;

import com.kh.team.domain.JmhMyPageVo;

public interface JmhMypageService {
	
	// ----- 회원 정보 관리 -------
	// 내 정보 가져오기
	public JmhMyPageVo getUserInfo(String user_id) throws Exception;
	
	// 내 정보 수정하기
	public void modifyUserInfo(JmhMyPageVo jmhMyPageVo) throws Exception;
	
	// 회원 탈퇴하기
	public void secessionUser(String user_id) throws Exception;

}
