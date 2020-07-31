package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.GshReviewVo;
import com.kh.team.persistence.GshReviewDao;

@Service
public class GshReviewServiceImpl implements GshReviewService {
	
	@Inject
	private GshReviewDao gshReviewDao;
	
	// 리뷰 목록
	@Override
	public List<GshReviewVo> reviewList() throws Exception {
		return gshReviewDao.reviewList();
	}
	
	// 리뷰 목록 선택
	@Override
	public List<GshReviewVo> select_reviewAll() throws Exception {
		return gshReviewDao.select_reviewAll();
	}
	
	// 리뷰 작성하기
	@Override
	public void write_review(GshReviewVo gshReviewVo) throws Exception {
		gshReviewDao.write_review(gshReviewVo);
	}
	

	// 영화 리뷰 수정
	public void update_review(String review_content,int review_score,int review_num,String user_id) throws Exception {
		gshReviewDao.update_review(review_content, review_score, review_num,user_id);
	}
	
	 // 영화 리뷰 삭제
	public void delete_review(int review_num, String user_id) throws Exception {
		gshReviewDao.delete_review(review_num, user_id);
	}
	
	// 리뷰 번호로 리뷰 찾기
	@Override
	public List<GshReviewVo> selectReviewByCode(String movie_code) throws Exception {
		return gshReviewDao.selectReviewByCode(movie_code);
	}

	@Override
	public int averageReviewScore(String movie_code) throws Exception {
		return gshReviewDao.averageReviewScore(movie_code);
	}

	@Override
	public void admin_review_delete(int review_num) throws Exception {
		gshReviewDao.admin_review_delete(review_num);
		
	}


	
}
