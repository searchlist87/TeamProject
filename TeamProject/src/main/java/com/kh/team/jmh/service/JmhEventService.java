package com.kh.team.jmh.service;

import java.sql.Date;
import java.util.List;

import com.kh.team.domain.JmhEventVo;

public interface JmhEventService {

	// 이벤트 등록
	public void eventRegister(JmhEventVo jmhEventVo) throws Exception;
	
	// 이벤트 조회
	public List<JmhEventVo> eventList(String keyword, String searchType, Date event_date) throws Exception;
	
	// [admin] 이벤트 조회
	public List<JmhEventVo> adminEventList(String keyword, String searchType) throws Exception;
	
	// 이벤트 수정
	public void eventModify(JmhEventVo jmhEventVo) throws Exception;
	
	// 이벤트 상세페이지
	public JmhEventVo selectByEvent(int event_code) throws Exception;
	
	// 지난 이벤트 조회
	public List<JmhEventVo> pastEventList(Date event_end_date) throws Exception;
}
