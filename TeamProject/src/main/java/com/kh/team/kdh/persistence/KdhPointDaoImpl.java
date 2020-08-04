package com.kh.team.kdh.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.KdhMypagePointDto;
import com.kh.team.domain.KdhPointCodeVo;
import com.kh.team.domain.KdhPointVo;
import com.kh.team.domain.KdhUserVo;

@Repository
public class KdhPointDaoImpl implements KdhPointDao {

	private final String NAMESPACE = "mappers.kdh-point-mapper.";
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<KdhPointVo> selectPointById(String user_id) throws Exception {
		return sqlSession.selectList(NAMESPACE + "selectPointById", user_id);
	}

	@Override
	public void insertPointInData(String user_id, int food_buy_price, int point_percent) throws Exception {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("user_id", user_id);
		paraMap.put("food_buy_price", food_buy_price);
		paraMap.put("point_percent", point_percent);
		sqlSession.insert(NAMESPACE + "insertPointInData", paraMap);
		
	}

	@Override
	public void insertPointInDataUpdate(int point_num, String user_id) throws Exception {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("point_num", point_num);
		paraMap.put("user_id", user_id);
		sqlSession.insert(NAMESPACE + "insertPointInDataUpdate", paraMap);
		
	}

	@Override
	public int selectTotalPoint(String user_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectTotalPoint", user_id);
	}

	@Override
	public void updateTotalUserPoint(int user_point, String user_id) throws Exception {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("user_point", user_point);
		paraMap.put("user_id", user_id);
		sqlSession.update(NAMESPACE + "updateTotalUserPoint", paraMap);
		
	}

	@Override
	public void updateUserPoint(int user_point, int used_Point, String user_id) throws Exception {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("user_point", user_point);
		paraMap.put("used_Point", used_Point);
		paraMap.put("user_id", user_id);
		sqlSession.update(NAMESPACE + "updateUserPoint", paraMap);
	}

	@Override
	public KdhPointCodeVo selectFoodPercent() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectFoodPercent");
	}

	@Override
	public int selectPointByUserId(String user_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectPointByUserId", user_id);
	}

	@Override
	public void insertUsedPointInfo(String user_id, int used_point) throws Exception {
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("user_id", user_id);
		paraMap.put("used_point", used_point);
		sqlSession.insert(NAMESPACE + "insertUsedPointInfo", paraMap);
	}

	@Override
	public List<KdhMypagePointDto> selectUsedPointInfo(String user_id) throws Exception {
		return sqlSession.selectList(NAMESPACE + "selectUsedPointInfo", user_id);
	}

}
