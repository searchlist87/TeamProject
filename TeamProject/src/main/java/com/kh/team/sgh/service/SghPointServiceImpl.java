package com.kh.team.sgh.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

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

}
