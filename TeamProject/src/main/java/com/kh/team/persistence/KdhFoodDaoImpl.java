package com.kh.team.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.KdhFoodVo;

@Repository
public class KdhFoodDaoImpl implements KdhFoodDao {

	private final String NAMESPACE = "mappers.kdh-food-mapper.";
	@Inject
	SqlSession sqlSession;
	
	// 상품 전체 조회
	@Override
	public List<KdhFoodVo> listFood() throws Exception {
		return sqlSession.selectList(NAMESPACE + "listFood");
	}

	// 해당 상품 조회
	@Override
	public KdhFoodVo selectFoodbyNum(int food_num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectFoodbyNum", food_num);
	}

	// 상품 등록
	@Override
	public void insertFood(KdhFoodVo foodVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertFood", foodVo);
	}

	// 상품 수정
	@Override
	public void updateFood(KdhFoodVo foodVo) throws Exception {
		sqlSession.update(NAMESPACE + "updateFood", foodVo);
	}

	// food number 100(스낵)만 선택
	@Override
	public List<KdhFoodVo> listFoodCode100() throws Exception {
		return sqlSession.selectList(NAMESPACE + "listFoodCode100");
	}

	// food number 200(스낵)만 선택
	@Override
	public List<KdhFoodVo> listFoodCode200() throws Exception {
		return sqlSession.selectList(NAMESPACE + "listFoodCode200");
	}

	// food number 300(스낵)만 선택
	@Override
	public List<KdhFoodVo> listFoodCode300() throws Exception {
		return sqlSession.selectList(NAMESPACE + "listFoodCode300");
	}

}
