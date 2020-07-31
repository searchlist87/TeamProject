package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.GshMovieDto;
import com.kh.team.domain.GshPagingDto;
import com.kh.team.persistence.GshMovieDao;

@Service
public class GshMovieServiceImpl implements GshMovieService {
	
	@Inject
	private GshMovieDao gshMovieDao;

	// 영화 정보 가져오기
	public List<GshMovieDto> select_movieAll(GshPagingDto gshPagingDto) throws Exception {
		return gshMovieDao.select_movieAll(gshPagingDto);
	}

	// 영화 코드로 리뷰 보기
	@Override
	public GshMovieDto selectMovieCode(String movie_code) throws Exception {
		return gshMovieDao.selectMovieCode(movie_code);
	}
	
	// 영화 서브 이미지(스틸컷) 가져오기
	@Override
	public List<String> selectMovieSubImage(String movie_code) throws Exception {
		return gshMovieDao.selectMovieSubImage(movie_code);
	}
	
	// 영화 이름으로 영화 찾기
	@Override
	public void findMovieName() throws Exception {
		
	}
	
	// 영화 장르로 영화 찾기
	@Override
	public void findMovieGenre() throws Exception {
		
	}
	
	// 영화 목록 페이징
	@Override
	public int getMovieCount(GshPagingDto gshPagingDto) throws Exception {
		return gshMovieDao.getMovieCount(gshPagingDto);
		
	}
	

}
