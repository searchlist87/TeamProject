package com.kh.team.sgh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.SghBuyListVo;
import com.kh.team.domain.SghMyMovieBuyVo;
import com.kh.team.sgh.persistence.SghMyPageDao;

@Service
public class SghMyPageServiceImpl implements SghMyPageService {

	@Inject
	private SghMyPageDao sghMyPageDao;
	
	@Override
	public List<SghMyMovieBuyVo> getMyMovieBuyList(int start_row, int end_row, String user_id) throws Exception {
		return sghMyPageDao.getMyMovieBuyList(start_row, end_row, user_id);
	}

	@Override
	public List<SghBuyListVo> getBuyList(int start_row, int end_row, String user_id) throws Exception {
		return sghMyPageDao.getBuyList(start_row, end_row, user_id);
	}

	@Override
	public List<SghBuyListVo> getOutBuyList(int start_row, int end_row, String user_id) throws Exception {
		return sghMyPageDao.getOutBuyList(start_row, end_row, user_id);
	}

	@Override
	public int getBuyTotal(String user_id) throws Exception {
		return sghMyPageDao.getBuyTotal(user_id);
	}

	@Override
	public int getOutBuyTotal(String user_id) throws Exception {
		return sghMyPageDao.getOutBuyTotal(user_id);
	}

	@Override
	public int getBuyMovieTotal(String user_id) throws Exception {
		return sghMyPageDao.getBuyMovieTotal(user_id);
	}

}
