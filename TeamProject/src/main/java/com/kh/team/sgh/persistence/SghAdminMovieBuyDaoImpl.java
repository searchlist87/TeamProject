package com.kh.team.sgh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.SghAdminMovieBuyVo;
import com.kh.team.domain.SghBuyCodeDto;
import com.kh.team.domain.SghBuyMovieVo;
import com.kh.team.domain.SghBuyTheaterVo;
import com.kh.team.domain.SghPagingDto;

@Repository
public class SghAdminMovieBuyDaoImpl implements SghAdminMovieBuyDao {

	private final String NAMESPACE = "mappers.sgh-movie-buy-mapper.";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<SghAdminMovieBuyVo> getAdminMovieBuyList(SghPagingDto sghPagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getAdminMovieBuyList", sghPagingDto);
	}

	@Override
	public int getTotalCount(SghPagingDto sghPagingDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getTotalCount", sghPagingDto);
	}

	@Override
	public List<SghBuyTheaterVo> getBuyTheaterList(String area_code) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getBuyTheaterList", area_code);
	}

	@Override
	public List<SghBuyMovieVo> getBuyMovieList(String theater_code) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getBuyMovieList", theater_code);
	}

	@Override
	public int getBuyTotal(SghBuyCodeDto sghBuyCodeDto) throws Exception {
		int total = sqlSession.selectOne(NAMESPACE + "getBuyTotal", sghBuyCodeDto);
		System.out.println("total :" + total);
		System.out.println("daosghBuyCodeDto :" + sghBuyCodeDto);
		return total;
	}
}
