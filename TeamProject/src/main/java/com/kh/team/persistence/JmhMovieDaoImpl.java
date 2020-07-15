package com.kh.team.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.JmhMovieVo;

@Repository
public class JmhMovieDaoImpl implements JmhMovieDao {

	private static final String NAMESPACE = "mappers.jmh-movie-mapper.";
	
	
	@Inject
	private SqlSession sqlSession;	
	
	// 영화 조회
	@Override
	public List<JmhMovieVo> getMovieList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	// 영화 등록
	@Override
	public void movieRegister(JmhMovieVo jmhMovieVo) throws Exception {
		sqlSession.insert(NAMESPACE + "movieRegister", jmhMovieVo);
	}

	// 영화 수정
	@Override
	public void movieModify(JmhMovieVo jmhMovieVo) throws Exception {
		// TODO Auto-generated method stub

	}

}
