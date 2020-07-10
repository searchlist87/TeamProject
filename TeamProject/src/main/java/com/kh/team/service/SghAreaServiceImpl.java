package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.SghAreaVo;
import com.kh.team.persistence.SghAreaDao;

@Service
public class SghAreaServiceImpl implements SghAreaService {

	@Inject
	private SghAreaDao sghAreaDao;
	
	@Override
	public List<SghAreaVo> getAreaList() throws Exception {
		return sghAreaDao.getAreaList();
	}

}
