package com.kh.team.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.GshMovieDto;

@Repository
public class GshMovieDaoImpl implements GshMovieDao {
	
	private static final String NAMESPACE = "mappers.gsh-movie-mapper.";
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public List<GshMovieDto> select_movie_list() throws Exception {
		return sqlSession.selectList(NAMESPACE + "select_movie_list");
	}

}
