package com.kh.team.sgh.service;

import java.util.List;

import com.kh.team.sgh.domain.SghAreaVo;

public interface SghAreaService {
	// 지역 리스트 가져오기
	public List<SghAreaVo> getAreaList() throws Exception;
}