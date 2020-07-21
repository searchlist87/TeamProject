package com.kh.team.jmh.persistence;

import java.util.List;

import com.kh.team.domain.JmhAreaVo;
import com.kh.team.domain.JmhMovieTheaterVo;

public interface JmhMovieTheaterDao {
	
	// 영화관 이름 가져오기
	public List<JmhMovieTheaterVo> getTheaterInfo() throws Exception;
	
	// 지역&지역코드 가져오기
	public List<JmhAreaVo> getArea() throws Exception;
	
	// 지역별 영화관 수
	
	// 영화관 총 좌석수
	
	// 
}