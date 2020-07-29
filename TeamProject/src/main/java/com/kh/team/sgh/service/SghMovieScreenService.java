package com.kh.team.sgh.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.team.domain.SghMovieScreenVo;
import com.kh.team.domain.SghScreenSeatVo;

public interface SghMovieScreenService {
	// 영화관 목록 가져오기
	public List<SghMovieScreenVo> getScreenList(String theater_code) throws Exception;
	// 상영관 추가
	public void insertScreen(SghMovieScreenVo sghMovieScreenVo, ArrayList<String> rws) throws Exception;
	// 상영관 하나 가져오기
	public SghMovieScreenVo getScreenOne(String screen_code) throws Exception;
	// 상영관 수정하기
	public void screenModify(SghMovieScreenVo sghMovieScreenVo, ArrayList<String> rws) throws Exception;
	// 상영관 좌석 가져오기
	public SghScreenSeatVo getScreenSeat(String screen_code) throws Exception;
	// 등록된 일정이 있는지 없는지 체크하기
	public int productCheck(String screen_code) throws Exception;
	// 상영관 삭제하기
	public void stateDeleteScreen(String screen_code) throws Exception;
}
