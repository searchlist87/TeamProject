package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.SghAreaVo;

public interface SghAreaService {
	// 지역 리스트 가져오기
	public List<SghAreaVo> getAreaList() throws Exception;
}
