package com.kh.team.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.SghLoginDto;
import com.kh.team.domain.SghUserVo;
import com.kh.team.service.SghUserService;

@Controller
@RequestMapping("/sgh/user")
public class SghUserController {
	
	@Inject
	private SghUserService sghUserService;

	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String loginForm() throws Exception {
		return "user/sgh/sgh_book/sgh_login_form";
	}
	
	// 로그인
	@RequestMapping(value="/loginRun", method=RequestMethod.POST)
	public String loginRun(SghLoginDto sghLoginDto, HttpSession session) throws Exception {
		SghUserVo result = sghUserService.userLogin(sghLoginDto);
		// 로그인 아이디 정보 세션에 담기
		session.setAttribute("user_id", sghLoginDto.getUser_id());
//		session.setAttribute("user_class", sghLoginDto.getUser_class());
		System.out.println("user_class : " + sghLoginDto.getUser_class());
		// 맵퍼의 반환값이 1이면 성공
		if(result == null) {
			return "redirect:/";
		}
		return "redirect:/sgh/user/loginForm";
	}
	
	// 로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		// 저장된 로그인 세션 지우기
		session.invalidate();
		System.out.println("로그아웃");
		return "redirect:/sgh/user/loginForm";
	}
	
	@RequestMapping(value="/joinForm", method=RequestMethod.GET)
	public String joinForm() throws Exception {
		return "user/sgh/sgh_book/sgh_join_form";
	}
	
	@RequestMapping(value="/joinRun", method=RequestMethod.POST)
	public String joinRun(SghUserVo sghUserVo, RedirectAttributes rttr) throws Exception {
		System.out.println("userVo : " + sghUserVo);
		
		boolean result = false;
		// 회원가입이 성공한다면 true 리턴, 실패한다면 false 리턴
		try {
			sghUserService.userJoin(sghUserVo);
			result = true;
			rttr.addFlashAttribute("result", result);
			return "redirect:/sgh/user/loginForm";
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("회원가입 결과 : " + result);
		return "redirect:/sgh/user/joinForm";
	}
	
	// 아이디 중복 확인
	@RequestMapping(value="/userIdDupCheck", method=RequestMethod.GET)
	public String userIdDupCheck(String user_id) throws Exception {
		System.out.println("user_id :" + user_id);
		int result = sghUserService.userIdDupCheck(user_id);
		// 결과가 1 있으면 사용 불가, 0 없으면 사용가능
		System.out.println("result :" + result);
		if(result == 1) {
			return "false";
		}
		return "true";
	}
}
