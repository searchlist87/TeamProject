package com.kh.team.jmh.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.JmhBoardVo;
import com.kh.team.domain.JmhMyPageVo;
import com.kh.team.domain.JmhReplyVo;

@Repository
public class JmhMyPageDaoImpl implements JmhMyPageDao {
	
	private final String NAMESPACE = "mappers.jmh-mypage-mapper.";
	
	@Inject
	private SqlSession sqlSession;

	// ----- 회원 정보 관리 -------
	// 내 정보 가져오기
	@Override
	public JmhMyPageVo getUserInfo(String user_id) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getUserInfo", user_id);
	}

	// 내 정보 수정하기
	@Override
	public void modifyUserInfo(JmhMyPageVo jmhMyPageVo) throws Exception {
		sqlSession.update(NAMESPACE + "modifyUserInfo", jmhMyPageVo);

	}

	// 회원 탈퇴하기
	@Override
	public void secessionUser(String user_id) throws Exception {
		sqlSession.update(NAMESPACE + "secessionUser", user_id);
	}

	// ---------- 1:1 문의 ------------
	
	// 1:1 문의 등록하기
	@Override
	public void registerQuestion(JmhBoardVo jmhBoardVo) throws Exception {
		sqlSession.insert(NAMESPACE + "registerQuestion", jmhBoardVo);
	}

	// 1:1 문의 리스트
	@Override
	public List<JmhBoardVo> getQuestionList(String user_id) throws Exception {
		return sqlSession.selectList(NAMESPACE +"getQuestionList" , user_id);
	}

	// 1:1 문의 상세내용 보기
	@Override
	public JmhBoardVo selectQuestion(String user_id, int board_code) throws Exception {
		Map<Object, Object> paramMap = new HashMap<Object, Object>();
		paramMap.put("user_id", user_id);
		paramMap.put("board_code", board_code);
		return sqlSession.selectOne(NAMESPACE + "selectQuestion", paramMap);
	}

	// 1:1 문의내용 수정하기
	@Override
	public void modifyQuestion(JmhBoardVo jmhBoardVo) throws Exception {
		sqlSession.update(NAMESPACE + "modifyQuestion", jmhBoardVo);
	}

	// 1:1 문의 삭제하기
	@Override
	public void deleteQuestion(String user_id, int board_code) throws Exception {
		Map<Object, Object> paramMap = new HashMap<Object, Object>();
		paramMap.put("user_id", user_id);
		paramMap.put("board_code", board_code);
		sqlSession.delete(NAMESPACE + "deleteQuestion", paramMap);
	}
	
	// 1:1 답변 체크
	@Override
	public int checkReply(int board_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "checkReply", board_code);
	}

	// 1:1 답변 가져오기
	@Override
	public JmhReplyVo selectReply(int board_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectReply", board_code);
	}

}
