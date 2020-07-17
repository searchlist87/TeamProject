package com.kh.team.jmh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/event")
public class JmhEventController {
	
	// 이벤트 정보 리스트
	@RequestMapping(value="/eventList", method = RequestMethod.GET)
	public String eventList() throws Exception {
		
		return "/user/jmh/jmh_event/jmh_event";
	}
	
	// 이벤트 상세 정보 보기
	@RequestMapping(value="/selectEvent", method = RequestMethod.GET)
	public String selectEventView() throws Exception {
		return "user/jmh/jmh_event/jmh_selectEventView";
	}
}
