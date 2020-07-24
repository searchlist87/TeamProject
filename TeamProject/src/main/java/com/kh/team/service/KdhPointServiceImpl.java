package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.KdhPointCodeVo;
import com.kh.team.domain.KdhPointVo;
import com.kh.team.persistence.KdhPointDao;

@Service
public class KdhPointServiceImpl implements KdhPointService {

	@Inject
	KdhPointDao pointDao;
	
	@Override
	public List<KdhPointVo> selectPointById(String user_id) throws Exception {
		return pointDao.selectPointById(user_id);
	}

	@Override
	public void insertPointInData(String user_id, int food_buy_price, int point_percent) throws Exception {
		pointDao.insertPointInData(user_id, food_buy_price, point_percent);
		
	}

	@Override
	public void insertPointInDataUpdate(int point_num, String user_id) throws Exception {
		pointDao.insertPointInDataUpdate(point_num, user_id);
		
	}

	@Override
	public int selectTotalPoint(String user_id) throws Exception {
		return pointDao.selectTotalPoint(user_id);
	}
	
	@Override
	public void updateTotalUserPoint(int user_point, String user_id) throws Exception {
		pointDao.updateTotalUserPoint(user_point, user_id);
		
	}

	@Override
	public void updateUserPoint(int user_point, String user_id) throws Exception {
		
		pointDao.updateUserPoint(user_point, user_id);
		
	}

	@Override
	public KdhPointCodeVo selectFoodPercent() throws Exception {
		return pointDao.selectFoodPercent();
	}
	
	

}
