package com.kh.team.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		System.out.println("write_review, ghGshReviewVo:"+ ghGshReviewVo);
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
	public void update_review(String review_content,int review_score,int review_num,String user_id) throws Exception {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("review_content", review_content);
		paraMap.put("review_score", review_score);
		paraMap.put("review_num", review_num);
		paraMap.put("user_id", user_id);
		
		sqlSession.update(NAMESPACE + "update_review", paraMap);
	}
	
	// 리뷰 삭제
	@Override
	public void delete_review(int review_num, String user_id) throws Exception {
		Map<String, Object> paraMap = new HashMap<>();
		paraMap.put("review_num", review_num);
		paraMap.put("user_id", user_id);
		sqlSession.delete(NAMESPACE + "delete_review", paraMap);
	}

	// 해당 영화 리뷰 조회
	@Override
	public List<GshReviewVo> selectReviewByCode(String movie_code) throws Exception {
		return sqlSession.selectList(NAMESPACE + "selectReviewByCode", movie_code);
	}

	// 해당 영화 평균점수 구하기
	@Override
	public int averageReviewScore(String movie_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "averageReviewScore", movie_code);
	}

	// 관리자 리뷰 삭제
	@Override
	public void admin_review_delete(int review_num) throws Exception {
		sqlSession.delete(NAMESPACE + "admin_review_delete", review_num);
	}

}
