package com.kh.team.sgh.service;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.domain.SghMovieScreenVo;
import com.kh.team.domain.SghMovieSeatVo;
import com.kh.team.domain.SghScreenPagingVo;
import com.kh.team.domain.SghScreenSeatVo;
import com.kh.team.sgh.persistence.SghMovieScreenDao;

@Service
public class SghMovieScreenServiceImpl implements SghMovieScreenService {

	@Inject
	private SghMovieScreenDao sghMovieScreenDao;
	@Override
	public List<SghMovieScreenVo> getScreenList(SghScreenPagingVo sghScreenPagingVo) throws Exception {
		return sghMovieScreenDao.getScreenList(sghScreenPagingVo);
	}
	
	@Transactional
	@Override
	public void insertScreen(SghMovieScreenVo sghMovieScreenVo, ArrayList<String> rws) throws Exception {
		sghMovieScreenDao.insertScreen(sghMovieScreenVo);
		String screen_code = sghMovieScreenDao.selectNewDate();
		SghMovieSeatVo sghMovieSeatVo = new SghMovieSeatVo();
		for(String r : rws) {
			sghMovieSeatVo.setScreen_code(screen_code);
			sghMovieSeatVo.setSeat_code(r);
			sghMovieScreenDao.insertSeat(sghMovieSeatVo);
		}
	}

	@Override
	public SghMovieScreenVo getScreenOne(String screen_code) throws Exception {
		return sghMovieScreenDao.getScreenOne(screen_code);
	}

	// 스크린 수정할 때 좌석 지우고 다시 만들기
	@Transactional
	@Override
	public void screenModify(SghMovieScreenVo sghMovieScreenVo, ArrayList<String> rws) throws Exception {
		sghMovieScreenDao.screenModify(sghMovieScreenVo);
		String screen_code = sghMovieScreenDao.selectNewDate();
		sghMovieScreenDao.deleteScreenSeat(screen_code);
		SghMovieSeatVo sghMovieSeatVo = new SghMovieSeatVo();
		for(String r : rws) {
			sghMovieSeatVo.setScreen_code(screen_code);
			sghMovieSeatVo.setSeat_code(r);
			sghMovieScreenDao.insertSeat(sghMovieSeatVo);
		}
	}

	@Override
	public SghScreenSeatVo getScreenSeat(String screen_code) throws Exception {
		return sghMovieScreenDao.getScreenSeat(screen_code);
	}

	@Override
	public int productCheck(String screen_code) throws Exception {
		return sghMovieScreenDao.productCheck(screen_code);
	}

	@Override
	public void stateDeleteScreen(String screen_code) throws Exception {
		sghMovieScreenDao.stateDeleteScreen(screen_code);
	}

	@Override
	public int getScreenTotal(String theater_code) throws Exception {
		return sghMovieScreenDao.getScreenTotal(theater_code);
	}

}
