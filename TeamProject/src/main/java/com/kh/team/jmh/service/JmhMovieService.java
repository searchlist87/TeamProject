package com.kh.team.jmh.service;

import java.util.List;

import com.kh.team.domain.JmhMovieImageVo;
import com.kh.team.domain.JmhMovieVo;
import com.kh.team.domain.JmhPagingDto;

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
		
		// 영화 총 갯수 가져오기
		public int getCountMovie(JmhPagingDto jmhPagingDto) throws Exception;
		
		// 영화 페이징
		public List<JmhMovieVo> moviePagingList(JmhPagingDto jmhPagingDto) throws Exception;
		
}
