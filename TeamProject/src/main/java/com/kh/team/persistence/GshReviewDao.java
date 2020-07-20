package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.GshMovieDto;
import com.kh.team.domain.GshReviewVo;

public interface GshReviewDao {
	
	// 리뷰 목록
	public List<GshReviewVo> reviewList() throws Exception;
	
	// 영화 정보 가져오기
	public List<GshMovieDto> select_review_code() throws Exception;
	
	// 리뷰 작성하기
	public void write_review() throws Exception;

	// 영화 리뷰 수정
	public List<GshReviewVo> reviewModify() throws Exception;
	
	// 영화 리뷰 삭제
	public List<GshReviewVo> reviewDelete() throws Exception;	
}
