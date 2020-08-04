package com.kh.team.kdh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.KdhMypagePointDto;
import com.kh.team.domain.KdhPointCodeVo;
import com.kh.team.domain.KdhPointVo;
import com.kh.team.domain.KdhUserVo;
import com.kh.team.kdh.persistence.KdhPointDao;

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
	public void updateUserPoint(int user_point, int used_Point, String user_id) throws Exception {
		pointDao.updateUserPoint(user_point, used_Point, user_id);
		
	}

	@Override
	public KdhPointCodeVo selectFoodPercent() throws Exception {
		return pointDao.selectFoodPercent();
	}

	@Override
	public int selectPointByUserId(String user_id) throws Exception {
		return pointDao.selectPointByUserId(user_id);
	}

	@Override
	public void insertUsedPointInfo(String user_id, int used_point) throws Exception {
		pointDao.insertUsedPointInfo(user_id, used_point);
	}

	@Override
	public List<KdhMypagePointDto> selectUsedPointInfo(String user_id) throws Exception {
		return pointDao.selectUsedPointInfo(user_id);
	}
	
	

}
