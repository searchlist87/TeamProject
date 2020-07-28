package com.kh.team.jmh.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.JmhBoardDto;
import com.kh.team.domain.JmhBoardVo;
import com.kh.team.domain.JmhMyPageVo;
import com.kh.team.domain.JmhPagingDto;
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

	// ------------ 사용자 끝 --------------------------
	
	// ------ admin  -------------------- 
	
	// 1:1 문의 리스트
	@Override
	public List<JmhBoardVo> adminGetQuestionList() throws Exception {
		return sqlSession.selectList(NAMESPACE + "adminGetQuestionList");
	}

	// 1:1 답변 달기
	@Override
	public void adminRegisterReply(JmhBoardDto jmhBoardDto) throws Exception {
		sqlSession.insert(NAMESPACE + "adminRegisterReply", jmhBoardDto);
	}

	// 1:1 답변 수정
	@Override
	public void adminModifyReply(JmhBoardDto jmhBoardDto) throws Exception {
		sqlSession.update(NAMESPACE + "adminModifyReply", jmhBoardDto);
	}

	// 1:1 답변 삭제
	@Override
	public void adminDeleteReply(int board_code) throws Exception {
		sqlSession.delete(NAMESPACE + "adminDeleteReply" , board_code);
	}

	// 1:1 문의 총 갯수 가져오기
	@Override
	public int adminGetQuestionCount() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "adminGetQuestionCount");
	}

	// 1:1 문의 페이징
	@Override
	public List<JmhBoardVo> adminQuestionListPaging(JmhPagingDto jmhPagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "adminQuestionListPaging", jmhPagingDto);
	}

	// 1:1 문의 댓글없는 페이징
	@Override
	public List<JmhBoardVo> adminQuestionNoReply(JmhPagingDto jmhPagingDto) throws Exception {
		return sqlSession.selectList(NAMESPACE + "adminQuestionNoReply", jmhPagingDto);
	}

	// 1:1 문의 답변없는 총 갯수 가져오기
	@Override
	public int adminQuestionNoReplyCount() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "adminQuestionNoReplyCount");
	}
	
	

}
