package com.kh.team.sgh.service;

import java.util.List;

import com.kh.team.sgh.domain.SghMovieNameVo;

public interface SghMovieScheduleService {

	public List<SghMovieNameVo> getMovieName(String theater_code) throws Exception;
}
