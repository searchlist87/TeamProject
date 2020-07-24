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
//	public List<GshReviewVo> reviewModify(GshReviewVo gshReviewVo) throws Exception {
//		return gshReviewDao.reviewModify(gshReviewVo);
//	}
	
	// 영화 리뷰 삭제
//	public void delete_review(String review_content, int review_score) throws Exception {
//		gshReviewDao.delete_review(review_content, review_score);
//	}
	
	// 리뷰 번호로 리뷰 찾기
	@Override
	public List<GshReviewVo> selectReviewByCode(String movie_code) throws Exception {
		return gshReviewDao.selectReviewByCode(movie_code);
	}

	
}
