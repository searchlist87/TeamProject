package com.kh.team.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.SghMovieScreenVo;
import com.kh.team.domain.SghScreenRegistDto;
import com.kh.team.domain.SghTheaterVo;
import com.kh.team.service.SghMovieScreenService;
import com.kh.team.service.SghTheaterService;

@Controller
@RequestMapping("/sgh/admin/movieScreen")
public class SghTheaterScreenController {

	@Inject
	private SghMovieScreenService sghMovieScreenService;
	@Inject
	private SghTheaterService sghTheaterService;
	
	// 상영관 리스트 폼으로
	@RequestMapping(value="/screenList", method=RequestMethod.GET)
	public String screenList(String theater_code, Model model) throws Exception {
		List<SghMovieScreenVo> screen_list = sghMovieScreenService.getScreenList(theater_code);
		SghTheaterVo sghTheaterVo = sghTheaterService.selectOneTheater(theater_code);
		model.addAttribute("screen_list", screen_list);
		model.addAttribute("sghTheaterVo", sghTheaterVo);
		return "user/sgh/sgh_admin/sgh_admin_movie_screen/sgh_screen_list";
	}
	
	// 상영관 수정 폼으로
	@RequestMapping(value="/screenModify", method=RequestMethod.GET)
	public String screenModify(String screen_code, Model model) throws Exception {
		System.out.println("screen_code :" + screen_code);
		return null;
	}
	
	// 상영관 등록 폼으로
	@RequestMapping(value="/screenRegist", method=RequestMethod.GET)
	public String screenRegist(SghScreenRegistDto sghScreenRegistDto, Model model) throws Exception {
		model.addAttribute("sghScreenRegistDto", sghScreenRegistDto);
		return "user/sgh/sgh_admin/sgh_admin_movie_screen/sgh_screen_regist";
	}
}
