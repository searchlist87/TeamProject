package com.kh.team.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.KdhBuyFoodInfo;
import com.kh.team.domain.KdhFoodVo;
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
	public List<KdhFoodVo> listFood() throws Exception {
		return sqlSession.selectList(NAMESPACE + "listFood");
	}

	@Override
	public KdhFoodVo selectFoodbyNum(int food_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectFoodbyNum", food_num);
	}

	@Override
	public List<KdhFoodVo> listFoodCode100(KdhPagingDto pagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "listFoodCode100", pagingDto);
	}

	@Override
	public List<KdhFoodVo> listFoodCode200(KdhPagingDto pagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "listFoodCode200", pagingDto);
	}

	@Override
	public List<KdhFoodVo> listFoodCode300(KdhPagingDto pagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "listFoodCode300", pagingDto);
	}

	@Override
	public List<KdhFoodVo> listLatestFood() throws Exception {
		return sqlSession.selectList(NAMESPACE + "listLatestFood");
	}

	@Override
	public List<KdhFoodVo> listPage(KdhPagingDto pagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "listPage", pagingDto);
	}

	@Override
	public int foodCount() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "foodCount");
	}

	@Override
	public int CountFoodCode100() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "CountFoodCode100");
	}

	@Override
	public int CountFoodCode200() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "CountFoodCode200");
	}

	@Override
	public int CountFoodCode300() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "CountFoodCode300");
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

//	@Override
//	public int selectBuyPrice(String user_id) throws Exception {
//		return sqlSession.selectOne(NAMESPACE + "selectBuyPrice", user_id);
//	}

}
