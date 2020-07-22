package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.GshReviewVo;

public interface GshReviewService {
	
	//  리뷰 목록(리뷰 게시판)
	public List<GshReviewVo> reviewList() throws Exception;
	
	// 리뷰 작성하기
	public void write_review(GshReviewVo gshReviewVo) throws Exception;
	
	// 리뷰 수정하기
//	public void update_review() throws Exception;
	
	// 리뷰 삭제하기
//	public void reviewDelete() throws Exception;
	
	// 영화 정보 가져오기
	public List<GshReviewVo> select_reviewAll() throws Exception;
}
