package com.kh.team.sgh.service;

import java.util.List;

import com.kh.team.domain.SghMovieScreenAjaxDto;
import com.kh.team.domain.SghMovieTimeAjaxDto;
import com.kh.team.domain.SghMovieTimeListVo;
import com.kh.team.domain.SghMovieTimeModifyVo;
import com.kh.team.domain.SghMovieTimeVo;
import com.kh.team.domain.SghPagingDto;

public interface SghMovieTimeService {
	// 상영 회차 목록 가져오기
	public List<SghMovieTimeListVo> getMovieTimeList(SghPagingDto sghPagingDto) throws Exception;
	// 시간이 지나지 않고 삭제되지 않은 상영회차 총 카운트 들고오기
	public int getMovieTimeCount(SghPagingDto sghPagingDto) throws Exception;
	// 삭제된 상영 회차 목록 가져오기
	public List<SghMovieTimeListVo> deleteMovieTimeList(SghPagingDto sghPagingDto) throws Exception;
	// 삭제된 상영회차 총 카운트 들고오기
	public int deleteMovieTimeCount(SghPagingDto sghPagingDto) throws Exception;
	// 상영 회차 목록 가져오기
	public List<SghMovieTimeListVo> endOutMovieTimeList(SghPagingDto sghPagingDto) throws Exception;
	// 시간이 지나고 삭제되지 않은 상영회차 총 카운트 들고오기
	public int endOutMovieTimeCount(SghPagingDto sghPagingDto) throws Exception;
	// ajax 요청, 상영 일정에 등록된 상영작 하나 가져오기
	public SghMovieTimeAjaxDto getAjaxScheduleOne(String movie_schedule_code) throws Exception;
	// ajax 요청, 골라진 상영작에 대한 상영관의 스크린 정보 가져오기
	public List<SghMovieScreenAjaxDto> getAjaxScreenList(String theater_code) throws Exception;
	// 상영 회차 등록
	public void insertMovieTime(SghMovieTimeVo sghMovieTimeVo) throws Exception;
	// 상영 회차 정보 하나 가져오기
	public SghMovieTimeModifyVo selectMovieTimeOne(String movie_time_code) throws Exception;
	// 상영 회차 정보 수정하기
	public void modifyMovieTime(SghMovieTimeVo sghMovieTimeVo) throws Exception;
	// 삭제하기
	public void deleteMovieTime(String movie_time_code) throws Exception;
	// 복구하기
	public void restoreMovieTime(String movie_time_code) throws Exception;
}
