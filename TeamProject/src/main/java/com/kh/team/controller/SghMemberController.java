package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.SghUserVo;

@Controller
@RequestMapping("/sgh/member")
public class SghMemberController {

	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String loginForm() throws Exception {
		return "user/sgh/sgh_book/sgh_login_form";
	}
	
	@RequestMapping(value="/loginRun", method=RequestMethod.POST)
	public String loginRun() throws Exception {
		System.out.println("로그인 등록");
		return "/main/main";
	}
	
	@RequestMapping(value="/joinForm", method=RequestMethod.GET)
	public String joinForm() throws Exception {
		return "user/sgh/sgh_book/sgh_join_form";
	}
	
	@RequestMapping(value="/joinRun", method=RequestMethod.POST)
	public String joinRun(SghUserVo sghUserVo) throws Exception {
		System.out.println("userVo : " + sghUserVo);
		System.out.println("회원가입 등록");
		return "/main/main";
	}
}
