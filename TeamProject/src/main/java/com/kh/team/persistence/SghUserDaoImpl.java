package com.kh.team.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.SghFindDto;
import com.kh.team.domain.SghLoginDto;
import com.kh.team.domain.SghUserVo;

@Repository
public class SghUserDaoImpl implements SghUserDao {

	private final String NAMESPACE = "mappers.sgh-user-mapper.";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void userInsert(SghUserVo sghUserVo) throws Exception {
		sqlSession.insert(NAMESPACE + "userInsert", sghUserVo);
	}

	@Override
	public SghLoginDto userLoginSelect(SghLoginDto sghLoginDto) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "userLoginSelect", sghLoginDto);
	}

	@Override
	public int userIdDupCheckSelect(String user_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "userIdDupCheckSelect", user_id);
	}

	@Override
	public List<SghFindDto> userFindIdSelect(SghFindDto sghFindDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "userFindIdSelect", sghFindDto);
	}

	@Override
	public void userChengePwUpdate(String user_id, String user_pw) throws Exception {
		Map<String, String> paramMap = new HashMap<>();
		paramMap.put("user_id", user_id);
		paramMap.put("user_pw", user_pw);
		sqlSession.update(NAMESPACE + "userChengePwUpdate", paramMap);
	}

	@Override
	public SghFindDto userPwSelect(String user_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "userPwSelect", user_id);
	}

}
