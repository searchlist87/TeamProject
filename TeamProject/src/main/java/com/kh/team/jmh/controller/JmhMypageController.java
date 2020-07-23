package com.kh.team.jmh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/mypage")
public class JmhMypageController {

	// 마이페이지 폼
	@RequestMapping(value="/pageForm", method = RequestMethod.GET)
	public void myPageForm() throws Exception {
		
	}
}
