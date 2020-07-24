package com.kh.team.jmh.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.JmhMyPageVo;
import com.kh.team.jmh.service.JmhMypageService;

@Controller
@RequestMapping("/mypage")
public class JmhMypageController {
	
	@Inject
	private JmhMypageService jmhMypageService;

	// 마이페이지 폼
	@RequestMapping(value="/pageForm", method = RequestMethod.GET)
	public String myPageForm(HttpSession session, Model model) throws Exception {
		String user_id = (String)session.getAttribute("user_id");
		JmhMyPageVo mypageVo = jmhMypageService.getUserInfo(user_id);
		model.addAttribute("mypageVo", mypageVo);
		return "/user/jmh/jmh_mypage/jmh_mypage";
	}
	
	// 마이페이지 수정 폼
	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public String mypageModifyForm(HttpSession session, Model model) throws Exception {
		String user_id = (String)session.getAttribute("user_id");
		JmhMyPageVo mypageVo = jmhMypageService.getUserInfo(user_id);
		model.addAttribute("mypageVo", mypageVo);
		return "/user/jmh/jmh_mypage/jmh_mypage_modifyForm";
	}
	
	// 마이페이지 수정 처리
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String mypageModifyPost(JmhMyPageVo jmhMypageVo, RedirectAttributes rttr) throws Exception {
		jmhMypageService.modifyUserInfo(jmhMypageVo);
		rttr.addFlashAttribute("modifyMsg", "success");
		return "redirect:/mypage/pageForm";
	}
	
	// 회원 탈퇴 폼
	@RequestMapping(value="/secession", method = RequestMethod.GET)
	public String secessionUser() throws Exception {
		return "/user/jmh/jmh_mypage/jmh_secession";
	}
	
	// 회원 탈퇴 처리
	@RequestMapping(value="/secessionPost", method = RequestMethod.GET)
	public String secessionUserPost(HttpSession session, RedirectAttributes rttr) throws Exception {
		String user_id = (String)session.getAttribute("user_id");
		jmhMypageService.secessionUser(user_id);
		rttr.addFlashAttribute("secessionMsg", "success");
		return "redirect:/team/main";
	}
	
}