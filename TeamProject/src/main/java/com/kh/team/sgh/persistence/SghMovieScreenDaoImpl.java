package com.kh.team.sgh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.SghMovieScreenVo;
import com.kh.team.domain.SghMovieSeatVo;
import com.kh.team.domain.SghScreenSeatVo;

@Repository
public class SghMovieScreenDaoImpl implements SghMovieScreenDao {

	private final String NAMESPACE = "mappers.sgh-screen-mapper.";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<SghMovieScreenVo> getScreenList(String theater_code) throws Exception {
		return sqlSession.selectList(NAMESPACE + "getScreenList", theater_code);
	}

	@Override
	public void insertScreen(SghMovieScreenVo sghMovieScreenVo) throws Exception {
		sqlSession.insert(NAMESPACE + "insertScreen", sghMovieScreenVo);
	}

	@Override
	public SghMovieScreenVo getScreenOne(String screen_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getScreenOne", screen_code);
	}

	@Override
	public void screenModify(SghMovieScreenVo sghMovieScreenVo) throws Exception {
		sqlSession.update(NAMESPACE + "screenModify", sghMovieScreenVo);
	}

	@Override
	public SghScreenSeatVo getScreenSeat(String screen_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getScreenSeat", screen_code);
	}

	@Override
	public void insertSeat(SghMovieSeatVo sghMovieSeatVo) throws Exception {
		System.out.println("sghMovieSeatVo :" + sghMovieSeatVo);
		sqlSession.insert(NAMESPACE + "insertSeat", sghMovieSeatVo);
	}

	@Override
	public String selectNewDate() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectNewDate");
	}

	@Override
	public void deleteScreenSeat(String screen_code) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteScreenSeat", screen_code);
	}

	@Override
	public int productCheck(String screen_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "productCheck", screen_code);
	}

	@Override
	public void stateDeleteScreen(String screen_code) throws Exception {
		sqlSession.update(NAMESPACE + "stateDeleteScreen", screen_code);
	}

	@Override
	public int getScreenTotal(String theater_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getScreenTotal", theater_code);
	}

//	@Override
//	public void deleteScheduleSeat(String screen_code) throws Exception {
//		sqlSession.delete(NAMESPACE + "screen_code", screen_code);
//	}

}
