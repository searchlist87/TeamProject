package com.kh.team.jmh.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.JmhEventVo;
import com.kh.team.domain.JmhMovieImageVo;
import com.kh.team.domain.JmhMovieVo;
import com.kh.team.domain.JmhPagingDto;
import com.kh.team.jmh.service.JmhEventService;
import com.kh.team.jmh.service.JmhMovieService;

@Controller
@RequestMapping("/admin")
public class JmhAdminController {
	
	@Inject
	private JmhMovieService jmhMovieService;
	
	@Inject
	private JmhEventService jmhEventService;
	
	// admin page
	@RequestMapping(value="/admin", method = RequestMethod.GET)
	public String admin() throws Exception {
		return "/admin/admin";
	}
	
	// 영화 조회
	@RequestMapping(value="/admin_movie_list", method = RequestMethod.GET)
	public String movie_list(Model model, JmhPagingDto jmhPagingDto) throws Exception {
		jmhPagingDto.setPageInfo();
		int count = jmhMovieService.getCountMovie(jmhPagingDto);
		jmhPagingDto.setTotalCount(count);
		List<JmhMovieVo> jmhMovieVo = jmhMovieService.moviePagingList(jmhPagingDto);
		model.addAttribute("jmhMovieVo", jmhMovieVo);
		model.addAttribute("jmhPagingDto", jmhPagingDto);
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
		jmhMovieService.movieModify(jmhMovieVo);
		
		return "redirect:/admin/admin_movie_selectByMovie?movie_code=" + movie_code;
	}
	
	// 이벤트 -------------------------------------
	
	
	// 이벤트 조회
	@RequestMapping(value="/admin_event_list", method = RequestMethod.GET)
	public String admin_eventList(Model model, String keyword, String searchType) throws Exception {
		List<JmhEventVo> list = jmhEventService.adminEventList(keyword, searchType);
		model.addAttribute("list", list);
		return "/admin/admin_event_list";
	}
	
	// 이벤트 등록 폼
	@RequestMapping(value="/admin_event_register", method = RequestMethod.GET)
	public String admin_eventRegister() throws Exception {
		return "/admin/admin_event_register";	
	}
	
	// 이벤트 등록 처리
	@RequestMapping(value="/admin_event_register", method = RequestMethod.POST)
	public String admin_eventRegisterPost(JmhEventVo jmhEventVo) throws Exception {
		System.out.println("JmhEventVo :" + jmhEventVo);
		jmhEventService.eventRegister(jmhEventVo);
		return "redirect:/admin/admin_event_list";
	}
	
	// 이벤트 상세페이지
	@RequestMapping(value="/admin_event_selectEvent", method = RequestMethod.GET)
	public String admin_selectEvent(int event_code, Model model) throws Exception {
		JmhEventVo eventVo = jmhEventService.selectByEvent(event_code);
		model.addAttribute("eventVo", eventVo);
		return "/admin/admin_event_selectEvent";
	}
	
	// 이벤트 수정 폼
	@RequestMapping(value="/admin_event_modify", method = RequestMethod.GET)
	public String admin_modify(int event_code, Model model) throws Exception {
		JmhEventVo eventVo = jmhEventService.selectByEvent(event_code);
		model.addAttribute("eventVo", eventVo);
		return "/admin/admin_event_modify";
		
	}
	
	// 이벤트 수정 처리
	@RequestMapping(value="/admin_event_modify", method = RequestMethod.POST)
	public String admin_modifyPost(JmhEventVo jmhEventVo) throws Exception {
		int event_code = jmhEventVo.getEvent_code();
		jmhEventService.eventModify(jmhEventVo);
		return "redirect:/admin/admin_event_selectEvent?event_code="+ event_code;
	}
	
	// --------------- 이벤트 끝 ---------------------
	
	// 1:1 문의 리스트
	@RequestMapping(value="/admin_questionList", method = RequestMethod.GET)
	public String admin_question() throws Exception {
		return "/admin/admin_question_list";
	}
	
}
