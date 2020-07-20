package com.kh.team.jmh.persistence;

import java.util.List;

import com.kh.team.domain.JmhEventVo;

public interface JmhEventDao {
	
	// 이벤트 등록
	public void eventRegister() throws Exception;
	
	// 이벤트 조회
	public List<JmhEventVo> eventList() throws Exception;
	
	// 이벤트 수정
	public void eventModify() throws Exception;
	
	// 이벤트 삭제
	public void eventDelete() throws Exception;

}
