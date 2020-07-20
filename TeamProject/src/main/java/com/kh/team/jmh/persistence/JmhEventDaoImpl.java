package com.kh.team.jmh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.JmhEventVo;

@Repository
public class JmhEventDaoImpl implements JmhEventDao {

	private static final String NAMESPACE = "";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void eventRegister() throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public List<JmhEventVo> eventList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void eventModify() throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void eventDelete() throws Exception {
		// TODO Auto-generated method stub

	}

}
