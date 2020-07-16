package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.SghMovieScreenVo;

public interface SghMovieScreenDao {

	// 영화관 목록 가져오기
	public List<SghMovieScreenVo> getScreenList(String theater_code) throws Exception;
}
