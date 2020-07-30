package com.kh.team.sgh.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.team.domain.SghEmailDto;
import com.kh.team.domain.SghFindDto;
import com.kh.team.domain.SghLoginDto;
import com.kh.team.domain.SghUserVo;
import com.kh.team.kdh.service.KdhFoodCartService;
import com.kh.team.sgh.service.SghUserService;
import com.kh.team.sgh.util.SghEmailUtil;

@Controller
@RequestMapping("/sgh/user")
public class SghUserController {

	@Inject
	private SghUserService sghUserService;
	@Inject
	private JavaMailSender mailSender;
	@Inject
	private KdhFoodCartService kdhFoodCartService;
	
	@RequestMapping(value="/loginForm", method=RequestMethod.GET)
	public String loginForm() throws Exception {
		return "user/sgh/sgh_member/sgh_login_form";
	}
	
	// 로그인 (Session에 user_id, user_class 저장)
	@RequestMapping(value="/loginRun", method=RequestMethod.POST)
	public String loginRun(SghLoginDto sghLoginDto, RedirectAttributes rttr,HttpSession session) throws Exception {
		try {
			sghLoginDto = sghUserService.userLogin(sghLoginDto);
			// 로그인 아이디 정보 세션에 담기
			// 맵퍼의 반환값이 1이면 성공
			session.setAttribute("user_id", sghLoginDto.getUser_id());
			session.setAttribute("user_class", sghLoginDto.getUser_class());
			
			// ------------- 카트 갯수 담기(공다혜) -------------
			int cartCount = kdhFoodCartService.selectCartCount(sghLoginDto.getUser_id());
			session.setAttribute("cartCount", cartCount);
			return "redirect:/";
		} catch(Exception e) {
			e.printStackTrace();
		}
		// 로그인에 실패하면 메세지 띄우기
		boolean loginResult = false;
		rttr.addFlashAttribute("loginResult", loginResult);
		return "redirect:/sgh/user/loginForm";
	}
	
	// 로그아웃
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		// 저장된 로그인 세션 지우기
		session.invalidate();
		return "redirect:/sgh/user/loginForm";
	}
	
	// 회원가입 폼
	@RequestMapping(value="/joinForm", method=RequestMethod.GET)
	public String joinForm() throws Exception {
		return "user/sgh/sgh_member/sgh_join_form";
	}
	
	// 회원가입 처리
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
		rttr.addFlashAttribute("result", result);
		return "redirect:/sgh/user/joinForm";
	}
	
	// 회원가입 중 이메일 인증 처리
	@ResponseBody
	@RequestMapping(value="/emailCheck", method=RequestMethod.GET)
	public int emailCheck(String user_email, Model model) {
		try {
			SghEmailDto sghEmailDto = SghEmailUtil.emailCheck(user_email);
			SghEmailUtil.submitEmailCheck(sghEmailDto, mailSender);
			int randomNum = sghEmailDto.getRandomNum();
			return randomNum;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	// 아이디 중복 확인
	@ResponseBody
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

	// 아이디 찾기 폼
	@RequestMapping(value="/findId", method=RequestMethod.GET)
	public String findId() throws Exception {
		return "user/sgh/sgh_member/sgh_find_id";
	}
	
	// 아이디 찾기 처리
	@RequestMapping(value="/findIdRun", method=RequestMethod.POST)
	public String findIdRun(SghFindDto sghFindDto, Model model, RedirectAttributes rttr) {
		try {
			List<SghFindDto> list = sghUserService.userFindId(sghFindDto);
			String user_email = sghFindDto.getUser_email();
			model.addAttribute("list", list);
			model.addAttribute("user_email", user_email);
			return "user/sgh/sgh_member/sgh_find_mail";
		} catch(Exception e) {
			e.printStackTrace();
		}
		String result = "false";
		rttr.addFlashAttribute("result", result);
		return "redirect:/sgh/user/findId";
	}
	
	// 임시 비밀번호 생성해서 메일 보내기
	@RequestMapping(value="/sendMail", method=RequestMethod.GET)
	public String findPw(String user_id, String to) throws Exception {
		// 임시 비밀번호 생성
		String tmp_pw = SghEmailUtil.emailRandomPwMake();
		// 비밀번호 변경
		sghUserService.userChengePw(user_id, tmp_pw);
		// sghEmailDto 데이터 담기
		SghEmailDto sghEmailDto = SghEmailUtil.tmpPwSubmitEmail(user_id, tmp_pw, to);
		// 메일보내기
		SghEmailUtil.submitEmailCheck(sghEmailDto, mailSender);
		
		return "redirect:/sgh/user/loginForm";
	}
	
	// 비밀번호 찾기 폼
	@RequestMapping(value="/findPw", method=RequestMethod.GET)
	public String findPw() throws Exception {
		return "user/sgh/sgh_member/sgh_find_pw";
	}
	
	// 비밀번호 찾기 처리
	@RequestMapping(value="/findPwRun", method=RequestMethod.POST)
	public String findPwRun(String user_id, Model model) throws Exception {
		System.out.println("user_id :" + user_id);
		SghFindDto sghFindDto = sghUserService.userPwSelect(user_id);
		model.addAttribute("sghFindDto", sghFindDto);
		return "user/sgh/sgh_member/sgh_find_pw_mail_form";
	}
	
	// 관리자 페이지 회원가입 조회 폼
	@RequestMapping(value="/userList", method=RequestMethod.GET)
	public String userList(Model model) throws Exception {
		
		return "user/sgh/sgh_admin/sgh_user/sgh_user_list";
	}
}
