package com.kh.team.jmh.service;

import java.util.List;

import com.kh.team.domain.JmhMovieImageVo;
import com.kh.team.domain.JmhMovieVo;

public interface JmhMovieService {
	
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
		
}
