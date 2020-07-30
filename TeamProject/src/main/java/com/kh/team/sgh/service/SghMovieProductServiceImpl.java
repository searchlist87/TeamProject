package com.kh.team.sgh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.domain.SghMovieProductVo;
import com.kh.team.domain.SghPagingDto;
import com.kh.team.domain.SghPaymentVo;
import com.kh.team.domain.SghSeatCheckVo;
import com.kh.team.sgh.persistence.SghMovieProductDao;

@Service
public class SghMovieProductServiceImpl implements SghMovieProductService {

	@Inject
	private SghMovieProductDao sghMovieProductDao;
	@Override
	public List<SghMovieProductVo> getMovieProductList(SghPagingDto sghPagingDto) throws Exception {
		return sghMovieProductDao.getMovieProductList(sghPagingDto);
	}
	@Override
	public SghMovieProductVo getMovieProductInfo(String movie_time_code) throws Exception {
		return sghMovieProductDao.getMovieProductInfo(movie_time_code);
	}
	@Override
	public List<SghSeatCheckVo> getSeatCheck(String movie_time_code) throws Exception {
		return sghMovieProductDao.getSeatCheck(movie_time_code);
	}
	@Override
	public List<SghMovieProductVo> getOutProductList(SghPagingDto sghPagingDto) throws Exception {
		return sghMovieProductDao.getOutProductList(sghPagingDto);
	}
	@Override
	public int getMovieProductTotal() throws Exception {
		return sghMovieProductDao.getMovieProductTotal();
	}
	@Override
	public int getOutProductTotal() throws Exception {
		return sghMovieProductDao.getOutProductTotal();
	}
}
