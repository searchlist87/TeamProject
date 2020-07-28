package com.kh.team.jmh.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.JmhBoardVo;
import com.kh.team.domain.JmhMyPageVo;
import com.kh.team.domain.JmhReplyVo;
import com.kh.team.jmh.service.JmhMypageService;

@Controller
@RequestMapping("/mypage")
public class JmhMypageController {
	
	@Inject
	private JmhMypageService jmhMypageService;

	// ---------------------  마이페이지 회원정보 --------------------
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
	
	// ---------------------  마이페이지 회원정보 끝--------------------
	
	// ---------------------  마이페이지 구매정보 --------------------
	
	// 영화구매내역 폼
	@RequestMapping(value="/buyMovieList", method = RequestMethod.GET)
	public String buyMovieList(HttpSession session) throws Exception {
		return "/user/jmh/jmh_mypage/jmh_buyMovieList";
	}
	
	// ---------------------  마이페이지 구매정보 끝--------------------
	
	// ---------------------  마이페이지 1:1문의 --------------------
	
	// 1:1 문의 하기
	@RequestMapping(value="/question", method = RequestMethod.GET)
	public String question() throws Exception {
		return "/user/jmh/jmh_mypage/jmh_question";
	}
	
	// 1:1 문의 등록하기
	@RequestMapping(value="/registerQuestion", method = RequestMethod.POST)
	public String registerQuestion(HttpSession session, JmhBoardVo jmhBoardVo, RedirectAttributes rttr) throws Exception {
		String user_id = (String)session.getAttribute("user_id");
		jmhBoardVo.setUser_id(user_id);
		jmhMypageService.registerQuestion(jmhBoardVo);
		rttr.addFlashAttribute("rMsg", "success");
		return "redirect:/mypage/questionList";
	}
	
	// 1:1 문의하기 리스트
	@RequestMapping(value="/questionList", method = RequestMethod.GET)
	public String questionList(HttpSession session, Model model) throws Exception {
		String user_id = (String)session.getAttribute("user_id");
		List<JmhBoardVo> boardVo = jmhMypageService.getQuestionList(user_id);
		int size = boardVo.size();
		for(int i = 0; i < size; i ++) {
			JmhBoardVo vo = boardVo.get(i);
			int board_code = vo.getBoard_code();
			int count = jmhMypageService.checkReply(board_code);
			vo.setCount(count);
		}
		model.addAttribute("jmhBoardVo", boardVo);
		return "/user/jmh/jmh_mypage/jmh_questionList";
	}
	
	// 1:1 문의 상세내용 보기
	@RequestMapping(value="/selectQuestion", method = RequestMethod.GET)
	public String selectQuestion(int board_code, HttpSession session, Model model) throws Exception {
		String user_id = (String)session.getAttribute("user_id");
		JmhBoardVo boardVo = jmhMypageService.selectQuestion(user_id, board_code);
		JmhReplyVo replyVo = jmhMypageService.selectReply(board_code);
		
		model.addAttribute("jmhReplyVo", replyVo);
		model.addAttribute("jmhBoardVo", boardVo);
		return "/user/jmh/jmh_mypage/jmh_select_question";
	}
	
	// 1:1 문의 수정하기
	@RequestMapping(value="/modifyQuestion", method = RequestMethod.POST)
	public String modifyQuestion(HttpSession session, JmhBoardVo jmhBoardVo) throws Exception {
		String user_id = (String)session.getAttribute("user_id");
		jmhBoardVo.setUser_id(user_id);
		jmhMypageService.modifyQuestion(jmhBoardVo);
		int board_code = jmhBoardVo.getBoard_code();
		return "redirect:/mypage/selectQuestion?board_code=" + board_code;
	}
	
	// 1:1 문의 삭제하기
	@RequestMapping(value="/deleteQuestion", method = RequestMethod.GET)
	public String deleteQuestion(HttpSession session, int board_code) throws Exception {
		String user_id = (String)session.getAttribute("user_id");
		jmhMypageService.deleteQuestion(user_id, board_code);
		
		return "redirect:/mypage/questionList";
	}
	
}