package com.kh.team.sgh.persistence;

import java.util.List;

import com.kh.team.domain.SghMovieScreenAjaxDto;
import com.kh.team.domain.SghMovieTimeAjaxDto;
import com.kh.team.domain.SghMovieTimeListVo;
import com.kh.team.domain.SghMovieTimeModifyVo;
import com.kh.team.domain.SghMovieTimeVo;

public interface SghMovieTimeDao {
	
	// 상영 회차 목록 가져오기
	public List<SghMovieTimeListVo> getMovieTimeList() throws Exception;
	// ajax 요청, 상영일정에 등록된 상영작 하나 가져오기
	public SghMovieTimeAjaxDto getAjaxScheduleOne(String movie_schedule_code) throws Exception;
	// ajax 요청, 골라진 상영작에 대한 상영관의 스크린 정보 가져오기
	public List<SghMovieScreenAjaxDto> getAjaxScreenList(String theater_code) throws Exception;
	// 상영 회차 등록
	public void insertMovieTime(SghMovieTimeVo sghMovieTimeVo) throws Exception;
	// 상영 회차 정보 하나 가져오기
	public SghMovieTimeModifyVo selectMovieTimeOne(String movie_time_code) throws Exception;
	// 상영 회차 정보 수정하기
	public void modifyMovieTime(SghMovieTimeVo sghMovieTimeVo) throws Exception;
	// 좌석 코드 가져오기
	public List<String> getSeatCode(String screen_code) throws Exception;
	// 좌석 일정 테이블 좌석들 넣어서 상품 만들기
	public void insertScheduleSeat(String movie_seat_num, String movie_time_code) throws Exception;
	// movie_time 최신 데이터의 코드 가져오기
	public String getMovieTimeNewDate() throws Exception;
}
