package com.kh.team.sgh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.SghMovieProductVo;
import com.kh.team.domain.SghSeatCheckVo;
import com.kh.team.sgh.persistence.SghMovieProductDao;

@Service
public class SghMovieProductServiceImpl implements SghMovieProductService {

	@Inject
	private SghMovieProductDao sghMovieProductDao;
	@Override
	public List<SghMovieProductVo> getMovieProductList() throws Exception {
		return sghMovieProductDao.getMovieProductList();
	}
	@Override
	public SghMovieProductVo getMovieProductInfo(String movie_time_code) throws Exception {
		return sghMovieProductDao.getMovieProductInfo(movie_time_code);
	}
	@Override
	public List<SghSeatCheckVo> getSeatCheck(String movie_time_code) throws Exception {
		return sghMovieProductDao.getSeatCheck(movie_time_code);
	}

}
