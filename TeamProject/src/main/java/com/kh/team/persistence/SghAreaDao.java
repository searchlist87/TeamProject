package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.SghAreaVo;

public interface SghAreaDao {

	// 지역 리스트 가져오기
	public List<SghAreaVo> getAreaList() throws Exception;
}
