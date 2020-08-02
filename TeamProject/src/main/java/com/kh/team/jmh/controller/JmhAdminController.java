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
import com.kh.team.domain.JmhFAQVo;
import com.kh.team.domain.JmhMovieImageVo;
import com.kh.team.domain.JmhMovieVo;
import com.kh.team.domain.JmhNoticeVo;
import com.kh.team.domain.JmhPagingDto;
import com.kh.team.domain.JmhReplyVo;
import com.kh.team.domain.JmhUserVo;
import com.kh.team.jmh.service.JmhCustomerService;
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
	
	@Inject
	private JmhCustomerService jmhCustomerService;
	
	// admin page
	@RequestMapping(value="/admin", method = RequestMethod.GET)
	public String admin() throws Exception {
		return "/admin/admin";
	}
	
	//---------------------- 영화 -------------------------------------
	
	// 영화 조회
	@RequestMapping(value="/admin_movie_list", method = RequestMethod.GET)
	public String movie_list(Model model, JmhPagingDto jmhPagingDto) throws Exception {
		jmhPagingDto.setPerPage(5);
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
	
	//---------------------- 영화 END -------------------------------------
	
	//---------------------- 이벤트 -------------------------------------
	
	
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
	
	// --------------- 이벤트 END ---------------------
	
	
	// --------------- 1:1 문의 -----------------------
	// 1:1 문의 리스트
	@RequestMapping(value="/admin_questionList", method = RequestMethod.GET)
	public String admin_question(Model model, JmhPagingDto jmhPagingDto) throws Exception {
		jmhPagingDto.setPerPage(10);
		jmhPagingDto.setPageInfo();
		
		int count1 = jmhMypageService.adminGetQuestionCount(jmhPagingDto);
		jmhPagingDto.setTotalCount(count1);
		System.out.println("count :" + count1);
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
	
	// --------------- 1:1 문의 END -----------------------
	
	// --------------- 고객관리 - 회원정보 조회 ----------
	
	@RequestMapping(value = "/admin_customerList", method = RequestMethod.GET)
	public String admin_customer(Model model) throws Exception {
		List<JmhUserVo> jmhUserVo = jmhUserService.getUserInfo();
		model.addAttribute("jmhUserVo", jmhUserVo);
		return "/admin/admin_customerList";
	}
	
	// --------------- 고객관리 - 회원정보 조회 END ----------
	
	// --------------- FAQ ----------------------------------
	
	// faq 등록 폼
	@RequestMapping(value="/admin_faq_register", method = RequestMethod.GET)
	public String admin_faq_register() throws Exception {
		return "/admin/admin_faq_register";
	}
	
	// faq 등록 처리
	@RequestMapping(value="/admin_faq_register", method = RequestMethod.POST)
	public String admin_faq_registerPost(JmhFAQVo jmhFAQVo, RedirectAttributes rttr) throws Exception {
		jmhCustomerService.faqResiter(jmhFAQVo);
		rttr.addFlashAttribute("rMsg", "success");
		return "redirect:/admin/admin_faq_list";
	}
	
	// faq 리스트
	@RequestMapping(value="/admin_faq_list", method = RequestMethod.GET)
	public String admin_faq_list(Model model) throws Exception {
		List<JmhFAQVo> jmhFAQVo = jmhCustomerService.getFaqList();
		model.addAttribute("jmhFAQVo", jmhFAQVo);
		return "/admin/admin_faq_list";
	}
	
	// faq 상세보기
	@RequestMapping(value="/admin_select_faq", method = RequestMethod.GET)
	public String admin_select_faq(int faq_code, Model model) throws Exception {
		JmhFAQVo jmhFAQVo = jmhCustomerService.selectFaq(faq_code);
		model.addAttribute("jmhFAQVo", jmhFAQVo);
		return "/admin/admin_select_faq";
	}
	
	// faq 수정하기
	@RequestMapping(value="/admin_modify_faq", method = RequestMethod.POST)
	public String admin_modify_faq(JmhFAQVo jmhFAQVo) throws Exception {
		System.out.println("jmhFAQVo :" + jmhFAQVo);
		jmhCustomerService.modifyFaq(jmhFAQVo);
		int faq_code = jmhFAQVo.getFaq_code();
		return "redirect:/admin/admin_select_faq?faq_code="+ faq_code;
	}
	
	// faq 삭제하기
	@RequestMapping(value="/admin_delete_faq", method = RequestMethod.GET)
	public String admin_delete_faq(int faq_code, RedirectAttributes rttr) throws Exception {
		jmhCustomerService.deleteFaq(faq_code);
		rttr.addFlashAttribute("dMsg", "success");
		return "redirect:/admin/admin_faq_list";
	}
	
	// --------------- FAQ END ----------------------------------
	
	// --------------- 공지사항 ----------------------------------
	
	// 공지사항 페이지
	@RequestMapping(value="/admin_notice_list", method = RequestMethod.GET)
	public String admin_notice_list(Model model) throws Exception {
		List<JmhNoticeVo> jmhNoticeVo = jmhCustomerService.getNoticeList();
		model.addAttribute("jmhNoticeVo", jmhNoticeVo);
		return "/admin/admin_notice_list";
	}
	
	// 공지사항 등록 페이지
	@RequestMapping(value="/admin_notice_register", method = RequestMethod.GET)
	public String admin_notice_register() throws Exception {
		return "/admin/admin_notice_register";
	}
	
	// 공지사항 등록 처리
	@RequestMapping(value="/admin_notice_register", method = RequestMethod.POST)
	public String admin_notice_registerPost(JmhNoticeVo jmhNoticeVo, RedirectAttributes rttr) throws Exception {
		jmhCustomerService.registerNotice(jmhNoticeVo);
		rttr.addFlashAttribute("rMsg", "success");
		return "redirect:/admin/admin_notice_list";
	}
	
	// 공지사항 상세페이지
	@RequestMapping(value="/admin_select_notice", method = RequestMethod.GET)
	public String admin_notice_select(int board_code, Model model) throws Exception {
		JmhNoticeVo jmhNoticeVo = jmhCustomerService.selectByNotice(board_code);
		model.addAttribute("jmhNoticeVo", jmhNoticeVo);
		return "/admin/admin_notice_selectByNotice";
	}
	
	// 공지사항 수정처리
	@RequestMapping(value="/admin_notice_modify", method = RequestMethod.POST)
	public String admin_notice_modify(JmhNoticeVo jmhNoticeVo, RedirectAttributes rttr) throws Exception {
		int board_code = jmhNoticeVo.getBoard_code();
		jmhCustomerService.modifyNotice(jmhNoticeVo);
		rttr.addFlashAttribute("mMsg", "success");
		return "redirect:/admin/admin_select_notice?board_code="+ board_code;
	}
	
	// 공지사항 삭제처리
	@RequestMapping(value="/admin_notice_delete", method = RequestMethod.GET)
	public String admin_notice_delete(int board_code, RedirectAttributes rttr) throws Exception {
		jmhCustomerService.deleteNotice(board_code);
		rttr.addFlashAttribute("dMsg", "success");
		return "redirect:/admin/admin_notice_list";
	}
}
