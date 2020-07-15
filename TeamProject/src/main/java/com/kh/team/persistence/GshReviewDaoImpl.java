package com.kh.team.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.GshMovieDto;
import com.kh.team.domain.GshReviewVo;

@Repository
public class GshReviewDaoImpl implements GshReviewDao {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "mappers.gsh-review-mapper.";
	
	@Override
	public void write_review() throws Exception {
		
	}

	@Override
	public List<GshReviewVo> reviewList() throws Exception {
		return null;
	}

	@Override
	public List<GshMovieDto> select_review_code() throws Exception {
		return sqlSession.selectList(NAMESPACE + "select_review_code");
	}
	
//	// 리뷰 수정
	@Override
	public List<GshReviewVo> reviewModify() throws Exception {
//		return sqlSession.update(NAMESPACE + "reviewModify");
		return null;
	}
	
	// 리뷰 삭제
	@Override
	public List<GshReviewVo> reviewDelete() throws Exception {
		return null;
	}

}
