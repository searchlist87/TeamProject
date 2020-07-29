package com.kh.team.jmh.persistence;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.JmhEventVo;
import com.kh.team.domain.JmhPagingDto;

@Repository
public class JmhEventDaoImpl implements JmhEventDao {

	private static final String NAMESPACE = "mappers.jmh-event-mapper.";
	
	@Inject
	private SqlSession sqlSession;
	
	// 이벤트 등록
	@Override
	public void eventRegister(JmhEventVo jmhEventVo) throws Exception {
		sqlSession.insert(NAMESPACE + "eventRegister", jmhEventVo);
	}

	// 이벤트 조회
	@Override
	public List<JmhEventVo> eventList(String keyword, String searchType, Date event_date) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("keyword", keyword);
		paramMap.put("searchType", searchType);
		paramMap.put("event_date", event_date);
		System.out.println("event_date :"+ event_date);
		return sqlSession.selectList(NAMESPACE + "eventList", paramMap);
	}
	
	

	// 이벤트 수정
	@Override
	public void eventModify(JmhEventVo jmhEventVo) throws Exception {
		sqlSession.update(NAMESPACE + "eventUpdate", jmhEventVo);
	}

	// 이벤트 상세페이지
	@Override
	public JmhEventVo selectByEvent(int event_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectBeEvent", event_code);
	}

	// 지난 이벤트 조회
	@Override
	public List<JmhEventVo> pastEventList(Date event_end_date) throws Exception {
		return sqlSession.selectList(NAMESPACE + "pastEventList", event_end_date);
	}

	// 이벤트 총 갯수 가져오기
	@Override
	public int getCountEvent(JmhPagingDto jmhPagingDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getCountEvent", jmhPagingDto);
	}

	// 이벤트 페이징
	@Override
	public List<JmhEventVo> eventPagingList(JmhPagingDto jmhPagingDto) throws Exception {
		System.out.println("jmhPagingDto :" + jmhPagingDto);
		
		return sqlSession.selectList(NAMESPACE + "eventListPaging", jmhPagingDto);
	}

	// theater페이지 event 3개 가져오기
	@Override
	public List<JmhEventVo> selectEventThree(Date event_date) throws Exception {
		return sqlSession.selectList(NAMESPACE + "selectEventThree", event_date);
	}

	// 지난 이벤트 갯수 가져오기
	@Override
	public int pastEventCount(JmhPagingDto jmhPagingDto) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE + "pastEventCount",jmhPagingDto );
	}

	// 지난 이벤트 페이징
	@Override
	public List<JmhEventVo> pastEventPagingList(JmhPagingDto jmhPagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "pastEventListPaging", jmhPagingDto);
	}
	
	// ---------------- 사용자 끝 -------------------------
	
	// ------------------- admin -------------------------------
	
	// [admin] 이벤트 조회
	@Override
	public List<JmhEventVo> adminEventList(JmhPagingDto jmhPagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "adminEventList", jmhPagingDto);
	}
	
	// [admin] 이벤트 총 갯수
	@Override
	public int adminEventCount(JmhPagingDto jmhPagingDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "adminGetCountEvent", jmhPagingDto);
	}

	// [admin] 이벤트 페이징
	@Override
	public List<JmhEventVo> adminEventPagingList(JmhPagingDto jmhPagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "adminEventListPaging", jmhPagingDto);
	}
	
}