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

	@Override
	public List<GshReviewVo> selectReviewByCode(String movie_code) throws Exception {
		return gshReviewDao.selectReviewByCode(movie_code);
	}

	
}
