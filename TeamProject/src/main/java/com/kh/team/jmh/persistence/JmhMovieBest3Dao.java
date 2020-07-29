package com.kh.team.jmh.persistence;

import java.util.List;

import com.kh.team.domain.JmhMovieBest3Vo;
import com.kh.team.domain.JmhMovieVo;

public interface JmhMovieBest3Dao {
	
	// 영화 best3 가져오기
	public List<JmhMovieBest3Vo> getMovieBest3() throws Exception;
	
	// 영화 8개 가져오기
	public List<JmhMovieVo> selectMovie8() throws Exception;

}
