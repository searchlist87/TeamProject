package com.kh.team.jmh.persistence;

import java.sql.Date;
import java.util.List;

import com.kh.team.domain.JmhEventVo;
import com.kh.team.domain.JmhPagingDto;

public interface JmhEventDao {
	
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
	
	// 이벤트 총 갯수 가져오기
	public int getCountEvent(Date event_date) throws Exception;
	
	// 이벤트 페이징
	public List<JmhEventVo> eventPagingList(JmhPagingDto jmhPagingDto) throws Exception;
	
	// [admin] 이벤트 총 갯수 가져오기
	
	// theater페이지 event 3개 가져오기
	public List<JmhEventVo> selectEventThree(Date event_date) throws Exception;

}
