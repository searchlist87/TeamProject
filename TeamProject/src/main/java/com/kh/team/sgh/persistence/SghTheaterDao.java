package com.kh.team.sgh.persistence;

import java.util.List;

import com.kh.team.domain.SghPagingDto;
import com.kh.team.domain.SghTheaterVo;

public interface SghTheaterDao {

	// 영화관 리스트 가져오기
	public List<SghTheaterVo> getTheaterList() throws Exception;
	// 영화관 등록하기
	public void insertMovieTheater(SghTheaterVo sghTheaterVo) throws Exception;
	// 영화관 수 가져오기
	public int getTheaterListCount(SghPagingDto sghPagingDto) throws Exception;
	// 삭제된 영화관 수 가져오기
	public int deleteTheaterListCount(SghPagingDto sghPagingDto) throws Exception;
	// 영화관 목록 가져오기(페이징 작업)
	public List<SghTheaterVo> getTheaterPagingList(SghPagingDto sghPagingDto) throws Exception;
	// 삭제된 영화관 목록 가져오기(페이징 작업)
	public List<SghTheaterVo> deleteTheaterListPaging(SghPagingDto sghPagingDto) throws Exception;
	// 영화관 수정하기
	public void modifyTheater(SghTheaterVo sghTheaterVo) throws Exception;
	// 영화관 하나 정보 가져오기
	public SghTheaterVo selectOneTheater(String theater_code) throws Exception;
	// 영화관 삭제하기
	public void stateDeleteTheater(String theater_code) throws Exception;
	// 영화관 복구하기
	public void restoreTheater(String theater_code) throws Exception;
}
