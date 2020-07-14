package com.kh.team.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.GshMovieListVo;

@Repository
public class GshBestListDaoImpl implements GshBestListDao {

	private static final String NAMESPACE = "mappers.gsh-movielist-mapper.";
	
	@Inject
	SqlSession sqlSession;
	
	
	@Override
	// 이름 같아야함
	public List<GshMovieListVo> select_movie_list() throws Exception {
		return sqlSession.selectList(NAMESPACE + "select_movie_list");
	}

}
