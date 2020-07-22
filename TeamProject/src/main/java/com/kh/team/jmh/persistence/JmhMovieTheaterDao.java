package com.kh.team.jmh.persistence;

import java.util.List;

import com.kh.team.domain.JmhAreaVo;
import com.kh.team.domain.JmhMovieTheaterDto;
import com.kh.team.domain.JmhMovieTheaterVo;
import com.kh.team.domain.JmhTheaterScheduleVo;

public interface JmhMovieTheaterDao {
	
	// 영화관 이름 가져오기
	public List<JmhMovieTheaterVo> getTheaterName(String area_code) throws Exception;
	
	// 지역&지역코드 가져오기
	public List<JmhAreaVo> getArea() throws Exception;
	
	// 영화관 정보 가져오기
	public JmhMovieTheaterVo getTheaterInformation(String theater_code) throws Exception;
	
	// 영화관 코드 하나 가져오기
	public String getTheaterCode() throws Exception;
	
	// 영화관의 상영관 수
	public int getScreenCount(String theater_code) throws Exception;
	
	// 영화관 총 좌석수
	public int getTotalSeat(String theater_code) throws Exception;
	
	// 영화 상영작정보 가져오기
	public List<JmhTheaterScheduleVo> getTheaterSchedule(String theater_code, String movie_date) throws Exception;
	
	// 영화 상영작 제목 가져오기
	public List<JmhMovieTheaterDto> getTheaterScheduleMovieName(String theater_code, String movie_date) throws Exception;
}