package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.JmhMovieVo;
import com.kh.team.persistence.JmhMovieDao;

@Service
public class JmhMovieServiceImpl implements JmhMovieService {

	@Inject
	private JmhMovieDao jmhMovieDao;
	
	@Override
	public List<JmhMovieVo> getMovieList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void movieRegister(JmhMovieVo jmhMovieVo) throws Exception {
		jmhMovieDao.movieRegister(jmhMovieVo);
	}

	@Override
	public void movieModify(JmhMovieVo jmhMovieVo) throws Exception {
		// TODO Auto-generated method stub

	}

}
