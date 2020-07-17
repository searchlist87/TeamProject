package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.GshMovieDto;
import com.kh.team.domain.GshReviewVo;

public interface GshReviewService {
	
	//  리뷰 목록(리뷰 게시판)
	public List<GshReviewVo> reviewList() throws Exception;
	
	// 영화 리뷰 정보 가져오기
	public List<GshMovieDto> select_review_code() throws Exception;

}
