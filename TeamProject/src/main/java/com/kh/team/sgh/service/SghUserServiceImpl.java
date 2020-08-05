package com.kh.team.sgh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.SghFindDto;
import com.kh.team.domain.SghFindPwVo;
import com.kh.team.domain.SghLoginDto;
import com.kh.team.domain.SghUserVo;
import com.kh.team.sgh.persistence.SghUserDao;

@Service
public class SghUserServiceImpl implements SghUserService {

	@Inject
	private SghUserDao sghUserDao;
	
	@Override
	public void userJoin(SghUserVo sghUserVo) throws Exception {
		sghUserDao.userInsert(sghUserVo);
	}

	@Override
	public SghLoginDto userLogin(SghLoginDto sghLoginDto) throws Exception {
		return sghUserDao.userLoginSelect(sghLoginDto);
	}

	@Override
	public int userIdDupCheck(String user_id) throws Exception {
		return sghUserDao.userIdDupCheckSelect(user_id);
	}

	@Override
	public List<SghFindDto> userFindId(SghFindDto sghFindDto) throws Exception {
		return sghUserDao.userFindIdSelect(sghFindDto);
	}

	@Override
	public void userChengePw(String user_id, String user_pw) throws Exception {
		sghUserDao.userChengePwUpdate(user_id, user_pw);
	}

	@Override
	public SghFindDto userPwSelect(SghFindPwVo sghFindPwVo) throws Exception {
		return sghUserDao.userPwSelect(sghFindPwVo);
	}

}
