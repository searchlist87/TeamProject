package com.kh.team.sgh.service;

import java.util.List;

import com.kh.team.domain.SghMovieNameVo;
import com.kh.team.domain.SghPagingDto;
import com.kh.team.domain.SghScheduleVo;

public interface SghMovieScheduleService {
	// 영화 이름, 코드 가져오기
	public List<SghMovieNameVo> getMovieName(String theater_code) throws Exception;
	// 상영작 목록 가져오기
	public List<SghScheduleVo> getScheduleList(SghPagingDto sghPagingDto) throws Exception;
	// 상영작 총 숫자 가져오기
	public int getMovieScheduleCount() throws Exception;
	// 삭제된 상영작 가져오기
	public List<SghScheduleVo> deleteScheduleList(SghPagingDto sghPagingDto) throws Exception;
	// 기간이 지난 삭제되지 않은 상영작 가져오기
	public List<SghScheduleVo> endDateOutScheduleList(SghPagingDto sghPagingDto) throws Exception;
	// 기간이 지난 삭제되지 않은 상영작 총 숫자 가져오기
	public int getEndDateOutScheduleCount() throws Exception;
	// 삭제된 상영작 총 숫자 가져오기
	public int getDeleteScheduleCount() throws Exception;
	// 상영작 등록하기
	public void insertMovieSchedule(SghScheduleVo sghScheduleVo) throws Exception;
	// 상영작 하나 가져오기
	public SghScheduleVo getMovieScheduleOne(String movie_schedule_code) throws Exception;
	// 상영작 수정하기
	public void updateSchedule(SghScheduleVo sghScheduleVo) throws Exception;
	// 삭제하기
	public void stateDeleteSchedule(String movie_schedule_code) throws Exception;
	// 복구하기
	public void stateRestoreSchedule(String movie_schedule_code) throws Exception;
}
