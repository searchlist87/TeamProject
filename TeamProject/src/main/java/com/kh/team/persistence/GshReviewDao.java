package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.GshReviewVo;

public interface GshReviewDao {
	
	// 리뷰 작성하기
	public void write_review() throws Exception;
	
	// 리뷰 목록
	public List<GshReviewVo> reviewList() throws Exception;

}
