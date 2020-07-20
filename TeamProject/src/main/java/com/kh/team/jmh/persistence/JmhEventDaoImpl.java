package com.kh.team.jmh.persistence;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.JmhEventVo;

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
	
	// [admin] 이벤트 조회
	@Override
	public List<JmhEventVo> adminEventList(String keyword, String searchType) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("keyword", keyword);
		paramMap.put("searchType", searchType);
		return sqlSession.selectList(NAMESPACE + "adminEventList", paramMap);
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

	
}
