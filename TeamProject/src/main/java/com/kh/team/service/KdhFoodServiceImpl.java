package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.KdhFoodVo;
import com.kh.team.domain.KdhPagingDto;
import com.kh.team.persistence.KdhFoodDao;

@Service
public class KdhFoodServiceImpl implements KdhFoodService {

	@Inject
	private KdhFoodDao foodDao;
	
	@Override
	public List<KdhFoodVo> listFood() throws Exception {
		return foodDao.listFood();
	}

	@Override
	public KdhFoodVo selectFoodbyNum(int food_num) throws Exception {
		return foodDao.selectFoodbyNum(food_num);
	}

	@Override
	public void insertFood(KdhFoodVo foodVo) throws Exception {
		foodDao.insertFood(foodVo);
	}

	@Override
	public void updateFood(KdhFoodVo foodVo) throws Exception {
		foodDao.updateFood(foodVo);
	}

	@Override
	public List<KdhFoodVo> listFoodCode100() throws Exception {
		return foodDao.listFoodCode100();
	}

	@Override
	public List<KdhFoodVo> listFoodCode200() throws Exception {
		return foodDao.listFoodCode200();
	}

	@Override
	public List<KdhFoodVo> listFoodCode300() throws Exception {
		return foodDao.listFoodCode300();
	}

	@Override
	public List<KdhFoodVo> listLatestFood() throws Exception {
		return foodDao.listLatestFood();
	}

	@Override
	public List<KdhFoodVo> listPage(KdhPagingDto pagingDto) throws Exception {
		return foodDao.listPage(pagingDto);
	}

}
