package com.kh.team.sgh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.SghAdminMovieBuyVo;
import com.kh.team.sgh.persistence.SghAdminMovieBuyDao;

@Service
public class SghAdminMovieBuyServiceImpl implements SghAdminMovieBuyService {

	@Inject
	private SghAdminMovieBuyDao sghAdminMovieBuyDao;
	
	@Override
	public List<SghAdminMovieBuyVo> getAdminMovieBuyList(int start_row, int end_row) throws Exception {
		return sghAdminMovieBuyDao.getAdminMovieBuyList(start_row, end_row);
	}

	@Override
	public List<SghAdminMovieBuyVo> getKeywordMovieBuyList(String keyword, String category) throws Exception {
		return sghAdminMovieBuyDao.getKeywordMovieBuyList(keyword, category);
	}

	@Override
	public int getTotalCount() throws Exception {
		return sghAdminMovieBuyDao.getTotalCount();
	}

}
