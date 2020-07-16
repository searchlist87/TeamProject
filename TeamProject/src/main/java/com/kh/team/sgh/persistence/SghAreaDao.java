package com.kh.team.sgh.persistence;

import java.util.List;

import com.kh.team.sgh.domain.SghAreaVo;

public interface SghAreaDao {

	// 지역 리스트 가져오기
	public List<SghAreaVo> getAreaList() throws Exception;
}
