package com.kh.team.jmh.persistence;

import java.util.List;

import com.kh.team.domain.JmhFAQVo;
import com.kh.team.domain.JmhNoticeVo;

public interface JmhCustomerDao {
	
	// FAQ 등록
	public void faqResiter(JmhFAQVo jmhFAQVo) throws Exception;
	
	// FAQ 리스트
	public List<JmhFAQVo> getFaqList() throws Exception;
	
	// FAQ 수정
	public void modifyFaq(JmhFAQVo jmhFAQVo) throws Exception;
	
	// FAQ 삭제
	public void deleteFaq(int faq_code) throws Exception;
	
	// FAQ 상세보기
	public JmhFAQVo selectFaq(int faq_code) throws Exception;
	
	// --------------- FAQ END ------------------------------
	
	// --------------- 공지사항 -----------------------------
	
	// 공지사항 리스트 가져오기
	public List<JmhNoticeVo> getNoticeList() throws Exception;
	
	// 공지사항 등록하기
	public void registerNotice(JmhNoticeVo jmhNoticeVo) throws Exception;
	
	// board_code 가져오기
	public int getBoardCode() throws Exception;
	
	// 공지사항 상세페이지
	public JmhNoticeVo selectByNotice(int board_code) throws Exception;
	
	// 공지사항 필수체크 등록
	public void registerNoticeCheck(JmhNoticeVo jmhNoticeVo) throws Exception;
	
	// 공지사항 수정하기
	public void modifyNotice(JmhNoticeVo jmhNoticeVo) throws Exception;
	
	// 공지사항 필수체크 수정
	public void modifyNoticeCheck(JmhNoticeVo jmhNoticeVo) throws Exception;
	
	// 공지사항 삭제하기
	public void deleteNotice(int board_code) throws Exception;
	
	// 공지사항 필수체크 삭제
	public void deleteNoticeCheck(int board_code) throws Exception;

}
