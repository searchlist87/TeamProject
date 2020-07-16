package com.kh.team.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.SghPagingDto;
import com.kh.team.domain.SghTheaterVo;

@Repository
public class SghTheaterDaoImpl implements SghTheaterDao {

	private final String NAMESPACE = "mappers.sgh-theater-mapper.";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<SghTheaterVo> getTheaterList() throws Exception {
		return sqlSession.selectList(NAMESPACE + "getTheaterList");
	}

	@Override
	public void insertMovieTheater(SghTheaterVo sghTheaterVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertMovieTheater", sghTheaterVo);
	}

	@Override
	public int getTheaterListCount(SghPagingDto sghPagingDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getTheaterListCount", sghPagingDto);
	}

	@Override
	public List<SghTheaterVo> getTheaterPagingList(SghPagingDto sghPagingDto) throws Exception {
		System.out.println("Dao, sghPagingDto:" + sghPagingDto);
		return sqlSession.selectList(NAMESPACE + "theaterListPaging", sghPagingDto);
	}

	@Override
	public void modifyTheater(SghTheaterVo sghTheaterVo) throws Exception {
		sqlSession.update(NAMESPACE + "modifyTheater", sghTheaterVo);
	}

	@Override
	public SghTheaterVo selectOneTheater(String theater_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectOneTheater", theater_code);
	}

}
