package com.kh.team.jmh.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.JmhMovieTheaterVo;
import com.kh.team.service.JmhMovieTheaterService;

@Controller
@RequestMapping("/jmh/theater")
public class JmhController {
	
	@Inject
	private JmhMovieTheaterService jmhMovieTheaterService;

	@RequestMapping(value="/theaterView", method = RequestMethod.GET)
	public String register(Model  model) throws Exception {
		List<JmhMovieTheaterVo> list = jmhMovieTheaterService.getTheaterInfo();
		model.addAttribute("list", list);
		return "user/jmh/jmh_theater/jmh_theater";
	}
	
	// 관리자 페이지
	@RequestMapping(value="/admin", method = RequestMethod.GET)
	public String admin() throws Exception {
		return "admin/admin";
	}
	
	// 이벤트 페이지
	@RequestMapping(value="/event", method = RequestMethod.GET)
	public String event() throws Exception {
		return "event/event";
	}
	
	
	
	
}