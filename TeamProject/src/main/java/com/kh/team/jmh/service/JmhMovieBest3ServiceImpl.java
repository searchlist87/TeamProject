package com.kh.team.jmh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.JmhMovieBest3Vo;
import com.kh.team.domain.JmhMovieVo;
import com.kh.team.jmh.persistence.JmhMovieBest3Dao;

@Service
public class JmhMovieBest3ServiceImpl implements JmhMovieBest3Service {

	@Inject
	private JmhMovieBest3Dao jmhMovieBest3Dao;
	
	// 영화 best3 가져오기
	@Override
	public List<JmhMovieBest3Vo> getMovieBest3() throws Exception {
		return jmhMovieBest3Dao.getMovieBest3();
	}

	// 영화 8개 가져오기
	@Override
	public List<JmhMovieVo> selectMovie8() throws Exception {
		return jmhMovieBest3Dao.selectMovie8();
	}

}
