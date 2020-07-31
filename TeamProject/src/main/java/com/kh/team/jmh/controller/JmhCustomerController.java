package com.kh.team.jmh.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.JmhFAQVo;
import com.kh.team.domain.JmhNoticeVo;
import com.kh.team.jmh.service.JmhCustomerService;


@Controller
@RequestMapping(value="/customer")
public class JmhCustomerController {

	@Inject
	private JmhCustomerService jmhCustomerService;
	
	// 고객센터 페이지
	@RequestMapping(value="/customerPage", method = RequestMethod.GET)
	public String customerService(Model model) throws Exception {
		List<JmhFAQVo> jmhFAQVo = jmhCustomerService.getFaqList();
		List<JmhNoticeVo> jmhNoticeVo = jmhCustomerService.getNoticeList();
		model.addAttribute("jmhFAQVo", jmhFAQVo);
		model.addAttribute("jmhNoticeVo", jmhNoticeVo);
		return "/user/jmh/jmh_customer/jmh_customer";
	}
	
	// 공지사항 상세보기
	@RequestMapping(value="/customer_selectByCustomer", method = RequestMethod.GET)
	public String selectByCustomer(int board_code, Model model) throws Exception {
		List<JmhFAQVo> jmhFAQVo = jmhCustomerService.getFaqList();
		JmhNoticeVo jmhNoticeVo = jmhCustomerService.selectByNotice(board_code);
		model.addAttribute("jmhFAQVo", jmhFAQVo);
		model.addAttribute("jmhNoticeVo", jmhNoticeVo);
		return "/user/jmh/jmh_customer/jmh_selectByCustomer";
	}
}
