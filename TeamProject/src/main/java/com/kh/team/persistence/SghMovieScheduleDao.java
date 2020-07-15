package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.SghMovieNameVo;

public interface SghMovieScheduleDao {

	// 영화 이름, 코드 가져오기
	public List<SghMovieNameVo> getMovieName(String theater_code) throws Exception;
}
