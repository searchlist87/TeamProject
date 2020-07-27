package com.kh.team.sgh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.SghMyMovieBuyVo;
import com.kh.team.sgh.persistence.SghMyPageDao;

@Service
public class SghMyPageServiceImpl implements SghMyPageService {

	@Inject
	private SghMyPageDao sghMyPageDao;
	
	@Override
	public List<SghMyMovieBuyVo> getMyMovieBuyList(String user_id) throws Exception {
		return sghMyPageDao.getMyMovieBuyList(user_id);
	}

}
