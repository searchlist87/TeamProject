package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/sgh/book")
public class SghBookController {
	
	@RequestMapping(value="/bookingView", method=RequestMethod.GET)
	public String testBookingView() throws Exception {
		
		return "user/sgh/book/bookingView";
	}
	
	@ResponseBody
	@RequestMapping(value="/location", method=RequestMethod.GET)
	public String testLocation(@RequestBody String hi) throws Exception {
		System.out.println("hi :" + hi);
		return null;
	}
}
