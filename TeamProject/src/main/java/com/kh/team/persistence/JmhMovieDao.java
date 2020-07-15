package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.JmhMovieVo;

public interface JmhMovieDao {
	
	// 영화 조회
	public List<JmhMovieVo> getMovieList() throws Exception;
	// 영화 등록
	public void movieRegister(JmhMovieVo jmhMovieVo) throws Exception;
	// 영화 수정
	public void movieModify(JmhMovieVo jmhMovieVo) throws Exception;
	
}
