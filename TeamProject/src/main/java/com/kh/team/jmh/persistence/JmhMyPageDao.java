package com.kh.team.jmh.persistence;

import java.util.List;

import com.kh.team.domain.JmhBoardDto;
import com.kh.team.domain.JmhBoardVo;
import com.kh.team.domain.JmhMyPageVo;
import com.kh.team.domain.JmhPagingDto;
import com.kh.team.domain.JmhReplyVo;

public interface JmhMyPageDao {
	
	// -------- 회원 정보 관리 --------
	
	// 내 정보 가져오기
	public JmhMyPageVo getUserInfo(String user_id) throws Exception;
	
	// 내 정보 수정하기
	public void modifyUserInfo(JmhMyPageVo jmhMyPageVo) throws Exception;
	
	// 회원 탈퇴하기
	public void secessionUser(String user_id) throws Exception;
	
	// ---------- 1:1 문의 ------------
	
	// 1:1 문의 등록하기
	public void registerQuestion(JmhBoardVo jmhBoardVo) throws Exception; 
	
	// 1:1 문의 리스트
	public List<JmhBoardVo> getQuestionList(String user_id) throws Exception;
	
	// 1:1 문의 상세내용 보기
	public JmhBoardVo selectQuestion(String user_id, int board_code) throws Exception;
	
	// 1:1 문의내용 수정하기
	public void modifyQuestion(JmhBoardVo jmhBoardVo) throws Exception;
	
	// 1:1 문의 삭제하기
	public void deleteQuestion(String user_id, int board_code) throws Exception;
	
	// 1:1 답변 체크
	public int checkReply(int board_code) throws Exception;
	
	// 1:1 답변 가져오기
	public JmhReplyVo selectReply(int board_code) throws Exception;
	
	// ------------ 사용자 끝 --------------------------
	
	// ------ admin  -------------------- 
	
	// 1:1 문의 리스트
	public List<JmhBoardVo> adminGetQuestionList() throws Exception;
	
	// 1:1 답변 달기
	public void adminRegisterReply(JmhBoardDto jmhBoardDto) throws Exception;

	// 1:1 답변 수정
	public void adminModifyReply(JmhBoardDto jmhBoardDto) throws Exception;
	
	// 1:1 답변 삭제
	public void adminDeleteReply(int board_code) throws Exception;
	
	// 1:1 문의 총 갯수 가져오기
	public int adminGetQuestionCount(JmhPagingDto jmhPagingDto) throws Exception;
	
	// 1:1 문의 페이징
	public List<JmhBoardVo> adminQuestionListPaging(JmhPagingDto jmhPagingDto) throws Exception;
	
	// 1:1 문의 답변없는 총 갯수 가져오기
	public int adminQuestionNoReplyCount() throws Exception;
	
	// 1:1 문의 답변없는 페이징
	public List<JmhBoardVo> adminQuestionNoReply(JmhPagingDto jmhPagingDto) throws Exception;
}
