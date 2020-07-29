package com.kh.team.jmh.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.JmhFAQVo;
import com.kh.team.jmh.service.JmhCustomerService;


@Controller
@RequestMapping(value="/customer")
public class JmhCustomerController {

	@Inject
	private JmhCustomerService jmhCustomerService;
	
	@RequestMapping(value="/customerPage", method = RequestMethod.GET)
	public String customerService(Model model) throws Exception {
		List<JmhFAQVo> jmhFAQVo = jmhCustomerService.getFaqList();
		model.addAttribute("jmhFAQVo", jmhFAQVo);
		return "/user/jmh/jmh_customer/jmh_customer";
	}
}
