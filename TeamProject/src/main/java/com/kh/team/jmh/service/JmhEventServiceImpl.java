package com.kh.team.jmh.service;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.JmhEventVo;
import com.kh.team.jmh.persistence.JmhEventDao;

@Service
public class JmhEventServiceImpl implements JmhEventService {
	
	@Inject
	private JmhEventDao jmhEventDao;

	// 이벤트 등록
	@Override
	public void eventRegister(JmhEventVo jmhEventVo) throws Exception {
		jmhEventDao.eventRegister(jmhEventVo);
	}

	// 이벤트 조회
	@Override
	public List<JmhEventVo> eventList(String keyword, String searchType, Date event_date) throws Exception {
		return jmhEventDao.eventList(keyword, searchType, event_date);
	}
	
	// [admin]이벤트 조회
	@Override
	public List<JmhEventVo> adminEventList(String keyword, String searchType) throws Exception {
		return jmhEventDao.adminEventList(keyword, searchType);
	}
	
	// 이벤트 수정
	@Override
	public void eventModify(JmhEventVo jmhEventVo) throws Exception {
		jmhEventDao.eventModify(jmhEventVo);
	}

	// 이벤트 상세조회
	@Override
	public JmhEventVo selectByEvent(int event_code) throws Exception {
		return jmhEventDao.selectByEvent(event_code);
	}

	// 지난 이벤트 조회
	@Override
	public List<JmhEventVo> pastEventList(Date event_end_date) throws Exception {
		return jmhEventDao.pastEventList(event_end_date);
	}

	
}