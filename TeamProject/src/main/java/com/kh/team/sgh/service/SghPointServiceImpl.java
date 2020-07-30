package com.kh.team.sgh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.SghPointListVo;
import com.kh.team.sgh.persistence.SghPointDao;

@Service
public class SghPointServiceImpl implements SghPointService {

	@Inject
	private SghPointDao sghPointDao; 
	
	@Override
	public int getUserPoint(String user_id) throws Exception {
		return sghPointDao.getUserPoint(user_id);
	}

	@Override
	public void updatePoint(String user_id, int use_point) throws Exception {
		sghPointDao.updatePoint(user_id, use_point);
	}

	@Override
	public void insertUsedPoint(String user_id, int use_point) throws Exception {
		sghPointDao.insertUsedPoint(user_id, use_point);
	}

	@Override
	public List<SghPointListVo> getPointList(String user_id) throws Exception {
		return sghPointDao.getPointList(user_id);
	}

}
