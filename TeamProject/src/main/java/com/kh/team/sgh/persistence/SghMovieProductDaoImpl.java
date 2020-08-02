package com.kh.team.sgh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.SghMovieBuyIdDateVo;
import com.kh.team.domain.SghMovieProductVo;
import com.kh.team.domain.SghPagingDto;
import com.kh.team.domain.SghPaymentVo;
import com.kh.team.domain.SghSeatCheckVo;

@Repository
public class SghMovieProductDaoImpl implements SghMovieProductDao {

	private final String NAMESPACE = "mappers.sgh-movie-product-mapper.";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<SghMovieProductVo> getMovieProductList(SghPagingDto sghPagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getMovieProductList", sghPagingDto);
	}

	@Override
	public SghMovieProductVo getMovieProductInfo(String movie_time_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getMovieProductInfo", movie_time_code);
	}

	@Override
	public List<SghSeatCheckVo> getSeatCheck(String movie_time_code) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getSeatCheck", movie_time_code);
	}

	@Override
	public List<SghMovieProductVo> getOutProductList(SghPagingDto sghPagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getOutProductList", sghPagingDto);
	}

	@Override
	public int getMovieProductTotal(SghPagingDto sghPagingDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getMovieProductTotal", sghPagingDto);
	}

	@Override
	public int getOutProductTotal() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getOutProductTotal");
	}

	@Override
	public SghMovieBuyIdDateVo getUserIdDate(String schedule_seat_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getUserIdDate", schedule_seat_code);
	}
}
