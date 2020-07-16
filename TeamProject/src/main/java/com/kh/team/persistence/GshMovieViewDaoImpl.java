package com.kh.team.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.GshMovieDto;
import com.kh.team.domain.GshMovieListVo;

@Repository
public class GshMovieViewDaoImpl implements GshMovieViewDao {
	
	private static final String NAMESPACE = "mappers.gsh-movielist-mapper.";
	
	@Inject
	private SqlSession sqlSession; 

	@Override
	public List<GshMovieDto> select_movie_list() throws Exception {
		return sqlSession.selectList(NAMESPACE + "select_movie_list");
	}

}