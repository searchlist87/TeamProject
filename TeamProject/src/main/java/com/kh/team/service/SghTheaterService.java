package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.SghTheaterVo;

public interface SghTheaterService {

	// 지역 리스트 가져오기
	public List<SghTheaterVo> getAreaList() throws Exception;
}
