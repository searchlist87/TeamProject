package com.kh.team.jmh.service;

import java.util.List;

import com.kh.team.domain.JmhMovieBest3Vo;

public interface JmhMovieBest3Service {

	// 영화 best3 가져오기
	public List<JmhMovieBest3Vo> getMovieBest3() throws Exception;
}
