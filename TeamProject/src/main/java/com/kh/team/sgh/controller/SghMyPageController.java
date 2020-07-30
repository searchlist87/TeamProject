package com.kh.team.sgh.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.SghMyMovieBuyVo;
import com.kh.team.domain.SghPointListVo;
import com.kh.team.sgh.service.SghMyPageService;
import com.kh.team.sgh.service.SghPointService;

@Controller
@RequestMapping("/sgh/myPage")
public class SghMyPageController {

	@Inject
	private SghMyPageService sghMyPageService;
	@Inject
	private SghPointService sghPointService;
	
	// 영화 구매 내역 폼
	@RequestMapping(value="/movieBuyForm", method=RequestMethod.GET)
	public String movieBuyForm(HttpSession session, Model model) throws Exception {
		String user_id = (String)session.getAttribute("user_id");
		List<SghMyMovieBuyVo> sghMyMovieBuyVo = sghMyPageService.getMyMovieBuyList(user_id);
		model.addAttribute("sghMyMovieBuyVo", sghMyMovieBuyVo);
		return "user/sgh/sgh_myPage/sgh_buyMovieList";
	}
	
	// 포인트 내역 폼
	@RequestMapping(value="/pointList", method=RequestMethod.GET)
	public String pointListForm(HttpSession session, Model model) throws Exception {
		String user_id = (String)session.getAttribute("user_id");
		List<SghPointListVo> point_list = sghPointService.getPointList(user_id);
		model.addAttribute("point_list", point_list);
		return "user/sgh/sgh_myPage/sgh_pointList";
	}
}
