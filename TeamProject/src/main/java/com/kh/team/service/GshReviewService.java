package com.kh.team.service;

import java.util.List;

import com.kh.team.domain.GshReviewVo;

public interface GshReviewService {
	
	//  리뷰 목록(리뷰 게시판)
	public List<GshReviewVo> reviewList() throws Exception;
	
	// 리뷰 작성하기
	public void write_review(GshReviewVo gshReviewVo) throws Exception;
	
	// 리뷰 수정하기
	public void update_review(String review_content,int review_score,int review_num,String user_id) throws Exception;
	
	// 리뷰 삭제하기
	public void delete_review(int review_num, String user_id) throws Exception;
	
	// 영화 정보 가져오기
	public List<GshReviewVo> select_reviewAll() throws Exception;
	
	// 해당 영화 리뷰 조회
	public List<GshReviewVo> selectReviewByCode(String movie_code) throws Exception;
	
	// 해당 영화 평균점수 구하기
	public int averageReviewScore(String movie_code) throws Exception;
	
	// 관리자 리뷰 삭제
	public void admin_review_delete(int review_num) throws Exception;
}
