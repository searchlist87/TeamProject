package com.kh.team.sgh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.sgh.domain.SghAreaVo;
import com.kh.team.sgh.persistence.SghAreaDao;

@Service
public class SghAreaServiceImpl implements SghAreaService {

	@Inject
	private SghAreaDao sghAreaDao;
	
	@Override
	public List<SghAreaVo> getAreaList() throws Exception {
		return sghAreaDao.getAreaList();
	}

}
