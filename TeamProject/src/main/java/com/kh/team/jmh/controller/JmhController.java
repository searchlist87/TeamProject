package com.kh.team.jmh.controller;

import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.JmhAreaVo;
import com.kh.team.domain.JmhEventVo;
import com.kh.team.domain.JmhMovieTheaterVo;
import com.kh.team.jmh.service.JmhEventService;
import com.kh.team.jmh.service.JmhMovieTheaterService;

@Controller
@RequestMapping("/jmh/theater")
public class JmhController {
	
	@Inject
	private JmhMovieTheaterService jmhMovieTheaterService;
	
	@Inject
	private JmhEventService jmhEventService;

	@RequestMapping(value="/theaterView", method = RequestMethod.GET)
	public String register(Model  model) throws Exception {
		List<JmhMovieTheaterVo> list = jmhMovieTheaterService.getTheaterInfo();
		
		List<JmhAreaVo> areaVo = jmhMovieTheaterService.getArea();
		
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		String date = year + "-" + month + "-" + day;
		Date event_date =  java.sql.Date.valueOf(date);
		
		List<JmhEventVo> eventVo = jmhEventService.selectEventThree(event_date);
		model.addAttribute("eventVo", eventVo);
		model.addAttribute("areaVo", areaVo);
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