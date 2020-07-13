package com.kh.team.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.SghLoginDto;
import com.kh.team.domain.SghUserVo;
import com.kh.team.persistence.SghUserDao;

@Service
public class SghUserServiceImpl implements SghUserService {

	@Inject
	private SghUserDao sghUserDao;
	
	@Override
	public void userJoin(SghUserVo sghUserVo) throws Exception {
		sghUserDao.userInsert(sghUserVo);
	}

	@Override
	public int userLogin(SghLoginDto sghLoginDto) throws Exception {
		return sghUserDao.userLoginSelect(sghLoginDto);
	}

}
