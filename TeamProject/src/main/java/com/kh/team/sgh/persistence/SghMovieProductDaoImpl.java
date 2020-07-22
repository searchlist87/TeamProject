package com.kh.team.sgh.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.SghMovieProductVo;
import com.kh.team.domain.SghSeatCheckVo;

@Repository
public class SghMovieProductDaoImpl implements SghMovieProductDao {

	private final String NAMESPACE = "mappers.sgh-movie-product-mapper.";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<SghMovieProductVo> getMovieProductList() throws Exception {
		return sqlSession.selectList(NAMESPACE + "getMovieProductList");
	}

	@Override
	public SghMovieProductVo getMovieProductInfo(String movie_time_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getMovieProductInfo", movie_time_code);
	}

	@Override
	public List<SghSeatCheckVo> getSeatCheck(String movie_time_code) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getSeatCheck", movie_time_code);
	}

}
