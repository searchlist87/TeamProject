package com.kh.team.jmh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.domain.JmhBoardDto;
import com.kh.team.domain.JmhBoardVo;
import com.kh.team.domain.JmhMyPageVo;
import com.kh.team.domain.JmhPagingDto;
import com.kh.team.domain.JmhReplyVo;
import com.kh.team.jmh.persistence.JmhMyPageDao;

@Service
public class JmhMypageServiceImpl implements JmhMypageService {
	
	@Inject
	private JmhMyPageDao jmhMypageDao;

	// ----- 회원 정보 관리 -------
	// 내 정보 가져오기
	@Override
	public JmhMyPageVo getUserInfo(String user_id) throws Exception {
		return jmhMypageDao.getUserInfo(user_id);
	}

	// 내 정보 수정하기
	@Override
	public void modifyUserInfo(JmhMyPageVo jmhMyPageVo) throws Exception {
		jmhMypageDao.modifyUserInfo(jmhMyPageVo);
	}

	// 회원 탈퇴하기
	@Override
	public void secessionUser(String user_id) throws Exception {
		jmhMypageDao.secessionUser(user_id);
	}

	// ---------- 1:1 문의 ------------
	
	// 1:1 문의 등록하기
	@Override
	public void registerQuestion(JmhBoardVo jmhBoardVo) throws Exception {
		jmhMypageDao.registerQuestion(jmhBoardVo);
	}

	// 1:1 문의 리스트
	@Override
	public List<JmhBoardVo> getQuestionList(String user_id) throws Exception {
		return jmhMypageDao.getQuestionList(user_id);
	}

	// 1:1 문의 상세내용 보기
	@Override
	public JmhBoardVo selectQuestion(String user_id, int board_code) throws Exception {
		return jmhMypageDao.selectQuestion(user_id, board_code);
	}

	// 1:1 문의내용 수정하기
	@Override
	public void modifyQuestion(JmhBoardVo jmhBoardVo) throws Exception {
		jmhMypageDao.modifyQuestion(jmhBoardVo);
	}

	// 1:1 문의 삭제하기
	@Transactional
	@Override
	public void deleteQuestion(String user_id, int board_code) throws Exception {
		jmhMypageDao.deleteQuestion(user_id, board_code);
		jmhMypageDao.adminDeleteReply(board_code);
	}
	// 1:1 답변 체크
	@Override
	public int checkReply(int board_code) throws Exception {
		return jmhMypageDao.checkReply(board_code);
	}

	// 1:1 답변 가져오기
	@Override
	public JmhReplyVo selectReply(int board_code) throws Exception {
		return jmhMypageDao.selectReply(board_code);
	}
	
	// ------------ 사용자 끝 --------------------------
	
	// ------ admin  -------------------- 
	
	// 1:1 문의 리스트
	@Override
	public List<JmhBoardVo> adminGetQuestionList() throws Exception {
		return jmhMypageDao.adminGetQuestionList();
	}

	// 1:1 답변 달기
	@Override
	public void adminRegisterReply(JmhBoardDto jmhBoardDto) throws Exception {
		jmhMypageDao.adminRegisterReply(jmhBoardDto);
	}

	// 1:1 답변 수정
	@Override
	public void adminModifyReply(JmhBoardDto jmhBoardDto) throws Exception {
		jmhMypageDao.adminModifyReply(jmhBoardDto);
	}

	// 1:1 문의 총 갯수 가져오기
	@Override
	public int adminGetQuestionCount(JmhPagingDto jmhPagingDto) throws Exception {
		return jmhMypageDao.adminGetQuestionCount(jmhPagingDto);
	}

	// 1:1 문의 페이징
	@Override
	public List<JmhBoardVo> adminQuestionListPaging(JmhPagingDto jmhPagingDto) throws Exception {
		return jmhMypageDao.adminQuestionListPaging(jmhPagingDto);
	}

	// 1:1 문의 댓글없는 페이징
	@Override
	public List<JmhBoardVo> adminQuestionNoReply(JmhPagingDto jmhPagingDto) throws Exception {
		return jmhMypageDao.adminQuestionNoReply(jmhPagingDto);
	}

	// 1:1 문의 답변없는 총 갯수 가져오기
	@Override
	public int adminQuestionNoReplyCount() throws Exception {
		return jmhMypageDao.adminQuestionNoReplyCount();
	}

}