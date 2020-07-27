package com.kh.team.kdh.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.KdhBasicCartDto;
import com.kh.team.domain.KdhFoodCartDto;

@Repository
public class KdhFoodCartDaoImpl implements KdhFoodCartDao {

	@Inject
	SqlSession sqlSession;
	
	private final String NAMESPACE = "mappers.kdh-food-cart-mapper.";
	
	@Override
	public List<KdhFoodCartDto> AllCart(String user_id) throws Exception {
		return sqlSession.selectList(NAMESPACE + "AllCart", user_id);
	}

	@Override
	public KdhFoodCartDto selectCart(String user_id, int food_num) throws Exception {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("user_id", user_id);
		paraMap.put("food_num", food_num);
		return sqlSession.selectOne(NAMESPACE + "selectCart", paraMap);
	}

	@Override
	public void deleteCart(int food_cart_num) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteCart", food_cart_num);
	}

	@Override
	public void updateCart(int food_cart_num, int food_cart_count, int buy_food_price) throws Exception {
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("food_cart_num", food_cart_num);
		paraMap.put("food_cart_count", food_cart_count);
		paraMap.put("buy_food_price", buy_food_price);
		sqlSession.update(NAMESPACE + "updateCart", paraMap);
	}

	@Override
	public void insertCart(KdhFoodCartDto cartDto) throws Exception {
		sqlSession.insert(NAMESPACE + "insertCart", cartDto);
		
	}

	@Override
	public int overlapCart(String user_id, int food_num) throws Exception {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("user_id", user_id);
		paraMap.put("food_num", food_num);
		return sqlSession.selectOne(NAMESPACE + "overlapCart", paraMap);
	}

	@Override
	public int selectFoodnumByCartnum(int food_cart_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectFoodnumByCartnum", food_cart_num);
	}

	@Override
	public int FoodTotalMoney(String user_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "FoodTotalMoney", user_id);
	}

	@Override
	public List<KdhBasicCartDto> selectCartListByUserId(String user_id) throws Exception {
		return sqlSession.selectList(NAMESPACE + "selectCartListByUserId", user_id);
	}

}
