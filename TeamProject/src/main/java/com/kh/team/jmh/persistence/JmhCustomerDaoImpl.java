package com.kh.team.jmh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.JmhFAQVo;

@Repository
public class JmhCustomerDaoImpl implements JmhCustomerDao {

	private final String NAMESPACE = "mappers.jmh-customer-mapper.";
	
	@Inject
	private SqlSession sqlSession;
	
	// FAQ 등록
	@Override
	public void faqResiter(JmhFAQVo jmhFAQVo) throws Exception {
		sqlSession.insert(NAMESPACE + "RegisterFaq", jmhFAQVo);
	}

	// FAQ 리스트
	@Override
	public List<JmhFAQVo> getFaqList() throws Exception {
		return sqlSession.selectList(NAMESPACE + "getFAQList");
	}

	// FAQ 수정
	@Override
	public void modifyFaq(JmhFAQVo jmhFAQVo) throws Exception {
		sqlSession.update(NAMESPACE + "modifyFaq", jmhFAQVo);
	}

	// FAQ 삭제
	@Override
	public void deleteFaq(int faq_code) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteFaq", faq_code);
	}

	// FAQ 상세보기
	@Override
	public JmhFAQVo selectFaq(int faq_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectfaq", faq_code);
	}
}