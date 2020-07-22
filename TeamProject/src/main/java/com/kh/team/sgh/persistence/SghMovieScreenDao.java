package com.kh.team.sgh.persistence;

import java.util.List;

import com.kh.team.domain.SghMovieScreenVo;
import com.kh.team.domain.SghMovieSeatVo;
import com.kh.team.domain.SghScreenSeatVo;

public interface SghMovieScreenDao {

	// 상영관 목록 가져오기
	public List<SghMovieScreenVo> getScreenList(String theater_code) throws Exception;
	// 상영관 추가
	public void insertScreen(SghMovieScreenVo sghMovieScreenVo) throws Exception;
	// 상영관 하나 가져오기
	public SghMovieScreenVo getScreenOne(String screen_code) throws Exception;
	// 상영관 수정하기
	public void screenModify(SghMovieScreenVo sghMovieScreenVo) throws Exception;
	// 상영관 좌석 가져오기
	public SghScreenSeatVo getScreenSeat(String screen_code) throws Exception;
	// 상영관 시트 추가하기
	public void insertSeat(SghMovieSeatVo sghMovieSeatVo) throws Exception;
	// 등록된 최신 상영관 코드 가져오기
	public String selectNewDate() throws Exception;
}
