package com.kh.team.persistence;

import java.util.List;

import com.kh.team.domain.SghUserVo;

public interface SghMemberDao {

	// 회원가입
	public SghUserVo memberInsert() throws Exception;
}
