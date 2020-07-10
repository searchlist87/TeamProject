package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.GshReviewVo;

public interface GshReviewService {
	
	//  리뷰 목록(리뷰 게시판)
	public List<GshReviewVo> reviewList() throws Exception;

}
