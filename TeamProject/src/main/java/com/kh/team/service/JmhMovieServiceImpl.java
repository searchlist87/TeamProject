package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.domain.JmhMovieImageVo;
import com.kh.team.domain.JmhMovieVo;
import com.kh.team.persistence.JmhMovieDao;

@Service
public class JmhMovieServiceImpl implements JmhMovieService {

	@Inject
	private JmhMovieDao jmhMovieDao;
	
	// 영화 조회
	@Override
	public List<JmhMovieVo> getMovieList() throws Exception {
		return jmhMovieDao.getMovieList();
	}

	// 영화 등록
	@Transactional
	@Override
	public void movieRegister(JmhMovieVo jmhMovieVo) throws Exception {
		jmhMovieDao.movieRegister(jmhMovieVo);
		String movie_code = jmhMovieDao.selectMovieCode();
		String[] files = jmhMovieVo.getMovie_sub_image();
		for (String movie_sub_image : files) {
			jmhMovieDao.movieSubImageRegister(movie_code, movie_sub_image);
		}
		
	}

	@Override
	public void movieModify(JmhMovieVo jmhMovieVo) throws Exception {
		// TODO Auto-generated method stub

	}

	// 영화 코드 조회
	@Override
	public String selectMovieCode() throws Exception {
		return jmhMovieDao.selectMovieCode();
	}

	// 영화 상세보기 
	@Override
	public JmhMovieVo selectByMovie(String movie_code) throws Exception {
		return jmhMovieDao.selectByMovie(movie_code);
	}

	// 영화 상세보기_subImage 가져오기
	@Override
	public List<JmhMovieImageVo> selectByMovieSubImage(String movie_code) throws Exception {
		return jmhMovieDao.selectByMovieSubImage(movie_code);
	}

}
