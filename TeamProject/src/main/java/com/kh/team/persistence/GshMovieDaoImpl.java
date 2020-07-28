package com.kh.team.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.GshMovieDto;
import com.kh.team.domain.GshMovieListVo;

@Repository
public class GshMovieDaoImpl implements GshMovieDao {
	
	private static final String NAMESPACE = "mappers.gsh-movie-mapper.";
	
	@Inject
	private SqlSession sqlSession;
	
	// 영화 목록 보기
	@Override
	public List<GshMovieDto> select_movieAll() throws Exception {
		return sqlSession.selectList(NAMESPACE + "select_movieAll");
	}
	
	// 영화 코드로 영화 리뷰 보기
	@Override
	public GshMovieDto selectMovieCode(String movie_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "select_movie_code", movie_code);
	}
	
	// 영화 상세 정보 보기
	@Override
	public GshMovieListVo select_movie_code(String movie_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "select_movie_code");
	}
	
	// 영화 서브 이미지(스틸컷) 가져오기
	@Override
	public List<String> selectMovieSubImage(String movie_code) throws Exception {
		return sqlSession.selectList(NAMESPACE + "select_movie_sub_iamage", movie_code);
	}
	
	
	

}
