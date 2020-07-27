package com.kh.team.jmh.controller;

import java.sql.Date;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.team.domain.JmhEventVo;
import com.kh.team.domain.JmhMovieVo;
import com.kh.team.domain.JmhPagingDto;
import com.kh.team.jmh.service.JmhEventService;

@Controller
@RequestMapping("/event")
public class JmhEventController {
	
	@Inject
	private JmhEventService jmhEventService;
	
	// 이벤트 정보 리스트
	@RequestMapping(value="/eventList", method = RequestMethod.GET)
	public String eventList(Model model, JmhPagingDto jmhPagingDto) throws Exception {
		jmhPagingDto.setPageInfo();
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		String date = year + "-" + month + "-" + day;
		Date event_date =  java.sql.Date.valueOf(date);
		jmhPagingDto.setEvent_date(event_date);
		int count = jmhEventService.getCountEvent(jmhPagingDto);
		jmhPagingDto.setTotalCount(count);
		
		List<JmhEventVo> list = jmhEventService.eventPagingList(jmhPagingDto);

		model.addAttribute("list", list);
		model.addAttribute("jmhPagingDto", jmhPagingDto);

		return "/user/jmh/jmh_event/jmh_event";
	}
	
	// 이벤트 상세 정보 보기
	@RequestMapping(value="/selectEvent", method = RequestMethod.GET)
	public String selectEventView(int event_code, Model model) throws Exception {
		JmhEventVo eventVo = jmhEventService.selectByEvent(event_code);
		model.addAttribute("eventVo", eventVo);
		return "user/jmh/jmh_event/jmh_selectEventView";
	}
	
	// 지난 이벤트 보기
	@RequestMapping(value="/pastEventList", method = RequestMethod.GET)
	public String pastEventList(Model model, JmhPagingDto jmhPagingDto) throws Exception {
		jmhPagingDto.setPageInfo();
		int count = jmhEventService.pastEventCount(jmhPagingDto);
		System.out.println("count :" + count);
		jmhPagingDto.setTotalCount(count);
		List<JmhEventVo> list = jmhEventService.pastEventPagingList(jmhPagingDto);
		
		model.addAttribute("list", list);
		model.addAttribute("jmhPagingDto", jmhPagingDto);
		return "user/jmh/jmh_event/jmh_past_event";
	}
}
