package com.kh.team.sgh.persistence;

import java.util.List;

import com.kh.team.domain.SghScheduleListDto;

public interface SghMovieDao {
	// 영화 일정에 사용할 영화 목록 리스트 들고오기
	public List<SghScheduleListDto> getScheduleMovieList() throws Exception;
}
