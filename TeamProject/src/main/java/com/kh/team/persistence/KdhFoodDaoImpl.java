package com.kh.team.persistence;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.KdhFoodVo;
import com.kh.team.domain.KdhPagingDto;

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


	// food number 100(스낵)만 선택
	@Override
	public List<KdhFoodVo> listFoodCode100(KdhPagingDto pagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "listFoodCode100", pagingDto);
	}

	// food number 200(스낵)만 선택
	@Override
	public List<KdhFoodVo> listFoodCode200(KdhPagingDto pagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "listFoodCode200", pagingDto);
	}

	// food number 300(스낵)만 선택
	@Override
	public List<KdhFoodVo> listFoodCode300(KdhPagingDto pagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "listFoodCode300", pagingDto);
	}

	// 최근 상품 3개 구하기
	@Override
	public List<KdhFoodVo> listLatestFood() throws Exception {
		return sqlSession.selectList(NAMESPACE + "listLatestFood");
	}

	// (페이징)상품 9개씩 나오기
	@Override
	public List<KdhFoodVo> listPage(KdhPagingDto pagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "listPage", pagingDto);
	}

	// 상품 총 개수 구하기
	@Override
	public int foodCount() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "foodCount");
	}

	// food number 100(스낵) 상품 개수 구하기
	@Override
	public int CountFoodCode100() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "CountFoodCode100");
	}

	// food number 200(음료) 상품 개수 구하기
	@Override
	public int CountFoodCode200() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "CountFoodCode200");
	}

	// food number 300(패키지) 상품 개수 구하기
	@Override
	public int CountFoodCode300() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "CountFoodCode300");
	}

}
