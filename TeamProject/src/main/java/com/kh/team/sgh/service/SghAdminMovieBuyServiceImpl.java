package com.kh.team.sgh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.SghAdminMovieBuyVo;
import com.kh.team.domain.SghBuyCodeDto;
import com.kh.team.domain.SghBuyMovieVo;
import com.kh.team.domain.SghBuyTheaterVo;
import com.kh.team.domain.SghPagingDto;
import com.kh.team.sgh.persistence.SghAdminMovieBuyDao;

@Service
public class SghAdminMovieBuyServiceImpl implements SghAdminMovieBuyService {

	@Inject
	private SghAdminMovieBuyDao sghAdminMovieBuyDao;
	
	@Override
	public List<SghAdminMovieBuyVo> getAdminMovieBuyList(SghPagingDto sghPagingDto) throws Exception {
		return sghAdminMovieBuyDao.getAdminMovieBuyList(sghPagingDto);
	}

	@Override
	public int getTotalCount(SghPagingDto sghPagingDto) throws Exception {
		return sghAdminMovieBuyDao.getTotalCount(sghPagingDto);
	}

	@Override
	public List<SghBuyTheaterVo> getBuyTheaterList(String area_code) throws Exception {
		return sghAdminMovieBuyDao.getBuyTheaterList(area_code);
	}

	@Override
	public List<SghBuyMovieVo> getBuyMovieList(String theater_code) throws Exception {
		return sghAdminMovieBuyDao.getBuyMovieList(theater_code);
	}

	@Override
	public int getBuyTotal(SghBuyCodeDto sghBuyCodeDto) throws Exception {
		return sghAdminMovieBuyDao.getBuyTotal(sghBuyCodeDto);
	}

}
