package com.kh.team.kdh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.KdhAdminFoodBuyListDto;
import com.kh.team.domain.KdhBasicCartDto;
import com.kh.team.domain.KdhBuyFoodInfo;
import com.kh.team.domain.KdhFoodVo;
import com.kh.team.domain.KdhPagingDto;
import com.kh.team.domain.KdhUserVo;
import com.kh.team.domain.kdhFoodBuyDto;
import com.kh.team.domain.kdhFoodBuyListDto;
import com.kh.team.kdh.persistence.KdhFoodDao;

@Service
public class KdhFoodServiceImpl implements KdhFoodService {

	@Inject
	private KdhFoodDao foodDao;
	
	@Override
	public List<KdhFoodVo> selectListFood() throws Exception {
		return foodDao.selectListFood();
	}

	@Override
	public KdhFoodVo selectFoodbyNum(int food_num) throws Exception {
		return foodDao.selectFoodbyNum(food_num);
	}

	@Override
	public List<KdhFoodVo> selectListFoodCode100(KdhPagingDto pagingDto) throws Exception {
		return foodDao.selectListFoodCode100(pagingDto);
	}

	@Override
	public List<KdhFoodVo> selectListFoodCode200(KdhPagingDto pagingDto) throws Exception {
		return foodDao.selectListFoodCode200(pagingDto);
	}

	@Override
	public List<KdhFoodVo> selectListFoodCode300(KdhPagingDto pagingDto) throws Exception {
		return foodDao.selectListFoodCode300(pagingDto);
	}

	@Override
	public List<KdhFoodVo> selectListLatestFood3() throws Exception {
		return foodDao.selectListLatestFood3();
	}

	@Override
	public List<KdhFoodVo> listPage(KdhPagingDto pagingDto) throws Exception {
		return foodDao.listPage(pagingDto);
	}

	@Override
	public int selectFoodCount() throws Exception {
		return foodDao.selectFoodCount();
	}

	@Override
	public int selectCountFoodCode100() throws Exception {
		return foodDao.selectCountFoodCode100();
	}

	@Override
	public int selectCountFoodCode200() throws Exception {
		return foodDao.selectCountFoodCode200();
	}

	@Override
	public int selectCountFoodCode300() throws Exception {
		return foodDao.selectCountFoodCode300();
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

	@Override
	public KdhUserVo selectUserInfo(String user_id) throws Exception {
		return foodDao.selectUserInfo(user_id);
	}

	@Override
	public void updateFoodbyNum(KdhFoodVo foodVo) throws Exception {
		foodDao.updateFoodbyNum(foodVo);		
	}

	@Override
	public void deleteFoodByNum(int food_num) throws Exception {
		foodDao.deleteFoodByNum(food_num);
	}

	@Override
	public void deleteFoodBuy(int food_num) throws Exception {
		foodDao.deleteFoodBuy(food_num);
	}

	@Override
	public void insertFood(KdhFoodVo foodVo) throws Exception {
		foodDao.insertFood(foodVo);
	}

	@Override
	public List<KdhAdminFoodBuyListDto> selectBuyFoodList() throws Exception {
		return foodDao.selectBuyFoodList();
	}

	@Override
	public void updateFoodCount(int food_count, int food_buy_count, int buy_food_num) throws Exception {
		foodDao.updateFoodCount(food_count, food_buy_count, buy_food_num);
	}


}
