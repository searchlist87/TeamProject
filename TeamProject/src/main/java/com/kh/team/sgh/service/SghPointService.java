package com.kh.team.sgh.service;

import java.util.List;

import com.kh.team.domain.SghPointListVo;

public interface SghPointService {
	// 포인트 내역 조회
	public List<SghPointListVo> getPointList(String user_id) throws Exception;
	
	// 포인트 조회
	public int getUserPoint(String user_id) throws Exception;
	
	// 포인트 사용하기
	public void updatePoint(String user_id, int use_point) throws Exception;
	
	// 포인트 사용 내역에 추가하기
	public void insertUsedPoint(String user_id, int use_point) throws Exception;
}
