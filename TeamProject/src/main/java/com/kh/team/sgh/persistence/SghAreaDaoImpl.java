package com.kh.team.sgh.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.SghAreaVo;

@Repository
public class SghAreaDaoImpl implements SghAreaDao {

	private final String NAMESAPCE = "mappers.sgh-area-mapper.";
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<SghAreaVo> getAreaList() throws Exception {
		return sqlSession.selectList(NAMESAPCE + "getAreaList");
	}

	@Override
	public void insertArea(String area_name) throws Exception {
		sqlSession.insert(NAMESAPCE + "insertArea", area_name);
	}

	@Override
	public SghAreaVo getAreaInfo(String area_code) throws Exception {
		return sqlSession.selectOne(NAMESAPCE + "getAreaInfo", area_code);
	}

	@Override
	public void modifyArea(String area_code, String area_name) throws Exception {
		Map<String, String> paramMap = new HashMap<>();
		paramMap.put("area_code", area_code);
		paramMap.put("area_name", area_name);
		sqlSession.update(NAMESAPCE + "modifyArea", paramMap);
	}

	@Override
	public void delArea(String area_code) throws Exception {
		sqlSession.update(NAMESAPCE + "delArea", area_code);
	}

	@Override
	public void restoreArea(String area_code) throws Exception {
		sqlSession.update(NAMESAPCE + "restoreArea", area_code);
	}

	@Override
	public List<SghAreaVo> getDeleteAreaList() throws Exception {
		return sqlSession.selectList(NAMESAPCE + "getDeleteAreaList");
	}

	@Override
	public List<SghAreaVo> getAllAreaList() throws Exception {
		return sqlSession.selectList(NAMESAPCE + "getAllAreaList");
	}
	
	
}
