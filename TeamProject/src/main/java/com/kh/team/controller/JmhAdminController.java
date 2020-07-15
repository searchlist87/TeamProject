package com.kh.team.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.JmhMovieVo;
import com.kh.team.service.JmhMovieService;

@Controller
@RequestMapping("/admin")
public class JmhAdminController {
	
	@Inject
	private JmhMovieService jmhMovieService;
	
	// admin page
	@RequestMapping(value="/admin", method = RequestMethod.GET)
	public String admin() throws Exception {
		return "/admin/admin";
	}
	
	// 영화 조회
	@RequestMapping(value="/admin_movie_list", method = RequestMethod.GET)
	public String movie_list() throws Exception {
		return "/admin/admin_movie_list";
	}
	
	// 영화 등록 폼
	@RequestMapping(value="/admin_movie_register", method = RequestMethod.GET)
	public String movie_register() throws Exception {
		return "/admin/admin_movie_register";
	}
	
	// 영화 등록 처리
	@RequestMapping(value="/admin_movie_register", method = RequestMethod.POST)
	public String movie_registerPost(JmhMovieVo jmhMovieVo,RedirectAttributes rttr )throws Exception {
		System.out.println("jmhMovieVo" + jmhMovieVo);
		jmhMovieService.movieRegister(jmhMovieVo);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/admin/admin_movie_list";
	}
	
	// 영화 수정
	@RequestMapping(value="/admin_movie_modify", method = RequestMethod.GET)
	public String movie_modify() throws Exception {
		return "/admin/admin_movie_modify";
	}
	
}
