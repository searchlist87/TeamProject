package com.kh.team.sgh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.SghAreaVo;
import com.kh.team.sgh.persistence.SghAreaDao;

@Service
public class SghAreaServiceImpl implements SghAreaService {

	@Inject
	private SghAreaDao sghAreaDao;
	
	@Override
	public List<SghAreaVo> getAreaList() throws Exception {
		return sghAreaDao.getAreaList();
	}

	@Override
	public void insertArea(String area_name) throws Exception {
		sghAreaDao.insertArea(area_name);
	}

	@Override
	public SghAreaVo getAreaInfo(String area_code) throws Exception {
		return sghAreaDao.getAreaInfo(area_code);
	}

	@Override
	public void modifyArea(String area_code, String area_name) throws Exception {
		sghAreaDao.modifyArea(area_code, area_name);
	}

	@Override
	public void delArea(String area_code) throws Exception {
		sghAreaDao.delArea(area_code);
	}

	@Override
	public void restoreArea(String area_code) throws Exception {
		sghAreaDao.restoreArea(area_code);
	}

	@Override
	public List<SghAreaVo> getDeleteAreaList() throws Exception {
		return sghAreaDao.getDeleteAreaList();
	}

}
