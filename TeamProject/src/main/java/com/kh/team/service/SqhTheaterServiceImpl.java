package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.SghTheaterVo;
import com.kh.team.persistence.SghTheaterDao;

@Service
public class SqhTheaterServiceImpl implements SghTheaterService {

	@Inject
	private SghTheaterDao sghTheaterDao;
	
	@Override
	public List<SghTheaterVo> getAreaList() throws Exception {
		return sghTheaterDao.getAreaList();
	}

}
