package com.kh.team.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.GshReviewVo;

@Repository
public class GshReviewDaoImpl implements GshReviewDao {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "mappers.gsh-review-mapper.";
	
	// 리뷰 작성하기
	@Override
	public void write_review(GshReviewVo ghGshReviewVo) throws Exception {
		sqlSession.insert(NAMESPACE + "write_review", ghGshReviewVo);
	}
	
	
	// 리뷰 목록보기
	@Override
	public List<GshReviewVo> reviewList() throws Exception {
		return null;
	}
	
	// 리뷰 코드로 선택해서 보기
	@Override
	public List<GshReviewVo> select_reviewAll() throws Exception {
		return sqlSession.selectList(NAMESPACE + "select_reviewAll");
	}
	
	// 리뷰 수정
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

	// 해당 영화 리뷰 조회
	@Override
	public List<GshReviewVo> selectReviewByCode(String movie_code) throws Exception {
		return sqlSession.selectList(NAMESPACE + "selectReviewByCode", movie_code);
	}


}
