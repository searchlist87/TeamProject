package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.SghTheaterVo;

public interface SghTheaterDao {

	// 지역 리스트 가져오기
	public List<SghTheaterVo> getTheaterList() throws Exception;
}
