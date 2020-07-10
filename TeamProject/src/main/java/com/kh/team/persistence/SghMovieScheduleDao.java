package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.SghMovieNameVo;

public interface SghMovieScheduleDao {

	
	public List<SghMovieNameVo> getMovieName(String theater_code) throws Exception;
}
