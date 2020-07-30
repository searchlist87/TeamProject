package com.kh.team.jmh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.domain.JmhFAQVo;
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

}
