package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
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
	
	// 영화 등록
	@RequestMapping(value="/admin_movie_register", method = RequestMethod.GET)
	public String movie_register() throws Exception {
		return "/admin/admin_movie_register";
	}
	
	// 영화 수정
	@RequestMapping(value="/admin_movie_modify", method = RequestMethod.GET)
	public String movie_modify() throws Exception {
		return "/admin/admin_movie_modify";
	}
	
}
