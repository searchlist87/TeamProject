package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.KdhBasicCartDto;
import com.kh.team.domain.KdhBuyFoodInfo;
import com.kh.team.domain.KdhFoodVo;
import com.kh.team.domain.KdhPagingDto;
import com.kh.team.domain.kdhFoodBuyDto;
import com.kh.team.domain.kdhFoodBuyListDto;
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
	public List<KdhFoodVo> listFoodCode100(KdhPagingDto pagingDto) throws Exception {
		return foodDao.listFoodCode100(pagingDto);
	}

	@Override
	public List<KdhFoodVo> listFoodCode200(KdhPagingDto pagingDto) throws Exception {
		return foodDao.listFoodCode200(pagingDto);
	}

	@Override
	public List<KdhFoodVo> listFoodCode300(KdhPagingDto pagingDto) throws Exception {
		return foodDao.listFoodCode300(pagingDto);
	}

	@Override
	public List<KdhFoodVo> listLatestFood() throws Exception {
		return foodDao.listLatestFood();
	}

	@Override
	public List<KdhFoodVo> listPage(KdhPagingDto pagingDto) throws Exception {
		return foodDao.listPage(pagingDto);
	}

	@Override
	public int foodCount() throws Exception {
		return foodDao.foodCount();
	}

	@Override
	public int CountFoodCode100() throws Exception {
		return foodDao.CountFoodCode100();
	}

	@Override
	public int CountFoodCode200() throws Exception {
		return foodDao.CountFoodCode200();
	}

	@Override
	public int CountFoodCode300() throws Exception {
		return foodDao.CountFoodCode300();
	}

	@Override
	public KdhBuyFoodInfo selectBuyFoodbyNum(int food_num) throws Exception {
		return foodDao.selectBuyFoodbyNum(food_num);
	}

	@Override
	public void insertFoodBuy(kdhFoodBuyDto foodBuyDto) throws Exception {
		foodDao.insertFoodBuy(foodBuyDto);
	}

	@Override
	public void insertFoodBuyList(kdhFoodBuyListDto foodBuyListDto) throws Exception {
		foodDao.insertFoodBuyList(foodBuyListDto);
	}

}
