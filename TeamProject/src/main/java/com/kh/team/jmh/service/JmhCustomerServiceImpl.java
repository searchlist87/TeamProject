package com.kh.team.jmh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.team.domain.JmhFAQVo;
import com.kh.team.domain.JmhNoticeVo;
import com.kh.team.jmh.persistence.JmhCustomerDao;

@Service
public class JmhCustomerServiceImpl implements JmhCustomerService {

	@Inject
	private JmhCustomerDao jmhCustomerDao;
	
	
	// FAQ 등록
	@Override
	public void faqResiter(JmhFAQVo jmhFAQVo) throws Exception {
		jmhCustomerDao.faqResiter(jmhFAQVo);
	}

	// FAQ 리스트
	@Override
	public List<JmhFAQVo> getFaqList() throws Exception {
		return jmhCustomerDao.getFaqList();
	}

	// FAQ 수정
	@Override
	public void modifyFaq(JmhFAQVo jmhFAQVo) throws Exception {
		jmhCustomerDao.modifyFaq(jmhFAQVo);
	}

	// FAQ 삭제
	@Override
	public void deleteFaq(int faq_code) throws Exception {
		jmhCustomerDao.deleteFaq(faq_code);
	}

	// FAQ 상세보기
	@Override
	public JmhFAQVo selectFaq(int faq_code) throws Exception {
		return jmhCustomerDao.selectFaq(faq_code);
	}
	
	// --------------- FAQ END ------------------------------
	
	// --------------- 공지사항 -----------------------------
	
	// 공지사항 리스트 가져오기
	@Override
	public List<JmhNoticeVo> getNoticeList() throws Exception {
		return jmhCustomerDao.getNoticeList();
	}
	
	// 공지사항 등록하기
	@Transactional
	@Override
	public void registerNotice(JmhNoticeVo jmhNoticeVo) throws Exception {
		jmhCustomerDao.registerNotice(jmhNoticeVo);
		int board_code = jmhCustomerDao.getBoardCode();
		jmhNoticeVo.setBoard_code(board_code);
		jmhCustomerDao.registerNoticeCheck(jmhNoticeVo);
	}
	
	// 공지사항 수정하기
	@Transactional
	@Override
	public void modifyNotice(JmhNoticeVo jmhNoticeVo) throws Exception {
		jmhCustomerDao.modifyNotice(jmhNoticeVo);
		jmhCustomerDao.modifyNoticeCheck(jmhNoticeVo);
	}
	
	// 공지사항 삭제하기
	@Transactional
	@Override
	public void deleteNotice(int board_code) throws Exception {
		jmhCustomerDao.deleteNoticeCheck(board_code);
		jmhCustomerDao.deleteNotice(board_code);
		
	}
	
	// 공지사항 상세페이지
	@Override
	public JmhNoticeVo selectByNotice(int board_code) throws Exception {
		return jmhCustomerDao.selectByNotice(board_code);
	}
}