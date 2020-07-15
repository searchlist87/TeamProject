package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.SghTheaterVo;

public interface SghTheaterService {

	// 지역 목록 가져오기
	public List<SghTheaterVo> getTheaterList() throws Exception;
	// 영화관 등록하기
	public void movieTheaterAdd(SghTheaterVo sghTheaterVo) throws Exception; 
}
