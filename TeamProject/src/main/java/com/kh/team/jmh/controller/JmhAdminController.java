package com.kh.team.jmh.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.JmhMovieImageVo;
import com.kh.team.domain.JmhMovieVo;
import com.kh.team.jmh.service.JmhMovieService;

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
	public String movie_list(Model model) throws Exception {
		List<JmhMovieVo> jmhMovieVo = jmhMovieService.getMovieList();
		System.out.println("jmhMovieVo :" + jmhMovieVo);
		model.addAttribute("jmhMovieVo", jmhMovieVo);
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
	
	// 영화 상세 페이지
	@RequestMapping(value="/admin_movie_selectByMovie", method = RequestMethod.GET)
	public String selectByMovie(String movie_code, Model model) throws Exception {
		JmhMovieVo jmhMovieVo = jmhMovieService.selectByMovie(movie_code);
		List<JmhMovieImageVo> jmhMovieImageVo = jmhMovieService.selectByMovieSubImage(movie_code);
		model.addAttribute("jmhMovieImageVo", jmhMovieImageVo);
		model.addAttribute("jmhMovieVo", jmhMovieVo);
		return "/admin/admin_movie_selectByMovie";
	}
	
	// 영화 수정
	@RequestMapping(value="/admin_movie_modify", method = RequestMethod.GET)
	public String movie_modify(String movie_code, Model model) throws Exception {
		JmhMovieVo jmhMovieVo = jmhMovieService.selectByMovie(movie_code);
		List<JmhMovieImageVo> jmhMovieImageVo = jmhMovieService.selectByMovieSubImage(movie_code);
		model.addAttribute("jmhMovieImageVo", jmhMovieImageVo);
		model.addAttribute("jmhMovieVo", jmhMovieVo);
		return "/admin/admin_movie_modify";
	}
	
	// 영화 수정 처리
	@RequestMapping(value="/admin_movie_modify", method = RequestMethod.POST)
	public String movie_modifyPost(JmhMovieVo jmhMovieVo) throws Exception {
		String movie_code = jmhMovieVo.getMovie_code();
		System.out.println("movie_code :" + movie_code);
		System.out.println("jmhMovieVo :" + jmhMovieVo);
		jmhMovieService.movieModify(jmhMovieVo);
		
		return "redirect:/admin/admin_movie_selectByMovie?movie_code=" + movie_code;
	}
	
}
