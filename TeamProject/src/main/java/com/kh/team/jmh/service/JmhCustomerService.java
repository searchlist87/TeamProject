package com.kh.team.jmh.service;

import java.util.List;

import com.kh.team.domain.JmhFAQVo;

public interface JmhCustomerService {
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
}
