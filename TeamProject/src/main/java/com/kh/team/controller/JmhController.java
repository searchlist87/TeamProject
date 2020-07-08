package com.kh.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/jmh/theater")
public class JmhController {

	@RequestMapping(value="/theaterView", method = RequestMethod.GET)
	public String register() throws Exception {
		return "user/jmh/jmh_theater/jmh_theater";
	}
	
}