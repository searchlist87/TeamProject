package com.kh.team.sgh.service;

import java.util.List;

import com.kh.team.domain.SghScheduleVo;

public interface SghScheduleService {
	// 상영작 목록 가져오기
	public List<SghScheduleVo> getScheduleList() throws Exception;
	// 상영작 등록하기
	public void insertMovieSchedule(SghScheduleVo sghScheduleVo) throws Exception;
	// 상영작 하나 가져오기
	public SghScheduleVo getMovieScheduleOne(String movie_schedule_code) throws Exception;
	// 상영작 수정하기
	public void updateSchedule(SghScheduleVo sghScheduleVo) throws Exception;
}
