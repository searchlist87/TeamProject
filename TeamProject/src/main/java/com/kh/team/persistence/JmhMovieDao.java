package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.JmhMovieImageVo;
import com.kh.team.domain.JmhMovieVo;

public interface JmhMovieDao {
	
	// 영화 조회
	public List<JmhMovieVo> getMovieList() throws Exception;
	
	// 영화 등록
	public void movieRegister(JmhMovieVo jmhMovieVo) throws Exception;
	
	// 영화 상세정보 보기
	public JmhMovieVo selectByMovie(String movie_code) throws Exception;
	
	// 영화 상세정보_subImage보기
	public List<JmhMovieImageVo> selectByMovieSubImage(String movie_code) throws Exception;
	
	// 영화 수정
	public void movieModify(JmhMovieVo jmhMovieVo) throws Exception;
	
	// 영화 코드 조회
	public String selectMovieCode() throws Exception;
	
	// 영화 서브 이미지 추가
	public void movieSubImageRegister(String movie_code, String movie_sub_image) throws Exception;
	
	
}
