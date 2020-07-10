package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.SghTheaterVo;

public interface SghTheaterService {

	// 지역 목록 가져오기
	public List<SghTheaterVo> getTheaterList() throws Exception;
}
