package com.kh.team.jmh.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.JmhBoardDto;
import com.kh.team.domain.JmhBoardVo;
import com.kh.team.domain.JmhEventVo;
import com.kh.team.domain.JmhMovieImageVo;
import com.kh.team.domain.JmhMovieVo;
import com.kh.team.domain.JmhPagingDto;
import com.kh.team.domain.JmhReplyVo;
import com.kh.team.domain.JmhUserVo;
import com.kh.team.jmh.service.JmhEventService;
import com.kh.team.jmh.service.JmhMovieService;
import com.kh.team.jmh.service.JmhMypageService;
import com.kh.team.jmh.service.JmhUserService;

@Controller
@RequestMapping("/admin")
public class JmhAdminController {
	
	@Inject
	private JmhMovieService jmhMovieService;
	
	@Inject
	private JmhEventService jmhEventService;
	
	@Inject
	private JmhMypageService jmhMypageService;
	
	@Inject
	private JmhUserService jmhUserService;
	
	// admin page
	@RequestMapping(value="/admin", method = RequestMethod.GET)
	public String admin() throws Exception {
		return "/admin/admin";
	}
	
	// 영화 조회
	@RequestMapping(value="/admin_movie_list", method = RequestMethod.GET)
	public String movie_list(Model model, JmhPagingDto jmhPagingDto) throws Exception {
		System.out.println("jmhPagingDto :" + jmhPagingDto);
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
		System.out.println("movie_code :" + movie_code);
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
	public String admin_eventList(Model model, JmhPagingDto jmhPagingDto) throws Exception {
		jmhPagingDto.setPerPage(10);
		jmhPagingDto.setPageInfo();
		
		int count = jmhEventService.adminEventCount(jmhPagingDto);
		jmhPagingDto.setTotalCount(count);
		List<JmhEventVo> list = jmhEventService.adminEventPagingList(jmhPagingDto);
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
	
	
	// --------------- 1:1 문의 -----------------------
	// 1:1 문의 리스트
	@RequestMapping(value="/admin_questionList", method = RequestMethod.GET)
	public String admin_question(Model model, JmhPagingDto jmhPagingDto) throws Exception {
		jmhPagingDto.setPerPage(10);
		jmhPagingDto.setPageInfo();
		
		System.out.println("jmhPagingDto : " + jmhPagingDto);
		
		int count1 = jmhMypageService.adminGetQuestionCount();
		jmhPagingDto.setTotalCount(count1);
		String searchType = jmhPagingDto.getSearchType();
		List<JmhBoardVo> jmhBoardVo;
		
		if(searchType == null || searchType.equals("")) {
			jmhBoardVo = jmhMypageService.adminQuestionListPaging(jmhPagingDto);
		} else if(searchType.equals("noReply")){
			int count2 = jmhMypageService.adminQuestionNoReplyCount();
			jmhPagingDto.setTotalCount(count2);
			jmhBoardVo = jmhMypageService.adminQuestionNoReply(jmhPagingDto);
		} else {
			jmhBoardVo = jmhMypageService.adminQuestionListPaging(jmhPagingDto);
		}
		
		int size = jmhBoardVo.size();
		for(int i = 0; i < size; i ++) {
			JmhBoardVo vo = jmhBoardVo.get(i);
			int board_code = vo.getBoard_code();
			int count = jmhMypageService.checkReply(board_code);
			vo.setCount(count);
		}
		model.addAttribute("jmhBoardVo", jmhBoardVo);
		return "/admin/admin_question_list";
	}
	
	// 1:1 문의 상세보기
	@RequestMapping(value="/admin_selectQuestion", method = RequestMethod.GET)
	public String admin_selectQuestion(int board_code, String user_id, Model model) throws Exception {
		
		JmhBoardVo boardVo = jmhMypageService.selectQuestion(user_id, board_code);
		JmhReplyVo replyVo = jmhMypageService.selectReply(board_code);
		
		model.addAttribute("jmhReplyVo", replyVo);
		model.addAttribute("jmhBoardVo", boardVo);
		return "/admin/admin_selectByQuestion";
	}
	
	// 1:1 문의 답변 등록
	@RequestMapping(value="/admin_registerReply", method = RequestMethod.POST)
	public String admin_registerReply(JmhBoardDto jmhBoardDto) throws Exception {
		jmhMypageService.adminRegisterReply(jmhBoardDto);
		int board_code = jmhBoardDto.getBoard_code();
		String user_id = jmhBoardDto.getUser_id();
		return "redirect:/admin/admin_selectQuestion?board_code=" + board_code + "&user_id=" + user_id;
	}
	
	// 1:1 문의 답변 수정
	@RequestMapping(value="/admin_modifyReply", method = RequestMethod.POST)
	public String admin_modifyReply(JmhBoardDto jmhBoardDto) throws Exception {
		jmhMypageService.adminModifyReply(jmhBoardDto);
		int board_code = jmhBoardDto.getBoard_code();
		String user_id = jmhBoardDto.getUser_id();
		return "redirect:/admin/admin_selectQuestion?board_code=" + board_code + "&user_id=" + user_id;
	}
	
	// --------------- 1:1 문의 끝 -----------------------
	
	// --------------- 고객관리 - 회원정보 조회 ----------
	
	@RequestMapping(value = "/admin_customerList", method = RequestMethod.GET)
	public String admin_customer(Model model) throws Exception {
		List<JmhUserVo> jmhUserVo = jmhUserService.getUserInfo();
		model.addAttribute("jmhUserVo", jmhUserVo);
		return "/admin/admin_customerList";
	}
	
}
