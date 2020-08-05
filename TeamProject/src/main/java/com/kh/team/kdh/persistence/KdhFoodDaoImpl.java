package com.kh.team.kdh.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.KdhAdminFoodBuyListDto;
import com.kh.team.domain.KdhBuyFoodInfo;
import com.kh.team.domain.KdhFoodVo;
import com.kh.team.domain.KdhMypageBuyFoodListDto;
import com.kh.team.domain.KdhPagingDto;
import com.kh.team.domain.KdhUserVo;
import com.kh.team.domain.kdhFoodBuyDto;
import com.kh.team.domain.kdhFoodBuyListDto;

@Repository
public class KdhFoodDaoImpl implements KdhFoodDao {

	private final String NAMESPACE = "mappers.kdh-food-mapper.";
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<KdhFoodVo> selectListFood() throws Exception {
		return sqlSession.selectList(NAMESPACE + "selectListFood");
	}

	@Override
	public KdhFoodVo selectFoodbyNum(int food_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectFoodbyNum", food_num);
	}

	@Override
	public List<KdhFoodVo> selectListFoodCode100(KdhPagingDto pagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "selectListFoodCode100", pagingDto);
	}

	@Override
	public List<KdhFoodVo> selectListFoodCode200(KdhPagingDto pagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "selectListFoodCode200", pagingDto);
	}

	@Override
	public List<KdhFoodVo> selectListFoodCode300(KdhPagingDto pagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "selectListFoodCode300", pagingDto);
	}

	@Override
	public List<KdhFoodVo> selectListLatestFood3() throws Exception {
		return sqlSession.selectList(NAMESPACE + "selectListLatestFood3");
	}

	@Override
	public List<KdhFoodVo> listPage(KdhPagingDto pagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "listPage", pagingDto);
	}

	@Override
	public int selectFoodCount() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectFoodCount");
	}

	@Override
	public int selectCountFoodCode100() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectCountFoodCode100");
	}

	@Override
	public int selectCountFoodCode200() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectCountFoodCode200");
	}

	@Override
	public int selectCountFoodCode300() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectCountFoodCode300");
	}

	@Override
	public KdhBuyFoodInfo selectBuyFoodbyNum(int food_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectBuyFoodbyNum", food_num);
	}

	@Override
	public void insertFoodBuy(kdhFoodBuyDto foodBuyDto) throws Exception {
		sqlSession.insert(NAMESPACE + "insertFoodBuy", foodBuyDto);

	}

	@Override
	public void insertFoodBuyList(kdhFoodBuyListDto foodBuyListDto) throws Exception {
		sqlSession.insert(NAMESPACE + "insertFoodBuyList", foodBuyListDto);

	}

	@Override
	public KdhUserVo selectUserInfo(String user_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectUserInfo", user_id);
	}

	@Override
	public void updateFoodbyNum(KdhFoodVo foodVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateFoodbyNum", foodVo);
		
	}

	@Override
	public void deleteFoodByNum(int food_num) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteFoodByNum", food_num);
	}

	@Override
	public void deleteFoodBuy(int food_num) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteFoodBuy", food_num);
	}

	@Override
	public void insertFood(KdhFoodVo foodVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertFood", foodVo);
	}

	@Override
	public List<KdhAdminFoodBuyListDto> selectBuyFoodList() throws Exception {
		return sqlSession.selectList(NAMESPACE + "selectBuyFoodList");
	}

	@Override
	public void updateFoodCount(int food_count,int food_buy_count, int buy_food_num) throws Exception {
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("food_count", food_count);
		paraMap.put("food_buy_count", food_buy_count);
		paraMap.put("buy_food_num", buy_food_num);
		sqlSession.update(NAMESPACE + "updateFoodCount", paraMap);
	}

	@Override
	public List<KdhMypageBuyFoodListDto> selectMyPageBuyFoodList(String user_id) throws Exception {
		return sqlSession.selectList(NAMESPACE + "selectMyPageBuyFoodList", user_id);
	}

	@Override
	public int selectFoodBuyListCount(KdhPagingDto pagingDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectFoodBuyListCount", pagingDto);
	}

	@Override
	public List<KdhAdminFoodBuyListDto> foodBuyListPage(KdhPagingDto pagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "foodBuyListPage", pagingDto);
	}

	@Override
	public List<KdhAdminFoodBuyListDto> foodBuyListMyPage(KdhPagingDto pagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "foodBuyListMyPage", pagingDto);
	}

	@Override
	public int selectMyPageFoodBuyListCount(String user_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectMyPageFoodBuyListCount", user_id);
	}

	@Override
	public List<KdhFoodVo> foodPage(KdhPagingDto pagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "foodPage", pagingDto);
	}

	@Override
	public int selectFoodPageCount(KdhPagingDto pagingDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectFoodPageCount", pagingDto);
	}

	@Override
	public int selectAdminSales(String food_code, int mm_minus) throws Exception {
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("food_code", food_code);
		paraMap.put("mm_minus", mm_minus);
		return sqlSession.selectOne(NAMESPACE + "selectAdminSales", paraMap);
	}



}
