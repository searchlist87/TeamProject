package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.GshMovieDto;
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
	public List<GshMovieDto> select_review_code() throws Exception {
		return gshReviewDao.select_review_code();
	}

}
