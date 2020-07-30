package com.kh.team.jmh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.team.domain.JmhFAQVo;
import com.kh.team.domain.JmhNoticeVo;

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
	
	// --------------- FAQ END ------------------------------
	
	// --------------- 공지사항 -----------------------------
	
	// 공지사항 리스트 가져오기
	@Override
	public List<JmhNoticeVo> getNoticeList() throws Exception {
		return sqlSession.selectList(NAMESPACE + "getNoticeList");
	}

	// 공지사항 등록하기
	@Override
	public void registerNotice(JmhNoticeVo jmhNoticeVo) throws Exception {
		sqlSession.insert(NAMESPACE + "registerNotice", jmhNoticeVo);
	}
	
	// 공지사항 필수체크 등록
	@Override
	public void registerNoticeCheck(JmhNoticeVo jmhNoticeVo) throws Exception {
		sqlSession.insert(NAMESPACE + "registerNoticeCheck", jmhNoticeVo);
	}
	
	// 공지사항 수정하기
	@Override
	public void modifyNotice(JmhNoticeVo jmhNoticeVo) throws Exception {
		sqlSession.update(NAMESPACE + "modifyNotice", jmhNoticeVo);
	}
	
	// 공지사항 필수체크 수정
	@Override
	public void modifyNoticeCheck(JmhNoticeVo jmhNoticeVo) throws Exception {
		sqlSession.update(NAMESPACE + "modifyNoticeCheck", jmhNoticeVo);
	}
	
	// 공지사항 삭제하기
	@Override
	public void deleteNotice(int board_code) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteNotice", board_code);
	}
	
	// 공지사항 필수체크 삭제
	@Override
	public void deleteNoticeCheck(int board_code) throws Exception {
		sqlSession.delete(NAMESPACE + "deleteNoticeCheck", board_code);
	}

	// board_code 가져오기
	@Override
	public int getBoardCode() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "getBoardCode");
	}

	// 공지사항 상세페이지
	@Override
	public JmhNoticeVo selectByNotice(int board_code) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "selectByNotice", board_code);
	}
	
}