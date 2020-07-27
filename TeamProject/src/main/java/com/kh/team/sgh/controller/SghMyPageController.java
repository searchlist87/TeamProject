package com.kh.team.sgh.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.SghMyMovieBuyVo;
import com.kh.team.sgh.service.SghMyPageService;

@Controller
@RequestMapping("/sgh/myPage")
public class SghMyPageController {

	@Inject
	private SghMyPageService sghMyPageService;
	
	@RequestMapping(value="/movieBuyForm", method=RequestMethod.GET)
	public String movieBuyForm(HttpSession session, Model model) throws Exception {
		String user_id = (String)session.getAttribute("user_id");
		List<SghMyMovieBuyVo> sghMyMovieBuyVo = sghMyPageService.getMyMovieBuyList(user_id);
		model.addAttribute("sghMyMovieBuyVo", sghMyMovieBuyVo);
		return "user/jmh/jmh_mypage/jmh_buyMovieList";
	}
}
