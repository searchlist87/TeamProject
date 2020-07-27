package com.kh.team.sgh.service;

import java.util.List;

import com.kh.team.domain.SghMyMovieBuyVo;

public interface SghMyPageService {
	// 내 정보의 영화 구매내역 보기
	public List<SghMyMovieBuyVo> getMyMovieBuyList(String user_id) throws Exception;
}
