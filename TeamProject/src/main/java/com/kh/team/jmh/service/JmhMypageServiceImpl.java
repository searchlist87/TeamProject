package com.kh.team.jmh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.JmhBoardVo;
import com.kh.team.domain.JmhMyPageVo;
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
	@Override
	public void deleteQuestion(String user_id, int board_code) throws Exception {
		jmhMypageDao.deleteQuestion(user_id, board_code);
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

}
