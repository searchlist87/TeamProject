package com.kh.team.jmh.service;

import java.sql.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.JmhEventVo;
import com.kh.team.domain.JmhPagingDto;
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

	// 이벤트 총 갯수 가져오기
	@Override
	public int getCountEvent(JmhPagingDto jmhPagingDto) throws Exception {
		return jmhEventDao.getCountEvent(jmhPagingDto);
	}

	// 이벤트 페이징
	@Override
	public List<JmhEventVo> eventPagingList(JmhPagingDto jmhPagingDto) throws Exception {
		
		return jmhEventDao.eventPagingList(jmhPagingDto);
	}

	// theater페이지 event 3개 가져오기
	@Override
	public List<JmhEventVo> selectEventThree(Date event_date) throws Exception {
		return jmhEventDao.selectEventThree(event_date);
	}

	// 지난이벤트 갯수 가져오기
	@Override
	public int pastEventCount(JmhPagingDto jmhPagingDto) throws Exception {
		return jmhEventDao.pastEventCount(jmhPagingDto);
	}

	// 지난 이벤트 페이징
	@Override
	public List<JmhEventVo> pastEventPagingList(JmhPagingDto jmhPagingDto) throws Exception {
		return jmhEventDao.pastEventPagingList(jmhPagingDto);
	}
	
	// ----------------------- 사용자 끝 -----------------------------
	
	// ----------------------- admin ---------------------------------
		
	// [admin]이벤트 조회
	@Override
	public List<JmhEventVo> adminEventList(JmhPagingDto jmhPagingDto) throws Exception {
		return jmhEventDao.adminEventList(jmhPagingDto);
	}

	// [admin] 이벤트 총 갯수
	@Override
	public int adminEventCount(JmhPagingDto jmhPagingDto) throws Exception {
		return jmhEventDao.adminEventCount(jmhPagingDto);
	}

	// [admin] 이벤트 페이징
	@Override
	public List<JmhEventVo> adminEventPagingList(JmhPagingDto jmhPagingDto) throws Exception {
		return jmhEventDao.adminEventPagingList(jmhPagingDto);
	}

	
}