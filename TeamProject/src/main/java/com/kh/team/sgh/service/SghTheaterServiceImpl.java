package com.kh.team.sgh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.SghPagingDto;
import com.kh.team.domain.SghTheaterVo;
import com.kh.team.sgh.persistence.SghTheaterDao;

@Service
public class SghTheaterServiceImpl implements SghTheaterService {

	@Inject
	private SghTheaterDao sghTheaterDao;
	
	@Override
	public List<SghTheaterVo> getTheaterList() throws Exception {
		return sghTheaterDao.getTheaterList();
	}

	@Override
	public void movieTheaterAdd(SghTheaterVo sghTheaterVo) throws Exception {
		sghTheaterDao.insertMovieTheater(sghTheaterVo);
	}

	@Override
	public int getTheaterListCount(SghPagingDto sghPagingDto) throws Exception {
		return sghTheaterDao.getTheaterListCount(sghPagingDto);
	}

	@Override
	public List<SghTheaterVo> getTheaterPagingList(SghPagingDto sghPagingDto) throws Exception {
		return sghTheaterDao.getTheaterPagingList(sghPagingDto);
	}

	@Override
	public void modifyTheater(SghTheaterVo sghTheaterVo) throws Exception {
		sghTheaterDao.modifyTheater(sghTheaterVo);
	}

	@Override
	public SghTheaterVo selectOneTheater(String theater_code) throws Exception {
		return sghTheaterDao.selectOneTheater(theater_code);
	}

	@Override
	public void stateDeleteTheater(String theater_code) throws Exception {
		sghTheaterDao.stateDeleteTheater(theater_code);
	}

	@Override
	public List<SghTheaterVo> deleteTheaterListPaging(SghPagingDto sghPagingDto) throws Exception {
		return sghTheaterDao.deleteTheaterListPaging(sghPagingDto);
	}

	@Override
	public int deleteTheaterListCount(SghPagingDto sghPagingDto) throws Exception {
		return sghTheaterDao.deleteTheaterListCount(sghPagingDto);
	}

	@Override
	public void restoreTheater(String theater_code) throws Exception {
		sghTheaterDao.restoreTheater(theater_code);
	}
}
