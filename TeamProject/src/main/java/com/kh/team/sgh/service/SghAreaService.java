package com.kh.team.sgh.service;

import java.util.List;

import com.kh.team.domain.SghAreaVo;

public interface SghAreaService {
	// 지역 리스트 가져오기
	public List<SghAreaVo> getAreaList() throws Exception;
	// 삭제된 지역 리스트 가져오기
	public List<SghAreaVo> getDeleteAreaList() throws Exception;
	// 지역 등록
	public void insertArea(String area_name) throws Exception;
	// 지역 정보 하나 가져오기
	public SghAreaVo getAreaInfo(String area_code) throws Exception;
	// 지역 수정
	public void modifyArea(String area_code, String area_name) throws Exception;
	// 지역 삭제
	public void delArea(String area_code) throws Exception;
	// 지역 복구
	public void restoreArea(String area_code) throws Exception;
}
